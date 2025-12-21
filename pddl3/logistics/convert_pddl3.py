
import re
import os
import glob
import shutil
from typing import Dict, List, Optional, Set, Tuple

# --------- 基础解析工具 (保持不变) ---------
def _extract_block(text: str, key: str) -> Optional[str]:
    m = re.search(rf'\(\s*:{re.escape(key)}\b', text, flags=re.IGNORECASE)
    if not m: return None
    start = m.start()
    depth = 0
    for i, ch in enumerate(text[start:], start=start):
        if ch == '(': depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0: return text[start:i+1]
    return None

def _atoms(block: Optional[str], pred: str, arity: int) -> List[Tuple[str, ...]]:
    if not block: return []
    pattern = r'\(\s*' + re.escape(pred) + ''.join([r'\s+([^\s()]+)'] * arity) + r'\s*\)'
    return [tuple(m.groups()) for m in re.finditer(pattern, block, flags=re.IGNORECASE)]

def _extract_block_span(text: str, key: str) -> Optional[Tuple[int, int]]:
    m = re.search(rf'\(\s*:{re.escape(key)}\b', text, flags=re.IGNORECASE)
    if not m: return None
    start = m.start()
    depth = 0
    for i, ch in enumerate(text[start:], start=start):
        if ch == '(': depth += 1
        elif ch == ')':
            depth -= 1
            if depth == 0: return (start, i + 1)
    return None

def _group_by_city(ents: Set[str], at_map: Dict[str, str], loc2city: Dict[str, str]) -> Dict[str, Set[str]]:
    res: Dict[str, Set[str]] = {}
    for e in ents:
        loc = at_map.get(e)
        if not loc: continue
        city = loc2city.get(loc)
        if city is None: continue
        res.setdefault(city, set()).add(e)
    return res

# --------- logistics 专用抽取 (保持不变) ---------
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
        if ent in pkgs: init_at[ent] = loc
        elif ent in trucks: truck_at[ent] = loc
        elif ent in planes: plane_at[ent] = loc

    goal_at_pairs = _atoms(goal_block, 'at', 2)
    goal_at: Dict[str, Set[str]] = {}
    for ent, loc in goal_at_pairs:
        if ent in pkgs: goal_at.setdefault(ent, set()).add(loc)

    trucks_by_city = _group_by_city(trucks, truck_at, loc2city)
    airports_by_city: Dict[str, Set[str]] = {}
    for ap in airports:
        city = loc2city.get(ap)
        if city is not None: airports_by_city.setdefault(city, set()).add(ap)

    return {
        "pkgs": pkgs, "trucks": trucks, "planes": planes, "locs": locs,
        "airports": airports, "cities": cities, "loc2city": loc2city,
        "init_at": init_at, "goal_at": goal_at,
        "truck_at": truck_at, "plane_at": plane_at,
        "trucks_by_city": trucks_by_city, "airports_by_city": airports_by_city
    }

def generate_logistics_constraints(problem_text: str) -> List[str]:
    # 默认生成器（仅作 Fallback 使用）
    info = _parse_logistics(problem_text)
    pkgs, planes, loc2city = info["pkgs"], info["planes"], info["loc2city"]
    init_at, goal_at, locs = info["init_at"], info["goal_at"], info["locs"]
    airports, trucks_by_city = info["airports"], info["trucks_by_city"]

    constraints: List[str] = []
    if planes:
        for p in sorted(pkgs):
            init_loc = init_at.get(p)
            goals = goal_at.get(p, set())
            if not init_loc or not goals: continue
            init_city = loc2city.get(init_loc)
            goal_cities = {loc2city.get(g) for g in goals}
            if (init_city is not None and len(goal_cities) == 1 and init_city in goal_cities):
                if len(trucks_by_city.get(init_city, set())) >= 1:
                    for a in sorted(planes):
                        constraints.append(f"(always (not (in {p} {a})))")
    if constraints: return constraints

    non_airport_locs = sorted(locs - airports)
    for p in sorted(pkgs):
        init_loc = init_at.get(p)
        p_goals = goal_at.get(p, set())
        for l in non_airport_locs:
            if l != init_loc and l not in p_goals:
                return [f"(always (not (at {p} {l})))"]
    return []

# --------- 解析 plan/solution (保持不变) ---------
def _strip_comments(text: str) -> str:
    return re.sub(r';.*$', '', text, flags=re.MULTILINE)

def parse_solution_actions(solution_text: str) -> List[Tuple[str, List[str]]]:
    if not solution_text: return []
    txt = _strip_comments(solution_text)
    acts: List[Tuple[str, List[str]]] = []
    for m in re.finditer(r'\([^\(\)]*\)', txt, flags=re.IGNORECASE):
        expr = m.group(0)
        tokens = re.findall(r'[^\s()]+', expr)
        if not tokens: continue
        name = tokens[0]
        args = tokens[1:]
        acts.append((name, args))
    return acts

# --------- 核心修改：生成约束逻辑 ---------
def generate_constraints_from_solution(problem_text: str,
                                       solution_text: str) -> List[str]:
    """
    根据旧解生成 PDDL3 约束。
    
    Priority 1 (方案一): 时序反转 (Temporal Ordering)
    - 检测旧解中所有包裹到达 Goal 的顺序。
    - 选取“最早送达的包裹” (Early) 和 “最晚送达的包裹” (Late)。
    - 生成约束: (sometime-before (at Late Goal_Late) (at Early Goal_Early))
    - 含义: 必须先把那个原本最后送到的包裹送完，才能送原本最早的包裹。
    
    Priority 2 (方案二): 资源/路径禁用 (Fallback)
    - 如果 Priority 1 无法生成（例如只有一个包裹），则使用禁止特定卡车/飞机的逻辑。
    """
    info = _parse_logistics(problem_text)
    goal_at = info["goal_at"]
    trucks, planes = info["trucks"], info["planes"]
    init_at = info["init_at"]

    actions = parse_solution_actions(solution_text)
    if not actions:
        return []

    # --- 1. 提取所有包裹送达 Goal 的事件 ---
    # 格式: List of (package, location, action_index)
    delivery_events: List[Tuple[str, str]] = []
    
    # 辅助列表用于方案二
    loads_truck: List[Tuple[str, str, str]] = []
    loads_plane: List[Tuple[str, str, str]] = []
    mid_places:  List[Tuple[str, str]] = []

    def _is(name: str, *keys: str) -> bool:
        n = name.lower()
        return all(k in n for k in keys)

    for idx, (name, args) in enumerate(actions):
        n = name.lower()
        
        # 记录 Load/Unload 用于方案二
        if len(args) >= 3:
            if _is(n, 'load', 'truck'):
                loads_truck.append((args[0], args[1], args[2]))
                mid_places.append((args[0], args[2]))
            elif _is(n, 'load') and ('airplane' in n or 'plane' in n):
                loads_plane.append((args[0], args[1], args[2]))
                mid_places.append((args[0], args[2]))
            elif _is(n, 'unload'):
                pkg, veh, loc = args[0], args[1], args[2]
                mid_places.append((pkg, loc))
                
                # 核心：检查是否送达 Goal
                # 如果 Unload 的位置 loc 是该包裹 pkg 的目标之一
                if pkg in goal_at and loc in goal_at[pkg]:
                    # 避免重复记录（如果多步都在Goal操作，只记第一次到达）
                    # 简单起见，记录每一次 Unload at Goal 
                    delivery_events.append((pkg, loc))

    # --- 策略 1: 时序反转 (Temporal Reordering) ---
    # 只有当至少有 2 次不同的送达事件时才有效
    if len(delivery_events) >= 2:
        # 取出旧解中最先完成的任务和最后完成的任务
        first_pkg, first_loc = delivery_events[0]
        last_pkg, last_loc = delivery_events[-1]

        # 只要这俩不是同一个事件（虽然同事件LTL也合法，但没意义），就生成约束
        if not (first_pkg == last_pkg and first_loc == last_loc):
            print(f"    [策略1] 发现送达顺序: {first_pkg} (First) -> ... -> {last_pkg} (Last)")
            print(f"    [策略1] 生成约束: 强制 {last_pkg} 必须在 {first_pkg} 之前送达")
            
            # PDDL3 语法: (sometime-before <antecedent> <consequent>)
            # 语义: consequent 变为真之前，antecedent 必须曾经为真。
            # 我们希望: (at last_pkg last_loc) 必须在 (at first_pkg first_loc) 之前发生
            constraint = f"(sometime-before (at {last_pkg} {last_loc}) (at {first_pkg} {first_loc}))"
            return [constraint]

    # --- 策略 2: 资源/路径禁用 (Fallback) ---
    print(f"    [策略1] 无法应用 (送达事件不足2个)，回退到策略2 (资源禁用)")

    # 2.1 禁止特定卡车 (如果有多辆卡车)
    if len(trucks) >= 2:
        for (p, t, _l) in loads_truck:
            if t in trucks:
                return [f"(always (not (in {p} {t})))"]

    # 2.2 禁止特定飞机 (如果有多架飞机)
    if len(planes) >= 2:
        for (p, a, _l) in loads_plane:
            if a in planes:
                return [f"(always (not (in {p} {a})))"]

    # 2.3 禁止中间路径点
    for (p, l) in mid_places:
        if l != init_at.get(p) and l not in goal_at.get(p, set()):
            return [f"(always (not (at {p} {l})))"]

    # --- 策略 3: 默认生成 ---
    return generate_logistics_constraints(problem_text)


def insert_constraints(problem_text: str,
                       solution_text: Optional[str] = None,
                       constraints_exprs: Optional[List[str]] = None,
                       overwrite_if_exists: bool = False) -> str:
    """
    将若干条约束表达式插入 problem 文本为 (:constraints ...).
    """
    # 1. 如果已有 constraints，根据 overwrite 决定去留
    has_constraints = re.search(r'\(\s*:constraints\b', problem_text, flags=re.IGNORECASE)
    if has_constraints:
        if not overwrite_if_exists:
            return problem_text
        span = _extract_block_span(problem_text, 'constraints')
        if span:
            s, e = span
            problem_text = problem_text[:s] + problem_text[e:]

    # 2. 生成约束内容
    if constraints_exprs is None:
        if solution_text:
            constraints_exprs = generate_constraints_from_solution(problem_text, solution_text)
        
        # 二次检查：如果上面没生成出来（比如没solution），用默认的
        if not constraints_exprs:
            constraints_exprs = generate_logistics_constraints(problem_text)

    if not constraints_exprs:
        # 假如真的什么都生成不出来（极其罕见），返回原文本以免报错，或者抛出异常
        print("    警告: 无法生成有效约束")
        return problem_text

    # 3. 格式化并插入
    # 查找最后一个反括号
    last_paren = problem_text.rfind(')')
    if last_paren == -1:
        raise ValueError("Problem 文件格式错误: 未找到结尾 ')'")

    # 构造 constraints 块
    block = "\n  (:constraints\n"
    if len(constraints_exprs) == 1:
        block += f"      {constraints_exprs[0]}\n"
    else:
        block += "      (and\n"
        for c in constraints_exprs:
            block += f"          {c}\n"
        block += "      )\n"
    block += "  )\n"

    return problem_text[:last_paren] + block + problem_text[last_paren:]

# --------- I/O 工具 (保持不变) ---------
def _read_text(path: str) -> Optional[str]:
    try:
        with open(path, 'r', encoding='utf-8') as f: return f.read()
    except:
        try:
            with open(path, 'r', encoding='latin-1') as f: return f.read()
        except: return None

def _find_solution_file(problem_file: str, solution_dir: Optional[str]) -> Optional[str]:
    base = os.path.splitext(os.path.basename(problem_file))[0]
    cand_dirs = [solution_dir] if solution_dir else [os.path.dirname(problem_file)]
    exts = ['.sol', '.soln', '.plan', '.txt'] 
    
    # 1. 直接在目录找
    for d in cand_dirs:
        if not d: continue
        for ext in exts:
            p = os.path.join(d, base + ext)
            if os.path.isfile(p): return p
    # 2. 在 solutions 子目录找
    for d in cand_dirs:
        if not d: continue
        sub = os.path.join(d, 'solutions')
        for ext in exts:
            p = os.path.join(sub, base + ext)
            if os.path.isfile(p): return p
    return None

# --------- 转换逻辑 (保持不变) ---------
def convert_problem_to_pddl3(problem_file: str,
                             output_dir: str,
                             solution_dir: Optional[str] = None) -> bool:
    try:
        problem_text = _read_text(problem_file)
        if not problem_text: raise ValueError("无法读取文件")

        sol_file = _find_solution_file(problem_file, solution_dir)
        solution_text = _read_text(sol_file) if sol_file else None

        # 核心调用
        pddl3_text = insert_constraints(problem_text, solution_text=solution_text, overwrite_if_exists=True)

        base_name = os.path.basename(problem_file)
        output_file = os.path.join(output_dir, base_name)

        os.makedirs(output_dir, exist_ok=True)
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(pddl3_text)

        msg = "使用解文件注入约束" if sol_file else "使用默认规则注入约束"
        print(f"  {msg}: {os.path.basename(sol_file) if sol_file else ''}")
        return True
    except Exception as e:
        print(f"转换失败 {problem_file}: {e}")
        return False

def convert_all_problems(input_dir: str, output_dir: str, solution_dir: Optional[str] = None):
    if not os.path.exists(input_dir):
        print(f"目录不存在: {input_dir}")
        return
    if os.path.exists(output_dir): shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    files = glob.glob(os.path.join(input_dir, "*.pddl"))
    if not files:
        print("未找到 .pddl 文件")
        return

    print(f"开始处理 {len(files)} 个文件...")
    suc = 0
    for f in sorted(files):
        print(f"处理: {os.path.basename(f)}")
        if convert_problem_to_pddl3(f, output_dir, solution_dir):
            suc += 1
    print(f"完成。成功: {suc}/{len(files)}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python script.py <input_dir> [output_dir] [solution_dir]")
        sys.exit(1)
    
    inp = sys.argv[1]
    out = sys.argv[2] if len(sys.argv) > 2 else f"{inp}_pddl3"
    sol = sys.argv[3] if len(sys.argv) > 3 else None
    
    convert_all_problems(inp, out, sol)
