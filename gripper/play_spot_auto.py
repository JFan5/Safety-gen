import spot
import re
from pathlib import Path

def parse_pddl_objects(problem_file):
    """从problem文件中解析对象"""
    with open(problem_file, 'r') as f:
        content = f.read()
    
    # 提取objects部分
    objects_match = re.search(r'\(:objects\s+(.*?)\)', content, re.DOTALL)
    if not objects_match:
        return {}
    
    objects_str = objects_match.group(1).strip()
    all_objects = objects_str.split()
    
    # 提取init部分，确定对象类型
    init_match = re.search(r'\(:init(.*?)\(:goal', content, re.DOTALL)
    if not init_match:
        return {}
    
    init_str = init_match.group(1)
    
    # 按类型分类对象
    typed_objects = {
        'room': [],
        'ball': [],
        'gripper': []
    }
    
    # 查找类型声明 - 使用更宽松的匹配
    room_matches = re.findall(r'\(room\s+(\w+)\)', init_str)
    ball_matches = re.findall(r'\(ball\s+(\w+)\)', init_str)
    gripper_matches = re.findall(r'\(gripper\s+(\w+)\)', init_str)
    
    typed_objects['room'] = room_matches
    typed_objects['ball'] = ball_matches
    typed_objects['gripper'] = gripper_matches
    
    return typed_objects

def parse_pddl_action(action_text):
    """解析单个动作"""
    # 提取动作名称
    name_match = re.search(r'\(:action\s+(\w+)', action_text)
    if not name_match:
        return None
    
    action_name = name_match.group(1)
    
    # 提取参数
    params_match = re.search(r':parameters\s+\((.*?)\)', action_text, re.DOTALL)
    params = []
    if params_match:
        params_str = params_match.group(1).strip()
        params = [p.strip('?') for p in params_str.split() if p.startswith('?')]
    
    # 提取前置条件
    precond_match = re.search(r':precondition\s+(.*?):effect', action_text, re.DOTALL)
    preconditions = []
    if precond_match:
        precond_str = precond_match.group(1).strip()
        
        # 移除最外层的 (and ...) 如果存在
        if precond_str.startswith('(and'):
            # 手动移除最外层括号
            depth = 0
            start = precond_str.find('(and')
            if start >= 0:
                depth = 1
                i = start + 4  # 跳过 "(and"
                while i < len(precond_str) and depth > 0:
                    if precond_str[i] == '(':
                        depth += 1
                    elif precond_str[i] == ')':
                        depth -= 1
                    i += 1
                # 提取 and 内部的内容
                if i > start + 4:
                    precond_str = precond_str[start+4:i-1].strip()
        
        # 找到所有谓词 - 需要处理嵌套括号
        depth = 0
        current_pred = ""
        for char in precond_str:
            if char == '(':
                if depth == 0:
                    current_pred = ""
                else:
                    current_pred += char
                depth += 1
            elif char == ')':
                depth -= 1
                if depth == 0:
                    if current_pred.strip():
                        preconditions.append(current_pred.strip())
                    current_pred = ""
                else:
                    current_pred += char
            elif depth > 0:
                current_pred += char
    
    return {
        'name': action_name,
        'params': params,
        'preconditions': preconditions
    }

def parse_pddl_domain(domain_file):
    """从domain文件中解析动作"""
    with open(domain_file, 'r') as f:
        content = f.read()
    
    # 使用更好的方法提取动作块 - 手动匹配括号
    actions = []
    i = 0
    while i < len(content):
        # 查找 (:action
        action_start = content.find('(:action', i)
        if action_start == -1:
            break
        
        # 从这里开始匹配括号
        depth = 0
        j = action_start
        while j < len(content):
            if content[j] == '(':
                depth += 1
            elif content[j] == ')':
                depth -= 1
                if depth == 0:
                    # 找到了匹配的结束括号
                    action_block = content[action_start:j+1]
                    action = parse_pddl_action(action_block)
                    if action:
                        actions.append(action)
                    i = j + 1
                    break
            j += 1
        else:
            break
    
    return actions

def convert_precond_to_ltl(precond, param_map):
    """将PDDL前置条件转换为LTL原子命题"""
    parts = precond.split()
    pred_name = parts[0].replace('-', '_')  # 将连字符替换为下划线
    pred_params = parts[1:]
    
    # 过滤掉类型谓词（只有一个参数且谓词名与参数类型相关的）
    # 这些谓词如 (ball ?obj), (room ?room), (gripper ?gripper) 是静态的
    type_predicates = ['ball', 'room', 'gripper']
    if pred_name in type_predicates and len(pred_params) == 1:
        return None  # 忽略类型谓词
    
    # 替换参数为实际值
    substituted_params = [param_map.get(p.strip('?'), p.strip('?')) for p in pred_params]
    
    # 生成下划线连接的命题名
    if substituted_params:
        return f"{pred_name}_{'_'.join(substituted_params)}"
    else:
        return pred_name

def generate_ltl_formulas(domain_file, problem_file):
    """根据domain和problem生成LTL公式"""
    
    # 解析文件
    actions = parse_pddl_domain(domain_file)
    objects = parse_pddl_objects(problem_file)
    
    print(f"找到 {len(actions)} 个动作")
    print(f"对象: {objects}")
    print()
    
    all_formulas = []
    
    # 为每个动作生成实例化的LTL公式
    for action in actions:
        action_name = action['name']
        params = action['params']
        preconditions = action['preconditions']
        
        print(f"处理动作: {action_name} 参数: {params}")
        print(f"  前置条件: {preconditions}")
        
        # 根据动作类型确定参数的对象类型
        if action_name == 'pick':
            # pick(?obj ?room ?gripper)
            param_types = ['ball', 'room', 'gripper']
        elif action_name == 'drop':
            # drop(?obj ?room ?gripper)
            param_types = ['ball', 'room', 'gripper']
        elif action_name == 'move':
            # move(?from ?to)
            param_types = ['room', 'room']
        else:
            continue
        
        # 生成所有可能的参数组合
        import itertools
        param_combinations = []
        
        if action_name in ['pick', 'drop']:
            # obj, room, gripper
            for obj in objects['ball']:
                for room in objects['room']:
                    for gripper in objects['gripper']:
                        param_combinations.append([obj, room, gripper])
        elif action_name == 'move':
            # from, to (不同的房间)
            for from_room in objects['room']:
                for to_room in objects['room']:
                    if from_room != to_room:
                        param_combinations.append([from_room, to_room])
        
        # 为每个参数组合生成公式
        for param_values in param_combinations:
            # 建立参数映射
            param_map = {params[i]: param_values[i] for i in range(len(params))}
            
            # 生成动作原子命题
            action_prop = f"do_{action_name}_{'_'.join(param_values)}"
            
            # 转换前置条件
            precond_props = []
            for precond in preconditions:
                ltl_prop = convert_precond_to_ltl(precond, param_map)
                if ltl_prop:  # 过滤掉None（类型谓词）
                    precond_props.append(ltl_prop)
            
            # 生成LTL公式: G(action -> (precond1 & precond2 & ...))
            precond_str = ' & '.join(precond_props)
            formula_str = f"G({action_prop} -> ({precond_str}))"
            
            try:
                formula = spot.formula(formula_str)
                all_formulas.append(formula)
            except Exception as e:
                print(f"警告: 无法解析公式 {formula_str}: {e}")
    
    return all_formulas

# 主程序
if __name__ == "__main__":
    domain_file = "domain.pddl"
    problem_file = "training_problems/train_n4_R2_cap1_init-r1-4_goal-all@r1_i0198.pddl"
    
    # 生成LTL公式
    all_safety_formulas = generate_ltl_formulas(domain_file, problem_file)
    
    print(f"\n实例化了 {len(all_safety_formulas)} 个安全公式")
    print("\n=== LTL Formulas ===")
    for i, formula in enumerate(all_safety_formulas, 1):
        print(f"{i}. {formula}")
    
    # 将所有安全公式做合取
    from functools import reduce
    def conj_all(fs):
        if not fs: 
            return spot.formula("1")  # True
        cur = fs[0]
        for f in fs[1:]:
            cur = spot.formula("(%s) & (%s)" % (str(cur), str(f)))
        return cur
    
    print("\n生成Büchi自动机...")
    conj_formula = conj_all(all_safety_formulas)
    aut = spot.translate(conj_formula, "BA")
    print(f"自动机状态数: {aut.num_states()}")
    
    # 保存为 HOA 文件
    output_file = "gripper_safety_auto.hoa"
    with open(output_file, "w", encoding="utf-8") as f:
        f.write(aut.to_str("hoa"))
    print(f"\n已保存到: {output_file}")

