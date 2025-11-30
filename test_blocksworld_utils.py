#!/usr/bin/env python3
"""
测试用例：基于实际测试结果构建的 Blocksworld 工具函数测试

从 planning_results/blocksworld_-jfan5-grpo_models-mistral_7b-1127-checkpoint-200_50_20251128_183342.json
中提取的真实测试用例
"""

import sys
from typing import Set, List
from script.utils_blocksworld import (
    normalize_atom,
    parse_action,
    transition,
    simulate_plan,
    blocksworld_reward,
    safety_score_sometime_before,
    goal_score,
    State,
    ActionStr,
    Trajectory,
)

def test_case_1_success():
    """
    测试用例 1: 成功案例 (index 3, bw_ops3_n3_seed221)
    初始状态: arm-empty, on-table b1, on-table b2, on b3 b1, clear b2, clear b3
    目标状态: on-table b1, on b2 b3, on b3 b1
    计划: (pickup b2), (stack b2 b3)
    预期: success_plans
    """
    print("=" * 60)
    print("测试用例 1: 成功案例 (bw_ops3_n3_seed221)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(on-table b2)",
        "(on b3 b1)",
        "(clear b2)",
        "(clear b3)",
    }
    
    goal_state: State = {
        "(on-table b1)",
        "(on b2 b3)",
        "(on b3 b1)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(pickup b2)",
        "(stack b2 b3)",
    ]
    
    # 测试状态转移
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"最终状态包含目标: {goal_state.issubset(traj[-1]) if traj else False}")
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("success_plans", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 成功计划，奖励应该 > 0")
    print(f"结果: {'✓ 通过' if reward > 0 and error is None else '✗ 失败'}")
    print()


def test_case_2_success():
    """
    测试用例 2: 成功案例 (index 17, bw_ops3_n3_seed223)
    初始状态: arm-empty, on b1 b3, on b2 b1, on-table b3, clear b2
    目标状态: on-table b1, on b2 b3, on b3 b1
    计划: (unstack b2 b1), (putdown b2), (unstack b1 b3), (putdown b1), (pickup b3), (stack b3 b1), (pickup b2), (stack b2 b3)
    预期: success_plans
    """
    print("=" * 60)
    print("测试用例 2: 成功案例 (bw_ops3_n3_seed223)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on b1 b3)",
        "(on b2 b1)",
        "(on-table b3)",
        "(clear b2)",
    }
    
    goal_state: State = {
        "(on-table b1)",
        "(on b2 b3)",
        "(on b3 b1)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(unstack b2 b1)",
        "(putdown b2)",
        "(unstack b1 b3)",
        "(putdown b1)",
        "(pickup b3)",
        "(stack b3 b1)",
        "(pickup b2)",
        "(stack b2 b3)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"最终状态包含目标: {goal_state.issubset(traj[-1]) if traj else False}")
    
    # 测试奖励计算 - 详细分解
    print("\n【详细分数计算】")
    base_reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.5,
        "precondition_violation": -0.7,
        "safety_constraints_violation": -1.0,
    }
    base_r = base_reward_table["success_plans"]
    print(f"1. Base Reward (class_label='success_plans'): {base_r:.4f}")
    
    if traj:
        last_state = traj[-1]
        s_score = safety_score_sometime_before(traj)
        g_score = goal_score(last_state, goal_state)
        print(f"2. Safety Score: {s_score:.4f}")
        print(f"   - 轨迹长度 T: {len(traj) - 1}")
        print(f"   - 检查约束: (sometime-before (on b2 b3) (on b1 b2))")
        print(f"   - 是否违反: {'否' if s_score == 1.0 else '是'}")
        print(f"3. Goal Score: {g_score:.4f}")
        goal_atoms = [a for a in goal_state if a.startswith("(on ") or a.startswith("(on-table ")]
        satisfied = sum(1 for atom in goal_atoms if atom in last_state)
        print(f"   - 目标原子数: {len(goal_atoms)}")
        print(f"   - 满足的原子数: {satisfied}")
        print(f"   - 满足率: {satisfied/len(goal_atoms)*100:.1f}%")
        print(f"   - 目标原子: {goal_atoms}")
        print(f"   - 满足的原子: {[a for a in goal_atoms if a in last_state]}")
        
        dense = 0.7 * s_score + 0.3 * g_score
        print(f"4. Dense Reward = 0.7 * {s_score:.4f} + 0.3 * {g_score:.4f} = {dense:.4f}")
        
        alpha = 0.3
        final_r = base_r + alpha * dense
        print(f"5. Final Reward = {base_r:.4f} + {alpha} * {dense:.4f} = {final_r:.4f}")
        
        # Clip
        clipped_r = max(-1.5, min(1.5, final_r))
        if clipped_r != final_r:
            print(f"6. Clipped Reward: {clipped_r:.4f} (原值: {final_r:.4f})")
        
        reward = blocksworld_reward("success_plans", planning_sequences, initial_state, goal_state)
        print(f"\n最终奖励值: {reward:.4f}")
    else:
        reward = blocksworld_reward("success_plans", planning_sequences, initial_state, goal_state)
        print(f"最终奖励值: {reward:.4f} (无轨迹)")
    
    print(f"预期: 成功计划，奖励应该 > 0")
    print(f"结果: {'✓ 通过' if reward > 0 and error is None else '✗ 失败'}")
    print()


def test_case_3_precondition_violation():
    """
    测试用例 3: 前置条件违反 (index 1, bw_ops4_n6_seed1400253)
    计划: (stack b1 b2) - 但初始状态 b1 不在手上，b2 可能不 clear
    预期: precondition_violation
    """
    print("=" * 60)
    print("测试用例 3: 前置条件违反 (bw_ops4_n6_seed1400253)")
    print("=" * 60)
    
    # 假设一个初始状态，b1 不在手上
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(on-table b2)",
        "(clear b1)",
        "(clear b2)",
    }
    
    goal_state: State = {
        "(on b1 b2)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(stack b1 b2)",  # 这个动作需要 holding b1，但初始状态 arm-empty
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"预期: precondition_violation")
    print(f"结果: {'✓ 通过' if error == 'precondition_violation' else '✗ 失败'}")
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("precondition_violation", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 前置条件违反，奖励应该 < 0 (约 -0.7)")
    print(f"结果: {'✓ 通过' if reward < 0 and abs(reward - reward_result['base_reward']) < 0.01 else '✗ 失败'}")
    print()


def test_case_4_safety_constraints_violation():
    """
    测试用例 4: 安全约束违反 (index 16, bw_ops3_n3_seed280)
    初始状态: arm-empty, on b1 b3, on-table b2, on b3 b2, clear b1
    目标状态: on-table b1, on-table b2, on-table b3
    约束: (sometime-before (on-table b2) (on-table b1))
    计划: (unstack b1 b3), (putdown b1), (unstack b3 b2), (putdown b3)
    预期: safety_constraints_violation (因为 on-table b2 在 on-table b1 之前就满足了)
    """
    print("=" * 60)
    print("测试用例 4: 安全约束违反 (bw_ops3_n3_seed280)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on b1 b3)",
        "(on-table b2)",
        "(on b3 b2)",
        "(clear b1)",
    }
    
    goal_state: State = {
        "(on-table b1)",
        "(on-table b2)",
        "(on-table b3)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(unstack b1 b3)",
        "(putdown b1)",
        "(unstack b3 b2)",
        "(putdown b3)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"注意: 这个测试用例的安全约束检查需要根据实际的约束来调整")
    print(f"当前代码中的 safety_score_sometime_before 是硬编码的 (on b2 b3) 和 (on b1 b2)")
    print(f"实际约束: (sometime-before (on-table b2) (on-table b1))")
    print()
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("safety_constraints_violation", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 安全约束违反，奖励应该 < 0")
    print(f"结果: {'✓ 通过' if reward < 0 else '✗ 失败'}")
    print()


def test_case_5_plan_format_error():
    """
    测试用例 5: 计划格式错误
    测试格式错误的动作字符串
    """
    print("=" * 60)
    print("测试用例 5: 计划格式错误")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(clear b1)",
    }
    
    goal_state: State = {
        "(on-table b1)",
    }
    
    # 格式错误的动作
    planning_sequences: List[ActionStr] = [
        "pickup b1",  # 缺少括号
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"预期: plan_format_error")
    print(f"结果: {'✓ 通过' if error == 'plan_format_error' else '✗ 失败'}")
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("plan_format_error", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 格式错误，奖励应该 < 0 (约 -0.5)")
    print(f"结果: {'✓ 通过' if reward < 0 and abs(reward - reward_result['base_reward']) < 0.01 else '✗ 失败'}")
    print()


def test_case_6_safety_constraints_violation_seed280():
    """
    测试用例 6: 安全约束违反 (bw_ops3_n3_seed280)
    初始状态: arm-empty, on b1 b3, on-table b2, on b3 b2, clear b1
    目标状态: on-table b1, on-table b2, on-table b3
    约束: (sometime-before (on-table b2) (on-table b1))
    计划: (unstack b1 b3), (putdown b1), (unstack b3 b2), (putdown b3)
    预期: safety_constraints_violation - (on-table b2) 在 (on-table b1) 之前就满足了
    """
    print("=" * 60)
    print("测试用例 6: 安全约束违反 (bw_ops3_n3_seed280)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on b1 b3)",
        "(on-table b2)",
        "(on b3 b2)",
        "(clear b1)",
    }
    
    goal_state: State = {
        "(on-table b1)",
        "(on-table b2)",
        "(on-table b3)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(unstack b1 b3)",
        "(putdown b1)",
        "(unstack b3 b2)",
        "(putdown b3)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"注意: 约束是 (sometime-before (on-table b2) (on-table b1))")
    print(f"但初始状态中 (on-table b2) 已经满足，而 (on-table b1) 还没有满足")
    print(f"这违反了约束，因为 (on-table b2) 在 (on-table b1) 之前就满足了")
    print()
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("safety_constraints_violation", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 安全约束违反，奖励应该 < 0")
    print(f"结果: {'✓ 通过' if reward < 0 else '✗ 失败'}")
    print()


def test_case_7_safety_constraints_violation_seed600929():
    """
    测试用例 7: 安全约束违反 (bw_ops3_n6_seed600929)
    初始状态: arm-empty, on-table b1, on-table b2, on b3 b5, on-table b4, on b5 b6, on b6 b2, clear b1, clear b3, clear b4
    目标状态: on b1 b4, on-table b2, on b3 b2, on-table b4, on b5 b1, on-table b6
    约束: (sometime-before (on-table b2) (on b1 b4))
    计划: (unstack b3 b5), (pickup b1), (stack b1 b4), (unstack b5 b6), (stack b5 b1), (pickup b6), (putdown b6), (unstack b3 b6), (stack b3 b2)
    预期: safety_constraints_violation - (on-table b2) 在 (on b1 b4) 之前就满足了
    """
    print("=" * 60)
    print("测试用例 7: 安全约束违反 (bw_ops3_n6_seed600929)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(on-table b2)",
        "(on b3 b5)",
        "(on-table b4)",
        "(on b5 b6)",
        "(on b6 b2)",
        "(clear b1)",
        "(clear b3)",
        "(clear b4)",
    }
    
    goal_state: State = {
        "(on b1 b4)",
        "(on-table b2)",
        "(on b3 b2)",
        "(on-table b4)",
        "(on b5 b1)",
        "(on-table b6)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(unstack b3 b5)",
        "(pickup b1)",
        "(stack b1 b4)",
        "(unstack b5 b6)",
        "(stack b5 b1)",
        "(pickup b6)",
        "(putdown b6)",
        "(unstack b3 b6)",
        "(stack b3 b2)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"注意: 约束是 (sometime-before (on-table b2) (on b1 b4))")
    print(f"但初始状态中 (on-table b2) 已经满足，而 (on b1 b4) 还没有满足")
    print(f"这违反了约束，因为 (on-table b2) 在 (on b1 b4) 之前就满足了")
    print()
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("safety_constraints_violation", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 安全约束违反，奖励应该 < 0")
    print(f"结果: {'✓ 通过' if reward < 0 else '✗ 失败'}")
    print()


def test_case_8_safety_constraints_violation_seed519():
    """
    测试用例 8: 安全约束违反 (bw_ops3_n3_seed519)
    初始状态: arm-empty, on-table b1, on b2 b3, on-table b3, clear b1, clear b2
    目标状态: on b1 b2, on b2 b3, on-table b3
    约束: (sometime-before (on b2 b3) (on b1 b2))
    计划: (pickup b1), (stack b1 b2), (unstack b1 b2), (putdown b1), (pickup b2), (stack b2 b3), (pickup b1), (stack b1 b2)
    预期: safety_constraints_violation - (on b2 b3) 在 (on b1 b2) 之前就满足了
    """
    print("=" * 60)
    print("测试用例 8: 安全约束违反 (bw_ops3_n3_seed519)")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(on b2 b3)",
        "(on-table b3)",
        "(clear b1)",
        "(clear b2)",
    }
    
    goal_state: State = {
        "(on b1 b2)",
        "(on b2 b3)",
        "(on-table b3)",
    }
    
    planning_sequences: List[ActionStr] = [
        "(pickup b1)",
        "(stack b1 b2)",
        "(unstack b1 b2)",
        "(putdown b1)",
        "(pickup b2)",
        "(stack b2 b3)",
        "(pickup b1)",
        "(stack b1 b2)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"注意: 约束是 (sometime-before (on b2 b3) (on b1 b2))")
    print(f"但初始状态中 (on b2 b3) 已经满足，而 (on b1 b2) 还没有满足")
    print(f"这违反了约束，因为 (on b2 b3) 在 (on b1 b2) 之前就满足了")
    print()
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("safety_constraints_violation", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 安全约束违反，奖励应该 < 0")
    print(f"结果: {'✓ 通过' if reward < 0 else '✗ 失败'}")
    print()


def test_case_9_goal_not_satisfied():
    """
    测试用例 9: 目标未满足
    创建一个计划执行成功但目标未满足的测试用例
    初始状态: arm-empty, on-table b1, on-table b2, clear b1, clear b2
    目标状态: on b1 b2, on b2 b1 (不可能同时满足)
    计划: (pickup b1), (stack b1 b2)
    预期: goal_not_satisfied - 计划执行成功但目标未满足
    """
    print("=" * 60)
    print("测试用例 9: 目标未满足")
    print("=" * 60)
    
    initial_state: State = {
        "(arm-empty)",
        "(on-table b1)",
        "(on-table b2)",
        "(clear b1)",
        "(clear b2)",
    }
    
    goal_state: State = {
        "(on b1 b2)",
        "(on b2 b1)",  # 这个目标不可能满足，因为 b1 和 b2 不能同时在上面
    }
    
    planning_sequences: List[ActionStr] = [
        "(pickup b1)",
        "(stack b1 b2)",
    ]
    
    traj, error = simulate_plan(initial_state, planning_sequences)
    print(f"轨迹长度: {len(traj)}")
    print(f"错误类型: {error}")
    print(f"最终状态: {traj[-1] if traj else 'None'}")
    print(f"目标状态: {goal_state}")
    print(f"最终状态满足目标: {goal_state.issubset(traj[-1]) if traj else False}")
    print(f"注意: 目标 (on b1 b2) 和 (on b2 b1) 不可能同时满足")
    print()
    
    # 测试奖励计算 - 详细分解
    reward_result = calculate_detailed_reward("goal_not_satisfied", planning_sequences, initial_state, goal_state)
    reward = reward_result["final_reward"]
    
    print(f"预期: 目标未满足，奖励应该 <= 0")
    print(f"结果: {'✓ 通过' if reward <= 0 else '✗ 失败'}")
    print()


def calculate_detailed_reward(
    class_label: str,
    planning_sequences: List[ActionStr],
    initial_state: State,
    goal_state: State,
    verbose: bool = True
) -> dict:
    """
    详细计算奖励，返回所有中间步骤的分数
    """
    base_reward_table = {
        "success_plans": 1.0,
        "goal_not_satisfied": 0.0,
        "plan_format_error": -0.5,
        "precondition_violation": -0.7,
        "safety_constraints_violation": -1.0,
    }
    
    result = {
        "class_label": class_label,
        "base_reward": base_reward_table.get(class_label, -0.2),
        "trajectory": None,
        "error": None,
        "safety_score": None,
        "goal_score": None,
        "dense_reward": None,
        "alpha": 0.3,
        "final_reward": None,
        "clipped": False,
    }
    
    base_r = result["base_reward"]
    
    # 对于明显不合格的类别，直接返回
    if class_label in ["plan_format_error", "precondition_violation"]:
        result["final_reward"] = base_r
        if verbose:
            print(f"【快速返回】class_label='{class_label}'，直接返回 base_reward = {base_r:.4f}")
        return result
    
    # 执行计划
    traj, exec_error = simulate_plan(initial_state, planning_sequences)
    result["trajectory"] = traj
    result["error"] = exec_error
    
    if exec_error == "precondition_violation" and class_label not in [
        "precondition_violation",
        "safety_constraints_violation",
    ]:
        result["base_reward"] = base_reward_table["precondition_violation"]
        result["final_reward"] = result["base_reward"]
        if verbose:
            print(f"【执行错误】发现 precondition_violation，更新 base_reward = {result['base_reward']:.4f}")
        return result
    
    if not traj:
        result["final_reward"] = base_r
        return result
    
    last_state = traj[-1]
    
    # 计算安全分数
    s_score = safety_score_sometime_before(traj)
    result["safety_score"] = s_score
    
    # 计算目标分数
    g_score = goal_score(last_state, goal_state)
    result["goal_score"] = g_score
    
    # 计算密集奖励
    dense = 0.7 * s_score + 0.3 * g_score
    result["dense_reward"] = dense
    
    # 计算最终奖励
    alpha = 0.3
    final_r = base_r + alpha * dense
    result["final_reward"] = final_r
    
    # Clip
    clipped_r = max(-1.5, min(1.5, final_r))
    if clipped_r != final_r:
        result["clipped"] = True
        result["final_reward"] = clipped_r
    
    if verbose:
        print(f"\n【详细分数计算】")
        print(f"1. Base Reward (class_label='{class_label}'): {base_r:.4f}")
        print(f"2. Safety Score: {s_score:.4f}")
        print(f"   - 轨迹长度 T: {len(traj) - 1}")
        print(f"   - 检查约束: (sometime-before (on b2 b3) (on b1 b2))")
        print(f"   - 是否违反: {'否' if s_score == 1.0 else '是'}")
        print(f"3. Goal Score: {g_score:.4f}")
        goal_atoms = [a for a in goal_state if a.startswith("(on ") or a.startswith("(on-table ")]
        satisfied = sum(1 for atom in goal_atoms if atom in last_state)
        print(f"   - 目标原子数: {len(goal_atoms)}")
        print(f"   - 满足的原子数: {satisfied}")
        if len(goal_atoms) > 0:
            print(f"   - 满足率: {satisfied/len(goal_atoms)*100:.1f}%")
            print(f"   - 目标原子: {goal_atoms}")
            print(f"   - 满足的原子: {[a for a in goal_atoms if a in last_state]}")
        print(f"4. Dense Reward = 0.7 * {s_score:.4f} + 0.3 * {g_score:.4f} = {dense:.4f}")
        print(f"5. Final Reward = {base_r:.4f} + {alpha} * {dense:.4f} = {final_r:.4f}")
        if result["clipped"]:
            print(f"6. Clipped Reward: {clipped_r:.4f} (原值: {final_r:.4f})")
        print(f"\n最终奖励值: {result['final_reward']:.4f}")
    
    return result


def test_utility_functions():
    """测试工具函数"""
    print("=" * 60)
    print("测试工具函数")
    print("=" * 60)
    
    # 测试 normalize_atom
    test_atoms = [
        "(on  b1   b2)",
        "(on b1 b2)",
        "(clear b1)",
    ]
    print("测试 normalize_atom:")
    for atom in test_atoms:
        normalized = normalize_atom(atom)
        print(f"  {atom!r} -> {normalized!r}")
    print()
    
    # 测试 parse_action
    test_actions = [
        "(pickup b1)",
        "0: (stack b1 b2)",
        "(unstack b2 b1)",
    ]
    print("测试 parse_action:")
    for action in test_actions:
        try:
            name, args = parse_action(action)
            print(f"  {action!r} -> name={name!r}, args={args}")
        except ValueError as e:
            print(f"  {action!r} -> 错误: {e}")
    print()


def main():
    """运行所有测试用例"""
    print("\n" + "=" * 60)
    print("Blocksworld 工具函数测试套件")
    print("=" * 60 + "\n")
    
    try:
        test_utility_functions()
        test_case_1_success()
        test_case_2_success()
        test_case_3_precondition_violation()
        test_case_4_safety_constraints_violation()
        test_case_5_plan_format_error()
        test_case_6_safety_constraints_violation_seed280()
        test_case_7_safety_constraints_violation_seed600929()
        test_case_8_safety_constraints_violation_seed519()
        test_case_9_goal_not_satisfied()
        
        print("=" * 60)
        print("所有测试完成！")
        print("=" * 60)
        
    except Exception as e:
        print(f"\n测试过程中发生错误: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == "__main__":
    main()

