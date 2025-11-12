# prompt_variants.py
# -*- coding: utf-8 -*-
from pathlib import Path
import random
from typing import Optional

# 10 个等价模板（仅改“指令外观/措辞”，保持输出约束完全一致）
TEMPLATES = [
    # 1
    """You are a planning expert. Produce a **valid plan** for the domain and problem below.

DOMAIN:
{domain_content}

PROBLEM:
{problem_content}

### Output Rules
- Output **only** plan steps, one per line.
- Each line must be exactly in the form:
  (<ACTION_NAME> <param1> <param2> ...)
- Use only objects that appear in the PROBLEM.
- Do **not** include explanations, comments, headers, or any extra text.
- The output must contain **no natural language sentences**.
- {pddl_clause}
- Ensure every action’s preconditions hold and no constraint/invariant is violated at any step.
### Plan:
""",

    # 2
    """Act as a planner. Generate a **valid plan** that solves the given problem in the given domain.

[DOMAIN]
{domain_content}

[PROBLEM]
{problem_content}

== REQUIRED OUTPUT ==
- Return plan steps **only**, one per line.
- Line format:
  (<ACTION_NAME> <param1> <param2> ...)
- Use exclusively the objects present in the PROBLEM.
- No explanations, comments, titles, or extra text.
- The output must **not** contain natural-language sentences.
- {pddl_clause}
- Verify preconditions and preserve all constraints at every step.
Plan:
""",

    # 3
    """Planner role: create a **correct plan** for the following inputs.

<DOMAIN>
{domain_content}
</DOMAIN>

<PROBLEM>
{problem_content}
</PROBLEM>

Output Specification:
- Provide only the plan steps, one per line.
- Each step must be:
  (<ACTION_NAME> <param1> <param2> ...)
- Only use objects from the PROBLEM.
- No commentary, no headers, no extra text.
- Do not output any natural-language sentences.
- {pddl_clause}
- All action preconditions must hold; never violate constraints/invariants.
### Plan:
""",

    # 4
    """Goal: derive a **valid plan**.

DOMAIN CONTENT:
{domain_content}

PROBLEM CONTENT:
{problem_content}

OUTPUT FORMAT (strict):
- Lines = plan steps only (one per line).
- Each line:
  (<ACTION_NAME> <param1> <param2> ...)
- Use objects that exist in the PROBLEM only.
- No explanations/comments/headers or any additional text.
- Absolutely no natural-language sentences.
- {pddl_clause}
- Ensure preconditions/constraints are satisfied at each step.
Plan:
""",

    # 5
    """You are an automated planner. Return a **valid** step sequence that solves the problem.

=== DOMAIN ===
{domain_content}

=== PROBLEM ===
{problem_content}

=== OUTPUT RULES ===
- Output only the plan steps (one per line).
- Step syntax:
  (<ACTION_NAME> <param1> <param2> ...)
- Use only PROBLEM-defined objects.
- Do not add explanations, comments, or headings.
- Do not include natural-language sentences.
- {pddl_clause}
- All steps must respect preconditions and constraints/invariants.
### Plan:
""",

    # 6
    """Task: compose a **valid plan** for the following domain/problem pair.

-- DOMAIN --
{domain_content}

-- PROBLEM --
{problem_content}

Strict Output:
- Only plan steps, one per line.
- Format:
  (<ACTION_NAME> <param1> <param2> ...)
- Use objects from PROBLEM only.
- No explanations, comments, or headers.
- No natural-language sentences in the output.
- {pddl_clause}
- Maintain all action preconditions and constraints/invariants.
Plan:
""",

    # 7
    """As a planning system, produce a **valid plan** that achieves the goal.

DOMAIN:
{domain_content}

PROBLEM:
{problem_content}

Output Contract:
- Emit plan steps only, each on its own line.
- Each step must match:
  (<ACTION_NAME> <param1> <param2> ...)
- Only objects listed in PROBLEM may be used.
- Exclude explanations, comments, section titles, or any extra text.
- The output must not contain natural language sentences.
- {pddl_clause}
- Check preconditions; never violate constraints/invariants.
### Plan:
""",

    # 8
    """Planner Instruction: generate a **valid plan** for the inputs.

[Input: DOMAIN]
{domain_content}

[Input: PROBLEM]
{problem_content}

[Output Policy]
- Return only plan steps (one per line).
- Each line strictly:
  (<ACTION_NAME> <param1> <param2> ...)
- Use PROBLEM-defined objects only.
- No explanations or extra text of any kind.
- No natural-language sentences.
- {pddl_clause}
- Ensure all preconditions and constraints are satisfied.
Plan:
""",

    # 9
    """Create a **valid plan** solving the problem under the given domain.

DOMAIN BLOCK:
{domain_content}

PROBLEM BLOCK:
{problem_content}

OUTPUT REQUIREMENTS:
- Output plan steps only, one per line.
- Step format:
  (<ACTION_NAME> <param1> <param2> ...)
- Use only objects that exist in the PROBLEM.
- Do not write explanations, comments, or headers.
- Do not output natural-language sentences.
- {pddl_clause}
- Respect preconditions and constraints/invariants throughout.
### Plan:
""",

    # 10
    """Planning task: output a **valid plan**.

DOMAIN:
{domain_content}

PROBLEM:
{problem_content}

Rules for Output:
- Only the plan lines, one step per line.
- Each line must be:
  (<ACTION_NAME> <param1> <param2> ...)
- Only use objects declared in the PROBLEM.
- No explanations, no comments, no headings, no extra text.
- No natural-language sentences in the output.
- {pddl_clause}
- All steps must satisfy preconditions and preserve constraints/invariants.
Plan:
""",
]

def _pddl_clause(pddl_version: str) -> str:
    """根据 pddl_version 生成统一的约束描述句。"""
    if str(pddl_version).strip().upper().startswith("PDDL3"):
        return ("If the PROBLEM includes PDDL3 constraints, the plan **must** satisfy all of them; "
                "otherwise, solve as a standard goal-directed task.")
    # 默认按 PDDL2
    return ("Solve as a standard PDDL2 goal-directed task if no PDDL3 constraints are specified.")

def build_prompt_multi(
    domain_content: str,
    problem_content: str,
    pddl_version: str,
    variant: Optional[int] = None,
    rng: Optional[random.Random] = None,
) -> str:
    """
    生成一个多模板 prompt。
    - variant: 取值 1..10 指定模板；为 None 时随机。
    - rng: 可注入随机数发生器以便复现实验。
    """
    pddl_clause = _pddl_clause(pddl_version)
    if variant is None:
        rng = rng or random
        idx = rng.randint(1, len(TEMPLATES))
    else:
        if not (1 <= int(variant) <= len(TEMPLATES)):
            raise ValueError(f"variant must be in [1, {len(TEMPLATES)}], got {variant}")
        idx = int(variant)
    template = TEMPLATES[idx - 1]
    return template.format(
        domain_content=domain_content,
        problem_content=problem_content,
        pddl_clause=pddl_clause
    )

def write_prompt_files(
    domain_content: str,
    problem_content: str,
    pddl_version: str,
    out_dir: str = "prompt_variants",
) -> None:
    """
    将 10 个模板各自渲染后写入文件：prompt_01.txt ... prompt_10.txt
    """
    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    for i in range(1, len(TEMPLATES) + 1):
        text = build_prompt_multi(domain_content, problem_content, pddl_version, variant=i)
        (out / f"prompt_{i:02d}.txt").write_text(text, encoding="utf-8")

# ========== 与你原先的 build_prompt 兼容使用（可选） ==========
def build_prompt(domain_content: str, problem_content: str, pddl_version: str) -> str:
    """
    兼容你原先的实现：
    - 如果存在 prompt.txt 则沿用；
    - 否则回退到多模板（随机）变体，避免单一模板过拟合。
    """
    file_path = Path("prompt.txt")
    if file_path.exists():
        try:
            prompt_text = file_path.read_text(encoding="utf-8")
            return prompt_text.format(
                domain_content=domain_content,
                problem_content=problem_content
            )
        except Exception as e:
            print(f"Error reading prompt template prompt.txt: {e}")
    # 如果没有 prompt.txt 或读取失败，使用多模板以增强多样性
    return build_prompt_multi(domain_content, problem_content, pddl_version, variant=None)

# ========== 简单示例 ==========
if __name__ == "__main__":
    # 你可以替换为真实内容
    demo_domain = "(define (domain demo) ...)"
    demo_problem = "(define (problem demo-prob) ...)"
    pddl_ver = "PDDL3"

    # 1) 随机取一个模板
    print("--- Random variant ---")
    print(build_prompt_multi(demo_domain, demo_problem, pddl_ver))

    # 2) 固定取第 3 个模板
    print("--- Variant 3 ---")
    print(build_prompt_multi(demo_domain, demo_problem, pddl_ver, variant=3))

    # 3) 把 10 个模板都写到本地目录
    write_prompt_files(demo_domain, demo_problem, pddl_ver, out_dir="prompt_variants")
