#!/usr/bin/env python3
"""
GRPO Training Script using Unsloth for Blocksworld PDDL planning models.

专门用于 Blocksworld 场景，使用详细的奖励计算（Safety Score + Goal Score）

Dataset format (JSONL per line):
- prompt (str)               : required
- response (str, optional)   : UNUSED for GRPO (model在线生成)
- class_label (str, optional): one of compute_reward keys; 作为备份标签
- meta (dict, optional)      : 包含 domain_file / problem_file 等，用于 VAL 校验

Usage:
    python train_grpo_unsloth_blocksworld.py --base_model <model_path_or_hub_id> --dataset <ppo_dataset.jsonl> --output_dir <output_path>
"""
import unsloth
import argparse
import json
import logging
import os
import re
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple

import torch
import statistics
from collections import Counter
from datasets import Dataset
from trl import GRPOConfig, GRPOTrainer

from unsloth import FastLanguageModel
from utils import _classify_result, validate_solution
from utils_blocksworld import (
    blocksworld_reward,
    normalize_atom,
    simulate_plan,
    State,
    ActionStr,
)
import wandb

try:
    # Prefer Unsloth's helper if available
    from unsloth import is_bfloat16_supported as _unsloth_bf16_ok
except Exception:
    _unsloth_bf16_ok = None

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("grpo_unsloth_blocksworld")
REPO_ROOT = Path(__file__).resolve().parent.parent


# -----------------------------------------------------------------------------
# PDDL Parsing for Blocksworld
# -----------------------------------------------------------------------------
def parse_blocksworld_pddl(problem_file: str) -> Optional[Dict[str, Any]]:
    """
    解析 blocksworld PDDL 文件，提取初始状态、目标状态和约束
    
    返回: {
        "initial_state": Set[str],
        "goal_state": Set[str],
        "constraint_first": Optional[str],
        "constraint_second": Optional[str]
    }
    """
    try:
        with open(problem_file, 'r') as f:
            content = f.read()
    except Exception as e:
        logger.warning(f"Failed to read PDDL file {problem_file}: {e}")
        return None
    
    result = {
        "initial_state": set(),
        "goal_state": set(),
        "constraint_first": None,
        "constraint_second": None
    }
    
    # 提取初始状态 (:init ...)
    init_match = re.search(r'\(:init\s+(.*?)\)\s*\(:goal', content, re.DOTALL)
    if init_match:
        init_content = init_match.group(1)
        # 提取所有原子命题
        atoms = re.findall(r'\([^)]+\)', init_content)
        result["initial_state"] = {atom.strip() for atom in atoms}
    
    # 提取目标状态 (:goal ...)
    goal_match = re.search(r'\(:goal\s+\(and\s+(.*?)\)\s*\)', content, re.DOTALL)
    if goal_match:
        goal_content = goal_match.group(1)
        atoms = re.findall(r'\([^)]+\)', goal_content)
        result["goal_state"] = {atom.strip() for atom in atoms}
    else:
        # 尝试匹配单个目标（没有 and）
        goal_match_single = re.search(r'\(:goal\s+\(([^)]+)\)\s*\)', content, re.DOTALL)
        if goal_match_single:
            goal_atom = f"({goal_match_single.group(1).strip()})"
            result["goal_state"] = {goal_atom}
    
    # 提取约束 (:constraints ...)
    # 匹配 sometime-before 约束
    constraint_match = re.search(
        r'\(:constraints\s+\(sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)\s*\)\s*\)',
        content, re.DOTALL
    )
    if constraint_match:
        result["constraint_first"] = f"({constraint_match.group(1).strip()})"
        result["constraint_second"] = f"({constraint_match.group(2).strip()})"
    
    return result


def parse_plan_from_completion(completion: str) -> List[ActionStr]:
    """
    从 completion 文本中解析出计划序列
    
    返回: List[ActionStr] 例如 ["(pickup b1)", "(stack b1 b2)"]
    """
    # 提取所有动作（格式: (action_name ...)）
    actions = re.findall(r'\([^)]+\)', completion)
    # 过滤掉明显不是动作的行（比如注释、说明等）
    valid_actions = []
    for action in actions:
        action = action.strip()
        # blocksworld 的动作: pickup, putdown, stack, unstack
        if any(action.startswith(f"({op}") for op in ["pickup", "putdown", "stack", "unstack"]):
            valid_actions.append(action)
    return valid_actions


# -----------------------------------------------------------------------------
# Reward
# -----------------------------------------------------------------------------
def compute_reward(class_label: str) -> float:
    """
    简单奖励计算（作为 fallback）
    """
    reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.5,
        "precondition_violation": -0.7,
        "safety_constraints_violation": -1.0,
    }
    if class_label not in reward_table:
        raise ValueError(f"Unknown class_label='{class_label}'. Expected one of {list(reward_table)}")
    return reward_table[class_label]


def classify_with_validator(meta: Any, response_text: str) -> Optional[str]:
    """Run VAL validation and classify using utils._classify_result."""
    if not isinstance(meta, dict):
        return None
    domain_rel = meta.get("domain_file")
    problem_rel = meta.get("problem_file")
    if not domain_rel or not problem_rel:
        return None
    domain_path = REPO_ROOT / domain_rel
    problem_path = REPO_ROOT / problem_rel
    if not domain_path.exists() or not problem_path.exists():
        return None
    try:
        _, _, stdout, _, _ = validate_solution(str(domain_path), str(problem_path), response_text)
        return _classify_result(stdout)
    except Exception as exc:  # pragma: no cover - defensive
        logger.warning(f"Validation failed for {problem_rel}: {exc}")
        return None


import os
from collections import Counter

DEBUG_FILE = "reward_debug_blocksworld.log"

def grpo_reward_func(
    prompts: List[str],
    completions: List[str],
    meta: Optional[List[Any]] = None,
    class_label: Optional[List[Optional[str]]] = None,
    trainer_state=None,
    **kwargs,
) -> List[float]:

    n = len(completions)
    if meta is None:
        meta = [None] * n
    if class_label is None:
        class_label = [None] * n

    rewards: List[float] = []
    all_labels: List[str] = []
    all_scenarios: List[str] = []
    detailed_rewards_info = []  # 存储详细奖励信息用于日志

    # ---------- debug: 打开文件，只 append ----------
    if not os.path.exists(DEBUG_FILE):
        with open(DEBUG_FILE, "w") as f:
            f.write("=== GRPO BLOCKSWORLD REWARD DEBUG LOG ===\n")

    for i, (prompt, completion, m, label) in enumerate(
        zip(prompts, completions, meta, class_label)
    ):
        
        # 提取场景信息
        scenario = "unknown"
        if isinstance(m, dict):
            scenario = m.get("scenario", "unknown")
            if not isinstance(scenario, str):
                scenario = "unknown"
        all_scenarios.append(scenario)

        # 1. validator 推断 label
        inferred_label = classify_with_validator(m, completion)

        # 2. fallback：使用数据集原始 label
        if inferred_label is None and isinstance(label, str):
            inferred_label = label

        # 3. 保存 label
        if inferred_label is not None:
            all_labels.append(inferred_label)
        else:
            inferred_label = "unknown"
            all_labels.append("unknown")

        # 4. 计算 reward - 使用 blocksworld 的详细奖励计算
        r = 0.0
        reward_info = {
            "method": "fallback",
            "base_reward": None,
            "safety_score": None,
            "goal_score": None,
            "dense_reward": None,
            "final_reward": None,
        }
        
        try:
            if isinstance(m, dict):
                problem_file = m.get("problem_file")
                if problem_file:
                    problem_path = REPO_ROOT / problem_file
                    if problem_path.exists():
                        # 解析 PDDL 文件
                        pddl_info = parse_blocksworld_pddl(str(problem_path))
                        if pddl_info:
                            # 解析计划
                            planning_sequences = parse_plan_from_completion(completion)
                            
                            if planning_sequences:
                                # 规范化状态原子
                                initial_state: State = {normalize_atom(atom) for atom in pddl_info["initial_state"]}
                                goal_state: State = {normalize_atom(atom) for atom in pddl_info["goal_state"]}
                                
                                constraint_first = pddl_info.get("constraint_first")
                                constraint_second = pddl_info.get("constraint_second")
                                
                                if constraint_first and constraint_second:
                                    constraint_first = normalize_atom(constraint_first)
                                    constraint_second = normalize_atom(constraint_second)
                                
                                # 使用 blocksworld_reward 计算奖励
                                class_label_for_reward = inferred_label if inferred_label != "unknown" else "goal_not_satisfied"
                                
                                r = blocksworld_reward(
                                    class_label_for_reward,
                                    planning_sequences,
                                    initial_state,
                                    goal_state,
                                    constraint_first=constraint_first,
                                    constraint_second=constraint_second,
                                )
                                
                                reward_info["method"] = "blocksworld_detailed"
                                reward_info["final_reward"] = r
                                
                                # 尝试获取详细分数（通过模拟计算）
                                try:
                                    traj, _ = simulate_plan(initial_state, planning_sequences)
                                    if traj:
                                        from utils_blocksworld import safety_score_sometime_before, goal_score
                                        last_state = traj[-1]
                                        s_score = safety_score_sometime_before(
                                            traj, constraint_first, constraint_second
                                        )
                                        g_score = goal_score(last_state, goal_state)
                                        
                                        reward_info["safety_score"] = s_score
                                        reward_info["goal_score"] = g_score
                                        reward_info["dense_reward"] = 0.7 * s_score + 0.3 * g_score
                                        
                                        # 计算 base reward
                                        base_reward_table = {
                                            "success_plans": 1.0,
                                            "goal_not_satisfied": 0.0,
                                            "plan_format_error": -0.5,
                                            "precondition_violation": -0.7,
                                            "safety_constraints_violation": -1.0,
                                        }
                                        reward_info["base_reward"] = base_reward_table.get(class_label_for_reward, 0.0)
                                except Exception as e:
                                    logger.debug(f"Failed to compute detailed scores: {e}")
                            else:
                                # 无法解析计划，回退到简单奖励
                                r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
                                reward_info["method"] = "simple_fallback_no_plan"
                        else:
                            # PDDL 解析失败，回退到简单奖励
                            r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
                            reward_info["method"] = "simple_fallback_parse_failed"
                    else:
                        # 文件不存在，回退到简单奖励
                        r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
                        reward_info["method"] = "simple_fallback_no_file"
                else:
                    # 没有 problem_file，回退到简单奖励
                    r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
                    reward_info["method"] = "simple_fallback_no_meta"
            else:
                # 没有 meta，回退到简单奖励
                r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
                reward_info["method"] = "simple_fallback_no_meta_dict"
        except Exception as e:
            # 任何错误都回退到简单奖励
            logger.warning(f"Blocksworld reward calculation failed for sample {i}: {e}, falling back to simple reward")
            try:
                r = compute_reward(inferred_label) if inferred_label != "unknown" else 0.0
            except:
                r = 0.0
            reward_info["method"] = "simple_fallback_exception"
            reward_info["error"] = str(e)

        rewards.append(float(r))
        detailed_rewards_info.append(reward_info)

    # ============ 统计并 wandb.log ============
    if all_labels:
        counts = Counter(all_labels)
        total = len(all_labels)

        log_dict = {"stats/total_samples": total}

        for category in [
            "success_plans",
            "goal_not_satisfied",
            "plan_format_error",
            "precondition_violation",
            "safety_constraints_violation",
            "unknown",
        ]:
            c = counts.get(category, 0)
            log_dict[f"stats/count_{category}"] = c
            log_dict[f"stats/rate_{category}"] = c / total

        # 统计场景分布
        if all_scenarios:
            scenario_counts = Counter(all_scenarios)
            main_scenario = scenario_counts.most_common(1)[0][0] if scenario_counts else "unknown"
            log_dict["batch/main_scenario"] = main_scenario
            
            for scenario_name, count in scenario_counts.items():
                log_dict[f"batch/scenario_count_{scenario_name}"] = count
                log_dict[f"batch/scenario_rate_{scenario_name}"] = count / total

        # 计算整个 batch 的 reward 的 mean 和 std
        if rewards:
            reward_mean = statistics.mean(rewards)
            reward_std = statistics.stdev(rewards) if len(rewards) > 1 else 0.0
            log_dict["stats/reward_mean"] = reward_mean
            log_dict["stats/reward_std"] = reward_std

            # 统计详细奖励信息
            detailed_methods = Counter([info["method"] for info in detailed_rewards_info])
            for method, count in detailed_methods.items():
                log_dict[f"reward_method/count_{method}"] = count
                log_dict[f"reward_method/rate_{method}"] = count / total

            # 计算详细分数的平均值（如果可用）
            safety_scores = [info["safety_score"] for info in detailed_rewards_info if info["safety_score"] is not None]
            goal_scores = [info["goal_score"] for info in detailed_rewards_info if info["goal_score"] is not None]
            dense_rewards = [info["dense_reward"] for info in detailed_rewards_info if info["dense_reward"] is not None]
            
            if safety_scores:
                log_dict["stats/safety_score_mean"] = statistics.mean(safety_scores)
                log_dict["stats/safety_score_std"] = statistics.stdev(safety_scores) if len(safety_scores) > 1 else 0.0
            if goal_scores:
                log_dict["stats/goal_score_mean"] = statistics.mean(goal_scores)
                log_dict["stats/goal_score_std"] = statistics.stdev(goal_scores) if len(goal_scores) > 1 else 0.0
            if dense_rewards:
                log_dict["stats/dense_reward_mean"] = statistics.mean(dense_rewards)
                log_dict["stats/dense_reward_std"] = statistics.stdev(dense_rewards) if len(dense_rewards) > 1 else 0.0

            # ============ 强制打印（stdout + 文件）- 整个 batch 的统计 ============
            main_scenario_str = log_dict.get("batch/main_scenario", "unknown")
            msg = (
                f"[STEP {trainer_state.global_step if trainer_state else '?'}] "
                f"scenario={main_scenario_str}, "
                f"batch_reward_mean={reward_mean:.4f}, batch_reward_std={reward_std:.4f}, "
                f"detailed_reward_rate={detailed_methods.get('blocksworld_detailed', 0) / total * 100:.1f}%\n"
            )
            # 写到文件：永远有效
            with open(DEBUG_FILE, "a") as f:
                f.write(msg)

        # wandb 强制 log（确保打印）
        if wandb is not None:
            try:
                wandb.log(log_dict)
            except Exception as e:
                print("[wandb.log ERROR]", e)

        # 同步写到 debug 文件
        with open(DEBUG_FILE, "a") as f:
            f.write(f"stats={log_dict}\n")

    return rewards


def load_grpo_dataset(
    dataset_path: str,
    prompt_field: str,
    response_field: Optional[str],
    class_label_field: str,
) -> Dataset:
    """Load GRPO dataset from JSONL file."""
    logger.info(f"Loading GRPO dataset from {dataset_path}")

    data: List[Dict[str, Any]] = []
    invalid_count = 0
    with open(dataset_path, "r", encoding="utf-8") as f:
        for line_num, line in enumerate(f, 1):
            if not line.strip():
                continue
            try:
                record = json.loads(line)
            except json.JSONDecodeError as e:
                invalid_count += 1
                logger.warning(f"Line {line_num}: JSON decode error: {e}, skipping")
                continue

            prompt = record.get(prompt_field, "")
            if not prompt or not isinstance(prompt, str):
                invalid_count += 1
                logger.warning(f"Line {line_num}: Missing or invalid '{prompt_field}' field, skipping")
                continue

            entry: Dict[str, Any] = {"prompt": prompt}

            # 可选：预存的 response（GRPO 实际不会用，但你可以将来用在 reward 里）
            if response_field and isinstance(record.get(response_field), str):
                entry["response"] = record[response_field]

            # 可选：已有的 class_label（作为 fallback）
            if isinstance(record.get(class_label_field), str):
                entry["class_label"] = record[class_label_field]

            # PDDL 校验用 meta
            if isinstance(record.get("meta"), dict):
                entry["meta"] = record["meta"]

            data.append(entry)

    logger.info(f"Loaded {len(data)} GRPO samples (skipped {invalid_count} invalid records)")
    if len(data) == 0:
        raise ValueError("No valid GRPO samples found in dataset!")

    # 按照 meta 中的 scenario 排序，确保每个 batch 都是单一场景
    def get_scenario(entry: Dict[str, Any]) -> str:
        """从 entry 的 meta 中提取 scenario，如果没有则返回 'unknown'"""
        meta = entry.get("meta")
        if isinstance(meta, dict):
            scenario = meta.get("scenario", "unknown")
            if isinstance(scenario, str):
                return scenario
        return "unknown"

    # 按 scenario 排序
    data_sorted = sorted(data, key=get_scenario)
    
    # 统计各场景的数量
    scenario_counts = {}
    for entry in data_sorted:
        scenario = get_scenario(entry)
        scenario_counts[scenario] = scenario_counts.get(scenario, 0) + 1
    
    logger.info(f"Dataset sorted by scenario. Scenario distribution: {scenario_counts}")

    ds = Dataset.from_list(data_sorted)
    required = {"prompt"}
    missing = required - set(ds.column_names)
    if missing:
        raise ValueError(
            f"GRPO dataset missing required columns: {missing}; need: {sorted(list(required))}"
        )
    return ds


# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------
def main():
    parser = argparse.ArgumentParser(description="Train a model using GRPO with Unsloth on Blocksworld PDDL planning data")

    # Required
    parser.add_argument("--base_model", required=True, help="Path or HF Hub ID of the base (SFT) model")
    parser.add_argument("--dataset", required=True, help="Path to dataset JSONL file (prompts + meta etc.)")
    parser.add_argument("--output_dir", required=True, help="Output directory for trained model")

    # Training / GRPO 基本参数
    parser.add_argument("--num_epochs", type=float, default=1.0, help="Number of GRPO training epochs")
    parser.add_argument("--batch_size", type=int, default=4, help="per_device_train_batch_size for GRPO")
    parser.add_argument("--learning_rate", type=float, default=1e-5, help="Learning rate")
    parser.add_argument("--gradient_accumulation_steps", type=int, default=1, help="Gradient accumulation steps")
    parser.add_argument("--max_grad_norm", type=float, default=1.0, help="Gradient clipping")
    parser.add_argument("--num_generations", type=int, default=4, help="G: number of completions per prompt")
    parser.add_argument("--eval_steps", type=int, default=30, help="Evaluate every N steps (0 to disable)")
    parser.add_argument("--eval_strategy", type=str, default="steps", help="Evaluation strategy")
    parser.add_argument("--beta", type=float, default=0.02, help="KL penalty coefficient (beta). Lower values reduce KL penalty in loss. If loss is too high due to large KL divergence, try reducing this (e.g., 0.001, 0.01)")

    # Generation
    parser.add_argument("--max_prompt_length", type=int, default=4096, help="Maximum prompt length")
    parser.add_argument("--max_new_tokens", type=int, default=256, help="Max completion length for GRPO")
    parser.add_argument("--temperature", type=float, default=0.8, help="Sampling temperature")
    parser.add_argument("--top_p", type=float, default=0.9, help="Top-p nucleus sampling")
    parser.add_argument("--top_k", type=int, default=50, help="Top-k sampling")

    # Logging / saving
    parser.add_argument("--save_steps", type=int, default=50, help="Save checkpoint every N steps (0 to disable)")
    parser.add_argument("--logging_steps", type=int, default=10, help="Log every N steps")
    parser.add_argument("--no_wandb", action="store_true", help="Disable Weights & Biases logging")
    parser.add_argument("--max_steps", type=int, default=1000, help="Maximum number of training steps")
    parser.add_argument("--wandb_project", default="pddl-grpo-blocksworld", help="W&B project name")
    parser.add_argument("--run_name", default=None, help="Run name for logging")

    # Dataset field names
    parser.add_argument("--prompt_field", default="prompt", help="Field name for prompts")
    parser.add_argument("--response_field", default="response", help="Field name for optional stored responses")
    parser.add_argument("--class_label_field", default="class_label", help="Field name for reward class labels")

    # Model options
    parser.add_argument("--no_4bit", action="store_true", help="Disable 4-bit quantization (default is 4-bit on)")
    parser.add_argument("--use_gradient_checkpointing", action="store_true", help="Enable Unsloth gradient checkpointing")
    parser.add_argument("--dataloader_num_workers", type=int, default=0, help="(Unused by GRPOTrainer, kept for compat)")

    args = parser.parse_args()

    if not os.path.exists(args.dataset):
        raise ValueError(f"Dataset path does not exist: {args.dataset}")

    os.makedirs(args.output_dir, exist_ok=True)

    # 默认使用 4-bit 量化（除非明确禁用）
    load_in_4bit = not args.no_4bit
    if load_in_4bit:
        logger.info("Loading model in 4-bit quantization (default)")
    else:
        logger.warning("Loading model in full precision (4-bit quantization disabled)")

    # W&B（默认启用，通过 GRPOConfig.report_to 集成，不手动 wandb.init）
    use_wandb = not args.no_wandb

    # 模型类型（用于日志提示）
    model_name = args.base_model
    if "llama" in model_name.lower():
        model_type = "llama"
    elif "mistral" in model_name.lower() or "mixtral" in model_name.lower():
        model_type = "mistral/mixtral"
    elif "qwen" in model_name.lower():
        model_type = "qwen"
    else:
        model_type = "auto"
    logger.info(f"Detected/assumed model family: {model_type}")

    # 选择混精度：优先 bf16，不支持则用 fp16（仅 CUDA）
    bf16_ok = bool(_unsloth_bf16_ok()) if _unsloth_bf16_ok is not None else torch.cuda.is_bf16_supported()
    use_fp16 = torch.cuda.is_available() and not bf16_ok

    # 加载模型（注意：不要把 use_gradient_checkpointing 传到 from_pretrained）
    logger.info(f"Loading model with Unsloth from {args.base_model}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=args.base_model,
        max_seq_length=args.max_prompt_length + args.max_new_tokens,
        dtype=None,  # auto
        load_in_4bit=load_in_4bit,
        load_in_8bit=False,
    )

    # 训练前设置（Unsloth 的 GC 建议用字符串 "unsloth"）
    gc_flag: Any = "unsloth" if args.use_gradient_checkpointing else False
    FastLanguageModel.for_training(model, use_gradient_checkpointing=gc_flag)

    # 禁用 KV cache，避免显存波动
    if hasattr(model, "config"):
        model.config.use_cache = False

    # tokenizer pad token + **GRPO 要求左侧 padding**
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    tokenizer.padding_side = "left"

    # 加载数据（只保留 prompt / response / class_label / meta）
    dataset = load_grpo_dataset(
        args.dataset,
        prompt_field=args.prompt_field,
        response_field=args.response_field,
        class_label_field=args.class_label_field,
    )
    logger.info(f"Training dataset size: {len(dataset)}; columns: {dataset.column_names}")
    
    # Split 时保持顺序（不 shuffle），因为我们已经在 load_grpo_dataset 中按 scenario 排序了
    split = dataset.train_test_split(test_size=0.1, seed=42, shuffle=False)
    train_dataset, eval_dataset = split["train"], split["test"]
    
    # 对 train 和 eval 数据集分别按 scenario 重新排序，确保每个 batch 都是单一场景
    def get_scenario_from_row(row):
        """从 dataset row 中提取 scenario"""
        meta = row.get("meta")
        if isinstance(meta, dict):
            scenario = meta.get("scenario", "unknown")
            if isinstance(scenario, str):
                return scenario
        return "unknown"
    
    # 将 Dataset 转为 list，排序后再转回 Dataset
    train_data = [train_dataset[i] for i in range(len(train_dataset))]
    eval_data = [eval_dataset[i] for i in range(len(eval_dataset))]
    
    train_data_sorted = sorted(train_data, key=get_scenario_from_row)
    eval_data_sorted = sorted(eval_data, key=get_scenario_from_row)
    
    train_dataset = Dataset.from_list(train_data_sorted)
    eval_dataset = Dataset.from_list(eval_data_sorted)
    
    logger.info(f"Training dataset size: {len(train_dataset)}")
    logger.info(f"Evaluation dataset size: {len(eval_dataset)}")
    
    # 验证排序后的场景分布
    train_scenarios = [get_scenario_from_row(train_dataset[i]) for i in range(min(100, len(train_dataset)))]
    eval_scenarios = [get_scenario_from_row(eval_dataset[i]) for i in range(min(100, len(eval_dataset)))]
    logger.info(f"First 100 train samples scenarios: {Counter(train_scenarios)}")
    logger.info(f"First 100 eval samples scenarios: {Counter(eval_scenarios)}")

    # 手动初始化 wandb（参考 pddl_finetune.py）
    if use_wandb:
        wandb_run_name = args.run_name or f"grpo-blocksworld-{os.path.basename(args.base_model)}"
        wandb.init(
            project=args.wandb_project,
            name=wandb_run_name,
            config={
                "model_name": args.base_model,
                "model_type": model_type,
                "dataset": args.dataset,
                "output_dir": args.output_dir,
                "max_seq_length": args.max_prompt_length + args.max_new_tokens,
                "load_in_4bit": load_in_4bit,
                "dataset_size": len(dataset),
                "train_size": len(train_dataset),
                "eval_size": len(eval_dataset),
                "batch_size": args.batch_size,
                "gradient_accumulation_steps": args.gradient_accumulation_steps,
                "learning_rate": args.learning_rate,
                "max_grad_norm": args.max_grad_norm,
                "num_generations": args.num_generations,
                "temperature": args.temperature,
                "top_p": args.top_p,
                "top_k": args.top_k,
                "beta": args.beta,
                "max_steps": args.max_steps,
                "eval_steps": args.eval_steps,
                "eval_strategy": args.eval_strategy,
                "reward_method": "blocksworld_detailed",  # 标记使用详细奖励计算
            }
        )

    # GRPOConfig：对应原来 PPOConfig 的超参
    # 注意：如果 loss 过大（通常由 KL 散度过大导致），可以尝试：
    # 1. 降低 beta（减小 KL 惩罚，如 --beta 0.001 或 0.01）
    # 2. 降低学习率（让模型更新更温和，减少 KL 散度）
    # 3. 增加 max_grad_norm（允许更大的梯度，但需谨慎）
    grpo_config = GRPOConfig(
        output_dir=args.output_dir,

        # 用 max_steps 控制总训练量
        max_steps=args.max_steps,        # 比如 5000

        per_device_train_batch_size=args.batch_size,
        gradient_accumulation_steps=args.gradient_accumulation_steps,
        learning_rate=args.learning_rate,  # 如果 loss 过大，可以降低学习率（如 5e-6）
        max_grad_norm=args.max_grad_norm,  # 梯度裁剪，防止梯度爆炸
        bf16=bf16_ok,
        fp16=use_fp16,

        logging_steps=args.logging_steps,
        save_steps=args.save_steps if args.save_steps > 0 else 0,
        save_strategy="steps" if args.save_steps > 0 else "no",

        report_to=["wandb"] if use_wandb else [],
        run_name=args.run_name or f"grpo-blocksworld-{os.path.basename(args.base_model)}",

        # Data / generation 相关
        remove_unused_columns=False,
        max_prompt_length=args.max_prompt_length,
        max_completion_length=args.max_new_tokens,
        num_generations=args.num_generations,
        temperature=args.temperature,
        top_p=args.top_p,
        top_k=args.top_k,
        beta=args.beta,  # KL penalty coefficient. Lower if loss is too high due to large KL divergence
        save_total_limit=2,
    )

    # 构建 GRPOTrainer
    trainer = GRPOTrainer(
        model=model,
        args=grpo_config,
        reward_funcs=grpo_reward_func,
        train_dataset=train_dataset,
        processing_class=tokenizer,
        eval_dataset=eval_dataset,
        eval_strategy=args.eval_strategy,
        eval_steps=args.eval_steps,
    )

    logger.info("Starting GRPO training with Blocksworld detailed reward calculation...")
    trainer.train()

    logger.info(f"Saving final model to {args.output_dir}")
    trainer.save_model(args.output_dir)
    tokenizer.save_pretrained(args.output_dir)

    logger.info("GRPO training completed successfully!")


if __name__ == "__main__":
    main()