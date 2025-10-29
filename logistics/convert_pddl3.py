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
    """从块中抽取指定谓词（arity 元），返回元组列表。大小写不敏感。"""
    if not block:
        return []
    # e.g. (at x y) / (OBJ p)
    pattern = r'\(\s*' + re.escape(pred) + ''.join([r'\s+([^\s()]+)'] * arity) + r'\s*\)'
    return [tuple(m.groups()) for m in re.finditer(pattern, block, flags=re.IGNORECASE)]
def _extract_block_span(text: str, key: str) -> Optional[Tuple[int, int]]:
    """返回 (:key ...) 顶层块的 (start, end) 下标区间。"""
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
                return (start, i + 1)
    return None





def _group_by_city(ents: Set[str], at_map: Dict[str, str], loc2city: Dict[str, str]) -> Dict[str, Set[str]]:
    """将实体按其初始所在城市分组。未识别城市的实体会被忽略。"""
    res: Dict[str, Set[str]] = {}
    for e in ents:
        loc = at_map.get(e)
        if not loc:
            continue
        city = loc2city.get(loc)
        if city is None:
            continue
        res.setdefault(city, set()).add(e)
    return res


# --------- logistics 专用抽取 ---------
def _parse_logistics(problem_text: str):
    objs_block  = _extract_block(problem_text, 'objects')
    init_block  = _extract_block(problem_text, 'init')
    goal_block  = _extract_block(problem_text, 'goal')

    pkgs: Set[str]       = set(x[0] for x in _atoms(init_block, 'OBJ', 1))
    trucks: Set[str]     = set(x[0] for x in _atoms(init_block, 'TRUCK', 1))
    planes: Set[str]     = set(x[0] for x in _atoms(init_block, 'AIRPLANE', 1))
    locs: Set[str]       = set(x[0] for x in _atoms(init_block, 'LOCATION', 1))
    airports: Set[str]   = set(x[0] for x in _atoms(init_block, 'AIRPORT', 1))
    cities: Set[str]     = set(x[0] for x in _atoms(init_block, 'CITY', 1))

    in_city_pairs = _atoms(init_block, 'in-city', 2)
    loc2city: Dict[str, str] = {loc: city for (loc, city) in in_city_pairs}

    init_at_pairs = _atoms(init_block, 'at', 2)
    init_at: Dict[str, str] = {}
    truck_at: Dict[str, str] = {}
    plane_at: Dict[str, str] = {}
    for ent, loc in init_at_pairs:
        if ent in pkgs:
            init_at[ent] = loc
        elif ent in trucks:
            truck_at[ent] = loc
        elif ent in planes:
            plane_at[ent] = loc

    goal_at_pairs = _atoms(goal_block, 'at', 2)
    goal_at: Dict[str, Set[str]] = {}
    for ent, loc in goal_at_pairs:
        if ent in pkgs:
            goal_at.setdefault(ent, set()).add(loc)

    # 分组：卡车按城；机场按城
    trucks_by_city = _group_by_city(trucks, truck_at, loc2city)
    airports_by_city: Dict[str, Set[str]] = {}
    for ap in airports:
        city = loc2city.get(ap)
        if city is not None:
            airports_by_city.setdefault(city, set()).add(ap)

    return {
        "pkgs": pkgs, "trucks": trucks, "planes": planes, "locs": locs,
        "airports": airports, "cities": cities, "loc2city": loc2city,
        "init_at": init_at, "goal_at": goal_at,
        "truck_at": truck_at, "plane_at": plane_at,
        "trucks_by_city": trucks_by_city, "airports_by_city": airports_by_city
    }



def generate_logistics_constraints(problem_text: str) -> List[str]:
    info = _parse_logistics(problem_text)
    pkgs, planes, loc2city = info["pkgs"], info["planes"], info["loc2city"]
    init_at, goal_at, locs = info["init_at"], info["goal_at"], info["locs"]
    airports, trucks_by_city = info["airports"], info["trucks_by_city"]

    constraints: List[str] = []

    # A) 同城包裹 -> 禁用飞机（前提：该城市至少有一辆卡车可用）
    if planes:
        for p in sorted(pkgs):
            init_loc = init_at.get(p)
            goals = goal_at.get(p, set())
            if not init_loc or not goals:
                continue
            init_city = loc2city.get(init_loc)
            goal_cities = {loc2city.get(g) for g in goals}
            if (init_city is not None and len(goal_cities) == 1 and init_city in goal_cities):
                # 只有当起始城市里确实有卡车，禁飞机才不会破坏可达性
                if len(trucks_by_city.get(init_city, set())) >= 1:
                    for a in sorted(planes):
                        constraints.append(f"(always (not (in {p} {a})))")

    if constraints:
        return constraints

    # B) 退一步：对某个包裹禁一个“无关”地点，但排除机场
    non_airport_locs = sorted(locs - airports)
    for p in sorted(pkgs):
        init_loc = init_at.get(p)
        p_goals = goal_at.get(p, set())
        for l in non_airport_locs:
            if l != init_loc and l not in p_goals:
                return [f"(always (not (at {p} {l})))"]

    return []

# --------- 解析 plan/solution ---------
def _strip_comments(text: str) -> str:
    """去掉分号 ; 行内注释。"""
    return re.sub(r';.*$', '', text, flags=re.MULTILINE)


def parse_solution_actions(solution_text: str) -> List[Tuple[str, List[str]]]:
    """
    从 solution 文本中抽取动作及参数。
    兼容形如:
        0: (LOAD-TRUCK P1 T0 L0-0)
        (load-airplane p2 a0 l0-0)
        (drive-truck t0 l0-0 l0-1)
    """
    if not solution_text:
        return []
    txt = _strip_comments(solution_text)
    acts: List[Tuple[str, List[str]]] = []
    # 捕获所有括号内的 s-expr（忽略前面的序号/冒号）
    for m in re.finditer(r'\([^\(\)]*\)', txt, flags=re.IGNORECASE):
        expr = m.group(0)
        tokens = re.findall(r'[^\s()]+', expr)
        if not tokens:
            continue
        name = tokens[0]
        args = tokens[1:]
        acts.append((name, args))
    return acts


# --------- 方案二：根据旧解生成的定向约束（核心新增） ---------
def generate_constraints_from_solution(problem_text: str,
                                       solution_text: str,
                                       strategy: str = "minimal") -> List[str]:
    """
    读取旧解，合成让旧解失效但尽量温和的 PDDL3 约束（不含外层 (:constraints ...)）。
    选择策略（按优先级）：
      1) 若旧解把某包裹装上了 t，且卡车数量≥2：禁止 (in p t)
      2) 若旧解把某包裹装上了 a，且飞机数量≥2：禁止 (in p a)
      3) 禁止旧解曾到过的某个中间位置（非init/非goal）：禁止 (at p l)
      4) 回退到问题内生的默认生成器（generate_logistics_constraints）
    """
    info = _parse_logistics(problem_text)
    trucks, planes = info["trucks"], info["planes"]
    init_at, goal_at = info["init_at"], info["goal_at"]

    actions = parse_solution_actions(solution_text)
    if not actions:
        return []

    loads_truck: List[Tuple[str, str, str]] = []  # (p, t, l)
    loads_plane: List[Tuple[str, str, str]] = []  # (p, a, l)
    mid_places:  List[Tuple[str, str]] = []       # (p, l)

    def _is(name: str, *keys: str) -> bool:
        n = name.lower()
        return all(k in n for k in keys)

    for name, args in actions:
        n = name.lower()
        # ---- 解析 load / unload 动作，尽量兼容各种命名 ----
        if len(args) >= 3:
            # LOAD onto TRUCK?
            if _is(n, 'load', 'truck'):
                p, t, l = args[0], args[1], args[2]
                loads_truck.append((p, t, l))
                mid_places.append((p, l))
            # LOAD onto AIRPLANE/PLANE?
            elif _is(n, 'load') and ('airplane' in n or 'plane' in n):
                p, a, l = args[0], args[1], args[2]
                loads_plane.append((p, a, l))
                mid_places.append((p, l))
            # UNLOAD 提取到达位置（也视作中间位置候选）
            elif _is(n, 'unload'):
                p, v, l = args[0], args[1], args[2]
                mid_places.append((p, l))

    # 1) 优先从卡车承运里挑：至少两辆卡车 -> 禁止 in(p, t)
    if len(trucks) >= 2:
        for (p, t, _l) in loads_truck:
            # 保证名字真的属于 trucks / pkgs 的一致性在 PDDL 里不是强制的，但最好稳妥一些
            if t in trucks:
                return [f"(always (not (in {p} {t})))"]

    # 2) 再从飞机承运挑：至少两架飞机 -> 禁止 in(p, a)
    if len(planes) >= 2:
        for (p, a, _l) in loads_plane:
            if a in planes:
                return [f"(always (not (in {p} {a})))"]

    # 3) 再禁中间位置：选一个不是 init/goal 的 (p, l)
    for (p, l) in mid_places:
        if l != init_at.get(p) and l not in goal_at.get(p, set()):
            return [f"(always (not (at {p} {l})))"]

    # 4) 实在挑不出来就回退到默认生成器
    return generate_logistics_constraints(problem_text)


def insert_constraints(problem_text: str,
                       solution_text: Optional[str] = None,
                       constraints_exprs: Optional[List[str]] = None,
                       overwrite_if_exists: bool = False) -> str:
    """
    将若干条约束表达式插入 problem 文本为 (:constraints ...).
    - 默认不覆盖已有约束；当 overwrite_if_exists=True 时，会先移除旧的约束块再插入。
    """
    has_constraints = re.search(r'\(\s*:constraints\b', problem_text, flags=re.IGNORECASE)
    if has_constraints:
        if not overwrite_if_exists:
            return problem_text
        # 移除已有约束块
        span = _extract_block_span(problem_text, 'constraints')
        if span:
            s, e = span
            problem_text = problem_text[:s] + problem_text[e:]

    if constraints_exprs is None:
        if solution_text:
            constraints_exprs = generate_constraints_from_solution(problem_text, solution_text)
        if not constraints_exprs:
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

# --------- I/O 工具 ---------
def _read_text(path: str) -> Optional[str]:
    try:
        with open(path, 'r', encoding='utf-8') as f:
            return f.read()
    except Exception:
        try:
            with open(path, 'r', encoding='latin-1') as f:
                return f.read()
        except Exception:
            return None


def _find_solution_file(problem_file: str, solution_dir: Optional[str]) -> Optional[str]:
    """
    在 solution_dir（若为空则使用 problem_file 所在目录）中寻找
    与 problem 同名（不含扩展名）的解文件，扩展名尝试 .sol/.plan/.txt。
    """
    base = os.path.splitext(os.path.basename(problem_file))[0]
    cand_dirs = [solution_dir] if solution_dir else [os.path.dirname(problem_file)]
    exts = ['.soln', '.plan', '.txt']  # 修复：.soln -> .sol
    for d in cand_dirs:
        if not d:
            continue
        for ext in exts:
            p = os.path.join(d, base + ext)
            if os.path.isfile(p):
                return p
    for d in cand_dirs:
        if not d:
            continue
        sub = os.path.join(d, 'solutions')
        for ext in exts:
            p = os.path.join(sub, base + ext)
            if os.path.isfile(p):
                return p
    return None


# --------- 转换函数 ---------
def convert_problem_to_pddl3(problem_file: str,
                             output_dir: str,
                             solution_dir: Optional[str] = None) -> bool:
    """
    将单个 logistics 问题文件转换为 PDDL3 格式，并基于旧解生成使其失效的约束。

    Args:
        problem_file: 输入问题文件路径
        output_dir: 输出目录
        solution_dir: 旧解所在目录（可选；不提供则到问题同目录/solutions/里找）

    Returns:
        bool: 是否成功转换
    """
    try:
        # 读取原始问题文件
        problem_text = _read_text(problem_file)
        if problem_text is None:
            raise ValueError("读取 problem 失败")

        # 查找并读取 solution
        sol_file = _find_solution_file(problem_file, solution_dir)
        solution_text = _read_text(sol_file) if sol_file else None

        # 转换为 PDDL3：优先用 solution 生成的定向约束
        pddl3_text = insert_constraints(problem_text, solution_text=solution_text)

        # 生成输出文件名
        base_name = os.path.basename(problem_file)
        output_file = os.path.join(output_dir, base_name)

        # 写入 PDDL3 问题文件
        os.makedirs(output_dir, exist_ok=True)
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(pddl3_text)

        # 打印提示
        if sol_file:
            print(f"  使用解文件: {os.path.basename(sol_file)} → 已注入定向约束")
        else:
            print(f"  未找到对应解文件 → 使用默认生成器注入约束")

        return True

    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False


def convert_all_problems(input_dir: str,
                         output_dir: str,
                         solution_dir: Optional[str] = None):
    """
    转换指定文件夹中的所有 logistics 问题为 PDDL3 格式，并基于旧解注入使其失效的约束。

    Args:
        input_dir: 输入问题文件夹
        output_dir: 输出文件夹
        solution_dir: 旧解文件夹（可选）
    """
    # 检查输入目录是否存在
    if not os.path.exists(input_dir):
        print(f"错误: 输入目录 {input_dir} 不存在")
        return

    # 清空并创建输出目录
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    # 获取所有 PDDL 问题文件
    problem_files = glob.glob(os.path.join(input_dir, "*.pddl"))

    if not problem_files:
        print(f"在 {input_dir} 文件夹中没有找到 PDDL 问题文件")
        return

    print(f"找到 {len(problem_files)} 个问题文件")
    print(f"开始转换为 PDDL3 格式...")
    print(f"输入目录: {input_dir}")
    print(f"输出目录: {output_dir}")
    if solution_dir:
        print(f"解目录:   {solution_dir}")
    print("-" * 50)

    successful = 0
    failed = 0

    for i, problem_file in enumerate(sorted(problem_files), 1):
        print(f"[{i}/{len(problem_files)}] 转换: {os.path.basename(problem_file)} ")
        if convert_problem_to_pddl3(problem_file, output_dir, solution_dir=solution_dir):
            print("   ✓ 成功")
            successful += 1
        else:
            print("   ✗ 失败")
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
        print("用法: python convert_to_pddl3.py <输入目录> [输出目录] [解目录]")
        print("示例: python convert_to_pddl3.py problems problems_pddl3")
        print("      python convert_to_pddl3.py A A_pddl3 A_plans")
        print("      （若不提供解目录，将在问题同目录/solutions/中按同名查找 .sol/.plan/.txt）")
        sys.exit(1)

    # 获取输入和输出目录
    input_dir = sys.argv[1]
    output_dir = sys.argv[2] if len(sys.argv) > 2 else f"{input_dir}_pddl3"
    solution_dir = sys.argv[3] if len(sys.argv) > 3 else None

    convert_all_problems(input_dir, output_dir, solution_dir=solution_dir)
