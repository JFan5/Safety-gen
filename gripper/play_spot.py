import spot

# 这些是"字符串模板"，稍后会做变量替换生成实例级公式
# 注意：Spot 要求原子命题是简单标识符，不能有括号，所以用下划线连接
LTL_TEMPLATES = {
    "pick": "G( do_pick_{o}_{r}_{g} -> ( at_{o}_{r} & at_robby_{r} & free_{g} ) )",
    "drop": "G( do_drop_{o}_{r}_{g} -> ( carry_{o}_{g} & at_robby_{r} ) )",
    "move": "G( do_move_{fr}_{to} -> ( room_{fr} & room_{to} & at_robby_{fr} ) )",
}

# 假设我们在数据/验证里也会用到“状态不变量”，可以加一些可选式子
INVARIANTS = [
    # free(g) 与 carry 的互斥（弱化写法，避免量词：实例化后展开）
    # 例：G( free(left) -> !(carry(ball1,left) | carry(ball2,left) | ... ) )
]
rooms   = ["rooma", "roomb"]
balls   = ["ball1", "ball2", "ball3", "ball4"]
grippers= ["left"]  # 只有一个手

def inst_pick_templates():
    formulas = []
    for o in balls:
        for r in rooms:
            for g in grippers:
                fstr = LTL_TEMPLATES["pick"].format(o=o, r=r, g=g)
                formulas.append(spot.formula(fstr))
    return formulas

def inst_drop_templates():
    formulas = []
    for o in balls:
        for r in rooms:
            for g in grippers:
                fstr = LTL_TEMPLATES["drop"].format(o=o, r=r, g=g)
                formulas.append(spot.formula(fstr))
    return formulas

def inst_move_templates():
    formulas = []
    for fr in rooms:
        for to in rooms:
            if fr == to: 
                continue
            fstr = LTL_TEMPLATES["move"].format(fr=fr, to=to)
            formulas.append(spot.formula(fstr))
    return formulas

# 汇总本 problem 的所有安全式
all_safety_formulas = inst_pick_templates() + inst_drop_templates() + inst_move_templates()
print(f"Instantiated safety formulas: {len(all_safety_formulas)}")
print("\n=== LTL Formulas ===")
for i, formula in enumerate(all_safety_formulas, 1):
    print(f"{i}. {formula}")

# 将所有安全公式做合取：G(...) & G(...) & ...
# 也可以逐条单独检查
from functools import reduce
def conj_all(fs):
    if not fs: return spot.formula("1")  # True
    cur = fs[0]
    for f in fs[1:]:
        cur = spot.formula("(%s) & (%s)" % (str(cur), str(f)))
    return cur

conj_formula = conj_all(all_safety_formulas)
aut = spot.translate(conj_formula, "BA")  # 转为 Büchi 自动机（或 "tgba"）
print(aut.num_states(), "states")

# 保存为 HOA 文件，便于后续外部工具使用
with open("gripper_safety.hoa", "w", encoding="utf-8") as f:
    f.write(aut.to_str("hoa"))
