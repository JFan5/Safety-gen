import os
import re
import shutil
import subprocess
import statistics
import tempfile
from collections import Counter
from pathlib import Path
from typing import Any, Dict, List, Optional


def log_reward_batch_stats(
    all_labels: List[str],
    all_scenarios: List[str],
    rewards: List[float],
    reward_methods: List[str],
    trainer_state=None,
    debug_file: str = "reward_debug.log",
    logging_steps: int = 10,
    log_sample_plan: bool = False,
    sample_idx: int = 0,
    sample_completion: str = "",
    sample_meta: Optional[Dict] = None,
    # ========== 新增可选参数 (GRPO group-level 统计) ==========
    k: int = 1,
    problem_files: Optional[List[str]] = None,
    domains: Optional[List[str]] = None,
    stdout_lens: Optional[List[int]] = None,
    verbose_batch_samples: bool = False,
    verbose_max_groups: int = 1,
    verbose_max_k: int = 8,
    only_on_anomaly: bool = True,
    anomaly_zero_std_threshold: float = 0.5,
) -> Dict[str, Any]:
    """
    统一的 reward batch 统计和打印方法（无 wandb 依赖）。

    每个 batch 都会通过 print 输出关键统计信息，便于日志采集。
    支持 GRPO group-level 统计，帮助诊断 "reward std=0 / 学不动" 问题。

    Args:
        all_labels: 所有样本的标签列表
        all_scenarios: 所有样本的场景列表
        rewards: 所有样本的 reward 列表
        reward_methods: 所有样本的 reward 计算方法列表
        trainer_state: Trainer state 对象（用于获取 global_step）
        debug_file: Debug 日志文件路径（保留参数但不再写入）
        logging_steps: 打印间隔步数
        log_sample_plan: 是否打印单个样本的 plan
        sample_idx: 样本索引（用于打印单个样本）
        sample_completion: 样本的 completion（用于打印单个样本）
        sample_meta: 样本的 meta（用于打印单个样本）
        k: 每个 prompt 的采样次数（group size），用于 GRPO group 统计
        problem_files: 与 all_labels 同长度，每条 completion 对应的 problem_file
        domains: 与 all_labels 同长度，每条 completion 的 domain；若为 None 则用 all_scenarios
        stdout_lens: 与 all_labels 同长度，每条 completion 的 stdout_len（可选）
        verbose_batch_samples: 是否在每个 batch 展开打印多个样本
        verbose_max_groups: 展开打印的 group 数
        verbose_max_k: 每个 group 最多打印多少条采样
        only_on_anomaly: 只在检测到异常时展开打印
        anomaly_zero_std_threshold: 当 zero_std_group_rate 超过该阈值视为异常

    Returns:
        log_dict: 统计字典（保留供其他调用方使用）

    Usage Example:
        # 在 GRPO reward function 中调用：
        log_reward_batch_stats(
            all_labels=labels,           # ["success_plans", "precondition_violation", ...]
            all_scenarios=scenarios,     # ["blocksworld", "ferry", ...]
            rewards=reward_list,         # [1.0, -0.3, -0.5, ...]
            reward_methods=methods,      # ["dense_v2", "dense_v2", ...]
            trainer_state=trainer.state,
            logging_steps=20,
            k=8,                          # GRPO num_generations
            problem_files=problem_files,  # ["pddl3/blocksworld/xxx.pddl", ...]
            domains=domains,              # ["blocksworld", "ferry", ...] 或 None 用 all_scenarios
            stdout_lens=stdout_lens,      # [1234, 567, ...] 或 None
            verbose_batch_samples=True,   # 展开打印
            only_on_anomaly=True,         # 只在异常时打印
            anomaly_zero_std_threshold=0.5,
        )
    """
    log_dict: Dict[str, Any] = {}

    # 使用 domains 或 fallback 到 all_scenarios
    effective_domains = domains if domains is not None else all_scenarios

    # 打印单个样本的 plan（如果需要，仍按 logging_steps 间隔）
    if log_sample_plan:
        should_log = (
            trainer_state is not None
            and trainer_state.global_step % logging_steps == 0
            and sample_idx == 0  # 只在每个 batch 的第一个样本时打印
        )
        if should_log:
            step_str = str(trainer_state.global_step)
            scenario = "unknown"
            problem_rel = ""
            if isinstance(sample_meta, dict):
                scenario = sample_meta.get("scenario", "unknown")
                if not isinstance(scenario, str):
                    scenario = "unknown"
                problem_rel = sample_meta.get("problem_file", "")
                if not isinstance(problem_rel, str):
                    problem_rel = ""

            # 截断 completion 避免刷屏
            truncated_completion = sample_completion[:2000]
            if len(sample_completion) > 2000:
                truncated_completion += f"\n... [truncated, total {len(sample_completion)} chars]"

            print("\n" + "=" * 80)
            print(f"[REWARD] step={step_str} sample_idx={sample_idx} scenario={scenario} problem_file={problem_rel}")
            print("[REWARD] completion(plan):")
            print(truncated_completion)
            print("=" * 80 + "\n")

    # 统计并构建 log_dict
    if all_labels:
        counts = Counter(all_labels)
        total = len(all_labels)

        log_dict = {"stats/total_samples": total}

        # 定义所有类别（确保每个 category 都有 count）
        categories = [
            "success_plans",
            "goal_not_satisfied",
            "plan_format_error",
            "precondition_violation",
            "safety_constraints_violation",
            "unknown",
        ]

        for category in categories:
            c = counts.get(category, 0)
            log_dict[f"stats/count_{category}"] = c
            log_dict[f"stats/rate_{category}"] = c / total

        # 统计场景分布
        main_scenario_str = "unknown"
        if all_scenarios:
            scenario_counts = Counter(all_scenarios)
            main_scenario_str = scenario_counts.most_common(1)[0][0] if scenario_counts else "unknown"
            log_dict["batch/main_scenario"] = main_scenario_str

            for scenario_name, count in scenario_counts.items():
                log_dict[f"batch/scenario_count_{scenario_name}"] = count
                log_dict[f"batch/scenario_rate_{scenario_name}"] = count / total

        # 统计 domain 分布（top 3）
        top_domains_str = ""
        if effective_domains:
            domain_counts = Counter(effective_domains)
            top3 = domain_counts.most_common(3)
            top_domains_str = ",".join(f"{d}:{c}" for d, c in top3)
            for domain_name, count in domain_counts.items():
                log_dict[f"batch/domain_count_{domain_name}"] = count
                log_dict[f"batch/domain_rate_{domain_name}"] = count / total

        # 计算 reward 统计
        reward_mean = 0.0
        reward_std = 0.0
        if rewards:
            reward_mean = statistics.mean(rewards)
            reward_std = statistics.stdev(rewards) if len(rewards) > 1 else 0.0
            log_dict["stats/reward_mean"] = reward_mean
            log_dict["stats/reward_std"] = reward_std

            # 统计 reward 方法使用情况
            if reward_methods:
                method_counts = Counter(reward_methods)
                for method, count in method_counts.items():
                    log_dict[f"reward_method/count_{method}"] = count
                    log_dict[f"reward_method/rate_{method}"] = count / total

        # ========== GRPO Group-level 统计 ==========
        n_groups = 0
        zero_std_group_rate = 0.0
        mean_group_std = 0.0
        mean_unique_categories = 0.0
        mean_unique_rewards = 0.0
        group_stds: List[float] = []
        group_data: List[Dict] = []  # 保存每个 group 的详细信息用于后续打印

        if k > 1 and rewards and len(rewards) >= k:
            n_groups = len(rewards) // k
            if n_groups > 0:
                zero_std_count = 0
                sum_group_std = 0.0
                sum_unique_cat = 0.0
                sum_unique_r = 0.0

                for g in range(n_groups):
                    start_idx = g * k
                    end_idx = start_idx + k
                    group_rewards = rewards[start_idx:end_idx]
                    group_labels = all_labels[start_idx:end_idx]

                    # 计算 group 内 reward 的 population std
                    g_std = statistics.pstdev(group_rewards) if len(group_rewards) > 1 else 0.0
                    group_stds.append(g_std)
                    sum_group_std += g_std

                    if g_std == 0.0:
                        zero_std_count += 1

                    # 统计 unique categories 和 unique rewards
                    unique_cats = len(set(group_labels))
                    unique_rs = len(set(group_rewards))
                    sum_unique_cat += unique_cats
                    sum_unique_r += unique_rs

                    # 保存 group 数据用于后续打印
                    group_info = {
                        "group_idx": g,
                        "start_idx": start_idx,
                        "rewards": group_rewards,
                        "labels": group_labels,
                        "std": g_std,
                        "unique_cats": unique_cats,
                        "unique_rs": unique_rs,
                    }
                    # 安全获取 problem_file 和 domain
                    if problem_files and start_idx < len(problem_files):
                        group_info["problem_file"] = problem_files[start_idx]
                    else:
                        group_info["problem_file"] = "unknown"
                    if effective_domains and start_idx < len(effective_domains):
                        group_info["domain"] = effective_domains[start_idx]
                    else:
                        group_info["domain"] = "unknown"
                    # 安全获取 stdout_lens
                    if stdout_lens and end_idx <= len(stdout_lens):
                        group_info["stdout_lens"] = stdout_lens[start_idx:end_idx]
                    else:
                        group_info["stdout_lens"] = [0] * k

                    group_data.append(group_info)

                zero_std_group_rate = zero_std_count / n_groups
                mean_group_std = sum_group_std / n_groups
                mean_unique_categories = sum_unique_cat / n_groups
                mean_unique_rewards = sum_unique_r / n_groups

                # 写入 log_dict
                log_dict["grpo/n_groups"] = n_groups
                log_dict["grpo/zero_std_group_rate"] = zero_std_group_rate
                log_dict["grpo/mean_group_std"] = mean_group_std
                log_dict["grpo/mean_unique_categories_per_group"] = mean_unique_categories
                log_dict["grpo/mean_unique_rewards_per_group"] = mean_unique_rewards

        # ========== 构建并打印 [BATCH_STATS] ==========
        step_str = str(trainer_state.global_step) if trainer_state else "?"

        # 构建类别计数字符串
        cat_counts = " ".join(
            f"{cat}={counts.get(cat, 0)}"
            for cat in categories
        )

        # 构建 GRPO 统计字符串
        grpo_stats = ""
        if n_groups > 0:
            grpo_stats = (
                f" n_groups={n_groups} zero_std_rate={zero_std_group_rate:.3f} "
                f"mean_group_std={mean_group_std:.4f} uniq_cat/grp={mean_unique_categories:.2f} "
                f"uniq_r/grp={mean_unique_rewards:.2f}"
            )

        # 单行输出便于 grep
        print(
            f"[BATCH_STATS] step={step_str} total={total} "
            f"reward_mean={reward_mean:.4f} reward_std={reward_std:.4f} "
            f"{cat_counts} top_domains={top_domains_str}{grpo_stats}"
        )

        # ========== 展开打印 group 样本详细信息 ==========
        if trainer_state is not None and trainer_state.global_step % logging_steps == 0:
            # 判断是否需要展开打印
            is_anomaly = zero_std_group_rate > anomaly_zero_std_threshold
            should_expand = verbose_batch_samples or (only_on_anomaly and is_anomaly)

            if should_expand and n_groups > 0 and group_data:
                # 按 std 从小到大排序，优先打印 std 最小的 group
                sorted_groups = sorted(group_data, key=lambda x: x["std"])
                groups_to_print = sorted_groups[:verbose_max_groups]

                for ginfo in groups_to_print:
                    g_idx = ginfo["group_idx"]
                    g_std = ginfo["std"]
                    g_domain = ginfo["domain"]
                    g_problem = ginfo["problem_file"]
                    g_unique_cats = ginfo["unique_cats"]
                    g_unique_rs = ginfo["unique_rs"]
                    g_rewards = ginfo["rewards"]
                    g_labels = ginfo["labels"]
                    g_stdout_lens = ginfo["stdout_lens"]

                    print(f"\n[SAMPLE_GROUP] step={step_str} group_idx={g_idx} k={k} "
                          f"domain={g_domain} problem_file={g_problem}")
                    print(f"[SAMPLE_GROUP] unique_categories={g_unique_cats} unique_rewards={g_unique_rs} "
                          f"group_reward_std={g_std:.4f}")

                    # 打印该组的前 min(k, verbose_max_k) 条采样明细
                    n_to_print = min(k, verbose_max_k, len(g_rewards))
                    for i in range(n_to_print):
                        cat_i = g_labels[i] if i < len(g_labels) else "?"
                        r_i = g_rewards[i] if i < len(g_rewards) else 0.0
                        stdout_len_i = g_stdout_lens[i] if i < len(g_stdout_lens) else 0
                        print(f"  i={i} category={cat_i} reward={r_i:.4f} stdout_len={stdout_len_i}")

                    if k > verbose_max_k:
                        print(f"  ... ({k - verbose_max_k} more samples omitted)")

    return log_dict


def extract_llm_output(output, family="mistral"):
    """从模型输出中提取LLM生成的部分，并裁剪为纯计划行（与 evaluate_llm_solver.py 保持一致）。"""
    if output is None:
        return ""
    text = output.strip()

    # 处理Mistral格式的输出
    if "[/INST]" in text or family == "mistral":
        parts = text.split("[/INST]")
        if len(parts) > 1:
            text = parts[-1].strip()
        else:
            text = text.strip()
        if text.endswith("</s>"):
            text = text[:-4].strip()

    # 处理ChatML格式（如部分GPT开源模型）
    if "<|im_start|>" in text:
        segments = text.split("<|im_start|>")
        for segment in reversed(segments):
            seg = segment.strip()
            if not seg:
                continue
            if seg.startswith("assistant"):
                seg = seg[len("assistant") :].lstrip(" :\n")
                if "<|im_end|>" in seg:
                    seg = seg.split("<|im_end|>", 1)[0]
                text = seg.strip()
                break
        else:
            if "<|im_end|>" in text:
                text = text.split("<|im_end|>", 1)[0].strip()

    # 处理包含 assistant 关键字的通用格式
    elif "assistant" in text and not text.startswith("assistant"):
        parts = text.split("assistant")
        text = parts[-1].lstrip(":").strip()

    # 移除特殊通道标记（支持 ASCII 与全角竖线，例如 <|im_start|> 或 <｜User｜>）
    text = re.sub(r"<[|｜][^>]+[|｜]>", "", text)

    # 移除 DeepSeek 等模型输出中的思维链标签
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL | re.IGNORECASE)
    text = re.sub(r"</?think>", "", text, flags=re.IGNORECASE)

    text = text.strip()

    # 移除可能残留的通道前缀
    text = re.sub(r"^(assistant|final|assistant_final)\s*[:\-]*", "", text, flags=re.IGNORECASE).lstrip()

    # 移除Phi等模板遗留的管道分隔符（例如输出以 "|>" 开头）
    text = re.sub(r"^\|>\s*", "", text)

    # 特殊处理 qwen 模型：检测并移除 <think> 标签
    if family == "qwen":
        text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL | re.IGNORECASE).strip()

    # 只保留末尾连续的计划行（形如 "(action obj1 obj2)"）
    plan_line_pattern = re.compile(r"^\([^\s()]+(?: [^\s()]+)*\)$")
    lines = [line.strip() for line in text.splitlines()]
    trailing_plan_lines = []
    for line in reversed(lines):
        if not line:
            if trailing_plan_lines:
                break
            continue
        if plan_line_pattern.match(line):
            trailing_plan_lines.append(line)
        elif trailing_plan_lines:
            break
    if trailing_plan_lines:
        text = "\n".join(reversed(trailing_plan_lines))
    else:
        text = "\n".join(line for line in lines if line)

    return text

def _classify_result(stdout_text: str) -> str:
    """根据 validation_stdout 分类结果。"""
    text = stdout_text.lower() if stdout_text else ""

    if not text:
        return "plan_format_error"  # 空的validation_stdout归类为plan_format_error

    # 1) success plans - 首先检查 plan 是否 valid
    if "plan valid\n" in text or "successful plans:" in text:
        return "success_plans"

    # 2) plan format error
    if (
        "bad operator in plan" in text
        or "bad plan description!" in text
        or "no matching action defined" in text
        or "object with unknown type" in text
        or "type problem with proposition" in text
        or "type-checking goal failed" in text
    ):
        return "plan_format_error"

    # 5) goal not satisfied
    if "checking goal\ngoal not satisfied" in text or "goal not satisfied" in text:
        return "goal_not_satisfied"

    # 3) precondition violation
    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    # # 4) safety constraints violation (排除掉前置条件不满足)
    if ("plan failed to execute" in text and "unsatisfied precondition" not in text):
        return "safety_constraints_violation"

    return "plan_format_error"

def _resolve_validate_path():
    """Find a usable Validate binary."""
    candidates = [
        Path("/users/jfan5/VAL/build/bin/Validate"),
        Path.home() / "VAL/build/linux64/Release/bin/Validate",
        Path.home() / "VAL/build/linux64/debug/bin/Validate",
    ]
    for path in candidates:
        if path.exists():
            return str(path)
    found = shutil.which("Validate")
    if found:
        return found
    return "Validate"


def validate_solution(domain_file, problem_file, solution_text):
    """使用VAL验证器验证解决方案"""
    # 创建临时文件保存解决方案
    with tempfile.NamedTemporaryFile(mode='w', suffix='.soln', delete=False) as f:
        f.write(solution_text)
        solution_file = f.name
    
    try:
        # 运行VAL验证器
        val_path = _resolve_validate_path()
        cmd_list = [val_path, "-v", domain_file, problem_file, solution_file]
        cmd_str = ' '.join(cmd_list)
        result = subprocess.run(cmd_list, capture_output=True, text=True, timeout=30)
        
        # 检查验证结果
        if result.returncode == 0:
            # 检查输出中是否包含成功信息
            output = result.stdout.lower()
            if "plan valid" in output or "successful plans" in output:
                return True, "Plan valid", result.stdout, result.stderr, cmd_str
            else:
                return False, f"Validation failed: {result.stdout[:500]}", result.stdout, result.stderr, cmd_str
        else:
            return False, f"Validation error: {result.stderr[:500]}", result.stdout, result.stderr, cmd_str
    
    except subprocess.TimeoutExpired:
        return False, "Validation timeout", "", "Validation timeout after 30 seconds", cmd_str
    except Exception as e:
        return False, f"Validation exception: {str(e)}", "", str(e), cmd_str
    finally:
        # 清理临时文件
        try:
            os.unlink(solution_file)
        except:
            pass


def compute_reward(class_label):
    reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": -0.2,
        "precondition_violation": -0.5,
        "plan_format_error": -0.7,
        "safety_constraints_violation": -1.0,
    }
    return reward_table[class_label]


