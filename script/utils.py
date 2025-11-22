import os
import shutil
import subprocess
import tempfile
from pathlib import Path

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
    ):
        return "plan_format_error"

    # 5) goal not satisfied
    if "checking goal\ngoal not satisfied" in text:
        return "goal_not_satisfied"

    # 3) precondition violation
    if "plan failed to execute" in text and "unsatisfied precondition" in text:
        return "precondition_violation"

    # # 4) safety constraints violation (排除掉前置条件不满足)
    # if ("plan failed to execute" in text and "unsatisfied precondition" not in text) or "outstanding requirements unsatisfied during plan" in text or :
    return "safety_constraints_violation"
    # 6) others
    # return "others"




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
