import re
import itertools
import random
from typing import List, Dict, Tuple, Any, Set

# ------------------------
# 1) 极简 PDDL 解析
# ------------------------

def strip_comments(s: str) -> str:
    return re.sub(r";[^\n]*", "", s)

def sexpr_parse(s: str) -> Any:
    """非常轻量的 S-expression 解析，返回嵌套 list。"""
    s = strip_comments(s)
    s = s.replace("(", " ( ").replace(")", " ) ")
    tokens = [t for t in s.split() if t]
    def read(tokens):
        if not tokens:
            raise ValueError("Unexpected EOF while reading S-expression")
        tok = tokens.pop(0)
        if tok == '(':
            L = []
            while tokens and tokens[0] != ')':
                L.append(read(tokens))
            if not tokens:
                raise ValueError("Missing ')'")
            tokens.pop(0)
            return L
        elif tok == ')':
            raise ValueError("Unexpected ')'")
        else:
            return tok
    return read(tokens)

def find_blocks(ast, key: str) -> List[Any]:
    """在 AST 中收集以 key 开头的块，例如 ':predicates' 或 ':action'。"""
    out = []
    if isinstance(ast, list):
        if ast and isinstance(ast[0], str) and ast[0].lower() == key.lower():
            out.append(ast)
        for x in ast:
            out.extend(find_blocks(x, key))
    return out

def find_all_actions(ast) -> List[Any]:
    actions = []
    if isinstance(ast, list):
        if ast and isinstance(ast[0], str) and ast[0].lower() == ':action':
            actions.append(ast)
        for x in ast:
            actions.extend(find_all_actions(x))
    return actions

def flatten(l):
    for x in l:
        if isinstance(x, list):
            yield from flatten(x)
        else:
            yield x

def parse_predicates(pred_block: List[Any]) -> Dict[str, Dict]:
    """
    解析 (:predicates (p ?x - type ?y - type2) (q ?z) ...)
    返回 { name: {"args":[("x","type"),...]} }
    未标注类型时用 'object'
    """
    assert pred_block and pred_block[0].lower() == ':predicates'
    preds = {}
    for entry in pred_block[1:]:
        if not isinstance(entry, list) or not entry:
            continue
        name = entry[0]
        argspec = entry[1:]
        # 解析 ?var - type 的结构
        args = []
        i = 0
        while i < len(argspec):
            tok = argspec[i]
            if isinstance(tok, str) and tok.startswith('?'):
                var = tok
                ty = 'object'
                if i + 2 <= len(argspec)-1 and argspec[i+1] == '-' and isinstance(argspec[i+2], str):
                    ty = argspec[i+2]
                    i += 3
                else:
                    i += 1
                args.append((var, ty))
            else:
                i += 1
        preds[name] = {"args": args}
    return preds

def parse_objects(obj_block: List[Any]) -> Dict[str, List[str]]:
    """
    解析 (:objects a b - loc  c d - truck  e) -> { 'loc':[a,b], 'truck':[c,d], 'object':[e] }
    """
    assert obj_block and obj_block[0].lower() == ':objects'
    tokens = obj_block[1:]
    # 拍平成一维方便处理
    flat = list(flatten(tokens))
    by_type: Dict[str, List[str]] = {}
    buffer_names: List[str] = []
    i = 0
    while i < len(flat):
        tok = flat[i]
        if tok == '-':
            ty = flat[i+1]
            by_type.setdefault(ty, []).extend(buffer_names)
            buffer_names = []
            i += 2
        else:
            buffer_names.append(tok)
            i += 1
    if buffer_names:
        by_type.setdefault('object', []).extend(buffer_names)
    return by_type

def collect_effect_atoms(effect_ast: Any) -> Tuple[Set[Tuple[str, Tuple[str,...]]], Set[Tuple[str, Tuple[str,...]]]]:
    """
    从 :effect AST 中提取正/负原子：
    返回 (adds, dels)，元素形如 ('at', ('?x','?y'))
    """
    adds, dels = set(), set()

    def visit(node, neg=False):
        if not isinstance(node, list) or not node:
            return
        head = node[0]
        if isinstance(head, str) and head.lower() == 'and':
            for c in node[1:]:
                visit(c, neg)
        elif isinstance(head, str) and head.lower() == 'not':
            if len(node) >= 2 and isinstance(node[1], list) and node[1]:
                visit(node[1], not neg)
        else:
            # 原子： (pred arg1 arg2 ...)
            pred = head if isinstance(head, str) else None
            if pred:
                args = tuple(a for a in node[1:] if isinstance(a, str))
                if neg:
                    dels.add((pred, args))
                else:
                    adds.add((pred, args))

    visit(effect_ast, neg=False)
    return adds, dels

def get_action_effect_map(action_ast: List[Any]) -> Dict[str, Dict[str, Set[Tuple[str,...]]]]:
    """
    返回该 action 的 effect 中各谓词的 add/del 变量模式。
    例如 { 'at': {'add': {('?x','?to')}, 'del': {('?x','?from')}} , ... }
    """
    eff_map: Dict[str, Dict[str, Set[Tuple[str,...]]]] = {}
    # 查找 :effect 块
    i = 0
    while i < len(action_ast):
        if action_ast[i] == ':effect' and i+1 < len(action_ast):
            effect_ast = action_ast[i+1]
            adds, dels = collect_effect_atoms(effect_ast)
            for pred, args in adds:
                eff_map.setdefault(pred, {}).setdefault('add', set()).add(args)
            for pred, args in dels:
                eff_map.setdefault(pred, {}).setdefault('del', set()).add(args)
            break
        i += 1
    return eff_map

def analyze_domain(domain_text: str) -> Tuple[Dict, Dict[str, Dict[str, Set[Tuple[str,...]]]]]:
    ast = sexpr_parse(domain_text)
    pred_blocks = find_blocks(ast, ':predicates')
    if not pred_blocks:
        raise ValueError("No :predicates found in domain.")
    preds = parse_predicates(pred_blocks[0])

    actions = find_all_actions(ast)
    eff_maps = {}
    for act in actions:
        em = get_action_effect_map(act)
        for k,v in em.items():
            # 合并到全域
            glob = eff_maps.setdefault(k, {'add': set(), 'del': set()})
            glob['add'] |= v.get('add', set())
            glob['del'] |= v.get('del', set())
    return preds, eff_maps

def analyze_problem(problem_text: str) -> Dict[str, List[str]]:
    ast = sexpr_parse(problem_text)
    obj_blocks = find_blocks(ast, ':objects')
    if not obj_blocks:
        return {'object': []}
    return parse_objects(obj_blocks[0])

# ------------------------
# 2) 从 effect 推断“功能性/动态性”
# ------------------------

def infer_predicate_properties(preds: Dict[str, Dict], eff_maps: Dict[str, Dict[str, Set[Tuple[str,...]]]]):
    """
    返回
      dynamic_preds: 出现在 effect 的谓词
      functional_on_1: 似乎在第1参数上是函数式（y->x 不冲突）
      functional_on_2: 似乎在第2参数上是函数式（x->y 唯一）
    判据：同一动作的 add/del 里，出现 (p ?a ?u) 被删、(p ?a ?v) 被加（u!=v），则 arg2 对 arg1 “功能唯一”。
    同理可检测对称情况。
    """
    dynamic_preds = set(eff_maps.keys())
    functional_on_1, functional_on_2 = set(), set()

    for p, mp in eff_maps.items():
        add_args = mp.get('add', set())
        del_args = mp.get('del', set())
        arity = None
        # 粗略 arity
        for t in list(add_args) + list(del_args):
            arity = len(t)
            break
        if arity != 2:
            continue
        # 统计基于变量名的“切换模式”
        # del: (x, y1), add: (x, y2) 且 y1 != y2 -> functional_on_2
        # del: (x1, y), add: (x2, y) 且 x1 != x2 -> functional_on_1
        for dx in del_args:
            for ax in add_args:
                if dx[0] == ax[0] and dx[1] != ax[1]:
                    functional_on_2.add(p)
                if dx[1] == ax[1] and dx[0] != ax[0]:
                    functional_on_1.add(p)
    return dynamic_preds, functional_on_1, functional_on_2

# ------------------------
# 3) 生成 LTL / STL 安全约束（实例化）
# ------------------------

def ground_pairs(objs: List[str]) -> List[Tuple[str,str]]:
    return [(a,b) for a in objs for b in objs]

def distinct_pairs(objs: List[str]) -> List[Tuple[str,str]]:
    return [(a,b) for a in objs for b in objs if a != b]

def choose_type_objects(arg_ty: str, objects_by_type: Dict[str, List[str]], fallback_all: List[str]) -> List[str]:
    if arg_ty in objects_by_type and objects_by_type[arg_ty]:
        return objects_by_type[arg_ty]
    # 简单的“子类型”兼容：找包含该类型名的键（如 robot/robot-type）
    for k,v in objects_by_type.items():
        if arg_ty in k and v:
            return v
    return fallback_all

def gen_safety_constraints(domain_path: str,
                           problem_path: str,
                           logic: str = "both",
                           max_ground: int = 500,
                           include_antisymmetry: bool = True,
                           seed: int = 0) -> Dict[str, List[str]]:
    """
    自动生成基于 LTL/STL 的安全约束（不变式为主），从 domain/problem 中抽取动态谓词并按对象实例化。
    返回 {"ltl":[...], "stl":[...]}（根据 logic 选择返回项）。
    """
    random.seed(seed)

    with open(domain_path, 'r', encoding='utf-8') as f:
        domain_text = f.read()
    with open(problem_path, 'r', encoding='utf-8') as f:
        problem_text = f.read()

    preds, eff_maps = analyze_domain(domain_text)
    objects_by_type = analyze_problem(problem_text)
    all_objects = sorted({o for L in objects_by_type.values() for o in L})

    dynamic_preds, functional_on_1, functional_on_2 = infer_predicate_properties(preds, eff_maps)

    ltl_out, stl_out = [], []

    def emit(formula_base: str):
        # 根据 logic 输出到 ltl/stl 列表；STL 用 G[0, +inf) 替换 G
        if logic in ("both", "ltl"):
            ltl_out.append(formula_base)
        if logic in ("both", "stl"):
            stl_out.append(formula_base.replace("G ", "G[0,+inf) "))

    # 规则模板：
    # A) 反自反（同型二元动态谓词）：  G ¬ p(x,x)
    # B) 函数式唯一（x->y 唯一）：      G ¬(p(x,y1) ∧ p(x,y2) ∧ y1≠y2)
    # C) 函数式唯一（y->x 唯一）：      G ¬(p(x1,y) ∧ p(x2,y) ∧ x1≠x2)
    # D) 反对称（可选）：                G ¬(p(x,y) ∧ p(y,x) ∧ x≠y)

    formulas = []

    for p, meta in preds.items():
        if p not in dynamic_preds:
            continue
        arg_types = [ty for (_, ty) in meta["args"]]
        arity = len(arg_types)

        # 只考虑元数 <= 2 的谓词做默认模板
        if arity == 1:
            # 对一元动态谓词暂不强加约束（很多是状态标志），如需可扩展互斥等
            continue

        if arity != 2:
            continue

        ty1, ty2 = arg_types
        objs1 = choose_type_objects(ty1, objects_by_type, all_objects)
        objs2 = choose_type_objects(ty2, objects_by_type, all_objects)

        # A) 反自反（当两参数类型一致时）
        if ty1 == ty2 and include_antisymmetry:
            for a in objs1:
                formulas.append(f"G ¬ {p}({a},{a})")

        # B) x -> y 功能唯一
        if p in functional_on_2:
            for x in objs1:
                # 两个不同的 y
                for y1, y2 in itertools.permutations(objs2, 2):
                    if y1 == y2:
                        continue
                    formulas.append(f"G ¬ ({p}({x},{y1}) ∧ {p}({x},{y2}))")

        # C) y -> x 功能唯一
        if p in functional_on_1:
            for y in objs2:
                for x1, x2 in itertools.permutations(objs1, 2):
                    if x1 == x2:
                        continue
                    formulas.append(f"G ¬ ({p}({x1},{y}) ∧ {p}({x2},{y}))")

        # D) 反对称（当两参数类型一致时）
        if ty1 == ty2 and include_antisymmetry:
            for a,b in distinct_pairs(objs1):
                formulas.append(f"G ¬ ({p}({a},{b}) ∧ {p}({b},{a}))")

    # 控制实例化数量，避免组合爆炸
    if len(formulas) > max_ground:
        formulas = random.sample(formulas, k=max_ground)

    for fml in formulas:
        emit(fml)

    out = {}
    if logic in ("both", "ltl"):
        out["ltl"] = ltl_out
    if logic in ("both", "stl"):
        out["stl"] = stl_out
    return out

# ------------------------
# 使用示例
# ------------------------
if __name__ == "__main__":
    # 举例：
    constraints = gen_safety_constraints("domain.pddl", "problem.pddl",
                                         logic="both", max_ground=300, include_antisymmetry=True, seed=42)
    print("LTL:", *constraints.get("ltl", [])[:10], sep="\n")
    print("STL:", *constraints.get("stl", [])[:10], sep="\n")
