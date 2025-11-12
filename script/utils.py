

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


