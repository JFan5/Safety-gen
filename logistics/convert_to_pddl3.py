import re
import os
import glob
import shutil
from typing import Dict, List, Optional, Set, Tuple


# --------- 基础解析工具 ---------
def _extract_block(text: str, key: str) -> Optional[str]:
    """提取 (:key ...) 顶层块，使用括号计数确保闭合。"""
    m = re.search(rf'\(\s*:{re.escape(key)}\b', text, flags=re.IGNORECASE)
    if not m:
        return None
    start = m.start()
    depth = 0
    for i, ch in enumerate(text[start:], start=start):
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0:
                return text[start:i+1]
    return None


def _atoms(block: Optional[str], pred: str, arity: int) -> List[Tuple[str, ...]]:
    """从块中抽取指定谓词（arity 元），返回元组列表。"""
    if not block:
        return []
    # e.g. (at x y) / (OBJ p)
    pattern = r'\(\s*' + re.escape(pred) + ''.join([r'\s+([^\s()]+)'] * arity) + r'\s*\)'
    return [tuple(m.groups()) for m in re.finditer(pattern, block, flags=re.IGNORECASE)]


# --------- logistics 专用抽取 ---------
def _parse_logistics(problem_text: str):
    objs_block  = _extract_block(problem_text, 'objects')
    init_block  = _extract_block(problem_text, 'init')
    goal_block  = _extract_block(problem_text, 'goal')

    # 类型归类（通过 init 中的一元谓词）
    pkgs: Set[str]       = set(x[0] for x in _atoms(init_block, 'OBJ', 1))
    trucks: Set[str]     = set(x[0] for x in _atoms(init_block, 'TRUCK', 1))
    planes: Set[str]     = set(x[0] for x in _atoms(init_block, 'AIRPLANE', 1))
    locs: Set[str]       = set(x[0] for x in _atoms(init_block, 'LOCATION', 1))
    airports: Set[str]   = set(x[0] for x in _atoms(init_block, 'AIRPORT', 1))
    cities: Set[str]     = set(x[0] for x in _atoms(init_block, 'CITY', 1))

    # in-city: location -> city
    in_city_pairs = _atoms(init_block, 'in-city', 2)
    loc2city: Dict[str, str] = {loc: city for (loc, city) in in_city_pairs}

    # at: entity -> loc（初始）
    init_at_pairs = _atoms(init_block, 'at', 2)
    init_at: Dict[str, str] = {}
    for ent, loc in init_at_pairs:
        if ent in pkgs:
            init_at[ent] = loc
        # 车辆初始位置也可用到，但这里先不强依赖

    # 目标 at：包裹 -> 目标位置集合
    goal_at_pairs = _atoms(goal_block, 'at', 2)
    goal_at: Dict[str, Set[str]] = {}
    for ent, loc in goal_at_pairs:
        if ent in pkgs:
            goal_at.setdefault(ent, set()).add(loc)

    return {
        "pkgs": pkgs, "trucks": trucks, "planes": planes, "locs": locs,
        "airports": airports, "cities": cities, "loc2city": loc2city,
        "init_at": init_at, "goal_at": goal_at
    }


# --------- 约束生成器 ---------
def generate_logistics_constraints(problem_text: str) -> List[str]:
    """
    为 logistics 问题自动生成一组不与 init/goal 冲突的 PDDL3 约束（不含外层 (:constraints ...)）。
    策略：
      A) 若某包裹的初始与目标城市相同，则禁止其上任何飞机：(always (not (in p a)))
      B) 若 A 无法生成，选一个包裹 p 和一个地点 l（l 既非 p 的初始也非任何目标），添加 (always (not (at p l))).
    """
    info = _parse_logistics(problem_text)
    pkgs, planes, loc2city = info["pkgs"], info["planes"], info["loc2city"]
    init_at, goal_at, locs = info["init_at"], info["goal_at"], info["locs"]

    constraints: List[str] = []

    # --- A) same-city 包裹：禁用飞机承运 ---
    if planes:
        for p in sorted(pkgs):
            init_loc = init_at.get(p)
            goals = goal_at.get(p, set())
            if not init_loc or not goals:
                continue
            init_city = loc2city.get(init_loc)
            # 所有目标位置的城市
            goal_cities = {loc2city.get(g) for g in goals}
            if init_city is not None and len(goal_cities) == 1 and init_city in goal_cities:
                # 该包裹为"城市内配送"，对每架飞机加禁止装载约束
                for a in sorted(planes):
                    constraints.append(f"(always (not (in {p} {a})))")

    # 如果 A 有产出，直接返回（能生成多条约束更稳）
    if constraints:
        return constraints

    # --- B) 退而求其次：禁某包裹到不相干地点 ---
    # 找到任何一个 (p, l)，满足 l != init(p) 且 l 不在 p 的任何目标中
    for p in sorted(pkgs):
        init_loc = init_at.get(p)
        p_goals = goal_at.get(p, set())
        for l in sorted(locs):
            if l != init_loc and l not in p_goals:
                constraints.append(f"(always (not (at {p} {l})))")
                return constraints

    # 实在生成不了就返回空（极少见）
    return constraints


# --------- 插入器 ---------
def insert_constraints(problem_text: str,
                       constraints_exprs: Optional[List[str]] = None) -> str:
    """
    将若干条约束表达式插入 problem 文本为 (:constraints ...)。若已有约束块则不改动。
    """
    if re.search(r'\(\s*:constraints\b', problem_text, flags=re.IGNORECASE):
        return problem_text

    if constraints_exprs is None:
        constraints_exprs = generate_logistics_constraints(problem_text)

    if not constraints_exprs:
        raise ValueError("无法自动生成与 init/goal 兼容的安全约束。")

    # 估计缩进
    last_newline = problem_text.rfind('\n')
    indent = ""
    if last_newline != -1:
        tail = problem_text[last_newline+1:]
        m = re.match(r'(\s*)', tail)
        indent = m.group(1) if m else ""
    if not indent:
        indent = "  "

    # 如果有多条约束，用 (and ...) 包裹
    if len(constraints_exprs) == 1:
        inner = f"{indent}  {constraints_exprs[0]}"
    else:
        inner_lines = "\n".join(f"{indent}    {c}" for c in constraints_exprs)
        inner = f"{indent}  (and\n{inner_lines}\n{indent}  )"

    block = f"\n{indent}(:constraints\n{inner}\n{indent})\n"

    last_paren = problem_text.rfind(')')
    if last_paren == -1:
        raise ValueError("未找到 problem 的收尾右括号 ')'.")
    return problem_text[:last_paren] + block + problem_text[last_paren:]


# --------- 转换函数 ---------
def convert_problem_to_pddl3(problem_file: str, output_dir: str) -> bool:
    """
    将单个logistics问题文件转换为PDDL3格式
    
    Args:
        problem_file: 输入问题文件路径
        output_dir: 输出目录
    
    Returns:
        bool: 是否成功转换
    """
    try:
        # 读取原始问题文件
        with open(problem_file, 'r') as f:
            problem_text = f.read()
        
        # 转换为PDDL3格式
        pddl3_text = insert_constraints(problem_text)
        
        # 生成输出文件名
        base_name = os.path.basename(problem_file)
        output_file = os.path.join(output_dir, base_name)
        
        # 写入PDDL3问题文件
        with open(output_file, 'w') as f:
            f.write(pddl3_text)
        
        return True
        
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False

def convert_all_problems(input_dir: str, output_dir: str):
    """
    转换指定文件夹中的所有logistics问题为PDDL3格式
    
    Args:
        input_dir: 输入问题文件夹
        output_dir: 输出文件夹
    """
    # 检查输入目录是否存在
    if not os.path.exists(input_dir):
        print(f"错误: 输入目录 {input_dir} 不存在")
        return
    
    # 清空并创建输出目录
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)
    
    # 获取所有PDDL问题文件
    problem_files = glob.glob(os.path.join(input_dir, "*.pddl"))
    
    if not problem_files:
        print(f"在 {input_dir} 文件夹中没有找到PDDL问题文件")
        return
    
    print(f"找到 {len(problem_files)} 个问题文件")
    print(f"开始转换为PDDL3格式...")
    print(f"输入目录: {input_dir}")
    print(f"输出目录: {output_dir}")
    print("-" * 50)
    
    successful = 0
    failed = 0
    
    for i, problem_file in enumerate(problem_files, 1):
        print(f"[{i}/{len(problem_files)}] 转换: {os.path.basename(problem_file)} ", end="")
        
        if convert_problem_to_pddl3(problem_file, output_dir):
            print("✓ 成功")
            successful += 1
        else:
            print("✗ 失败")
            failed += 1
    
    print("-" * 50)
    print(f"转换完成!")
    print(f"成功: {successful} 个")
    print(f"失败: {failed} 个")
    if successful + failed > 0:
        print(f"成功率: {successful/(successful+failed)*100:.1f}%")


# ----------------- 主程序 -----------------
if __name__ == "__main__":
    import sys
    
    if len(sys.argv) < 2:
        print("用法: python convert_to_pddl3.py <输入目录> [输出目录]")
        print("示例: python convert_to_pddl3.py problems problems_pddl3")
        print("       python convert_to_pddl3.py A A_pddl3")
        sys.exit(1)
    
    # 获取输入和输出目录
    input_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else f"{input_dir}_pddl3"
    
    convert_all_problems(input_dir, output_dir)
