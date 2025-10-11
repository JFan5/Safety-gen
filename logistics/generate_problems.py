import subprocess
import os
import random
import argparse

def generate_logistics_problem(cities, city_size, packages, airplanes, trucks=None, seed=None, output_file=None):
    """
    生成logistics问题
    
    Args:
        cities: 城市数量
        city_size: 每个城市的位置数量
        packages: 包裹数量
        airplanes: 飞机数量
        trucks: 卡车数量（可选，默认为城市数量）
        seed: 随机种子（可选）
        output_file: 输出文件路径（可选）
    
    Returns:
        str: 生成的PDDL内容
    """
    cmd = ["./logistics", "-c", str(cities), "-s", str(city_size), "-p", str(packages), "-a", str(airplanes)]
    
    if trucks is not None:
        cmd.extend(["-t", str(trucks)])
    
    if seed is not None:
        cmd.extend(["-r", str(seed)])
    
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        pddl_content = result.stdout
        
        if output_file:
            with open(output_file, "w") as f:
                f.write(pddl_content)
            print(f"问题已保存到: {output_file}")
        
        return pddl_content
    
    except subprocess.CalledProcessError as e:
        print(f"生成问题失败: {e}")
        print(f"错误输出: {e.stderr}")
        return None

def generate_multiple_problems(configs, output_dir="problems", count=None):
    """
    生成多个不同配置的问题
    
    Args:
        configs: 配置列表，每个配置是一个字典
        output_dir: 输出目录
    """
    os.makedirs(output_dir, exist_ok=True)
    
    total_generated = 0
    
    # 限制生成数量
    total_to_generate = len(configs)
    if count is not None:
        total_to_generate = min(total_to_generate, max(0, int(count)))
    
    for i, config in enumerate(configs[:total_to_generate]):
        # 使用编号作为文件名，三位数前导零
        filename = f"{i+1:03d}.pddl"
        
        output_file = os.path.join(output_dir, filename)
        
        print(f"生成问题 {i+1}/{total_to_generate}: {filename}")
        
        result = generate_logistics_problem(
            cities=config['cities'],
            city_size=config['city_size'],
            packages=config['packages'],
            airplanes=config['airplanes'],
            trucks=config.get('trucks'),
            seed=config.get('seed'),
            output_file=output_file
        )
        
        if result:
            total_generated += 1
    
    print(f"\n总共生成了 {total_generated} 个问题文件")
    print(f"输出目录: {output_dir}")

def generate_ipc00_instances(count=None):
    """生成IPC-2000风格的实例"""
    print("生成IPC-2000风格的实例...")
    
    configs = []
    
    # 小规模实例：2个城市，1-2架飞机，4-8个包裹
    for packages in [4, 6, 8]:
        for airplanes in [1, 2]:
            configs.append({
                'cities': 2,
                'city_size': 3,
                'packages': packages,
                'airplanes': airplanes,
                'seed': random.randint(1, 1000)
            })
    
    # 中等规模实例：3个城市，1-2架飞机，6-10个包裹
    for packages in [6, 8, 10]:
        for airplanes in [1, 2]:
            configs.append({
                'cities': 3,
                'city_size': 4,
                'packages': packages,
                'airplanes': airplanes,
                'seed': random.randint(1, 1000)
            })
    
    # 大规模实例：5个城市，1-2架飞机，10-15个包裹
    for packages in [10, 12, 15]:
        for airplanes in [1, 2]:
            configs.append({
                'cities': 5,
                'city_size': 5,
                'packages': packages,
                'airplanes': airplanes,
                'seed': random.randint(1, 1000)
            })
    
    generate_multiple_problems(configs, "problems", count=count)

def generate_ipc98_instances(count=None):
    """生成IPC-1998风格的实例"""
    print("生成IPC-1998风格的实例...")
    
    configs = []
    
    # 线性扩展的城市数量，每个城市一个卡车
    for cities in [2, 3, 4, 5, 6, 7, 8]:
        city_size = 3
        packages = cities * 3  # 包裹数量与城市数量成比例
        airplanes = min(cities, 5)  # 飞机数量最多5架
        
        configs.append({
            'cities': cities,
            'city_size': city_size,
            'packages': packages,
            'airplanes': airplanes,
            'seed': random.randint(1, 1000)
        })
    
    # 一些特殊实例：更多卡车
    for cities in [3, 4, 5]:
        configs.append({
            'cities': cities,
            'city_size': 4,
            'packages': cities * 4,
            'airplanes': min(cities + 1, 6),
            'trucks': cities + 1,  # 每个城市多一辆卡车
            'seed': random.randint(1, 1000)
        })
    
    generate_multiple_problems(configs, "problems", count=count)

def generate_custom_instances(count=None):
    """生成自定义配置的实例"""
    print("生成自定义配置的实例...")
    
    configs = []
    
    # 小规模测试实例
    for cities in [1, 2]:
        for city_size in [2, 3]:
            for packages in [2, 3, 4]:
                for airplanes in [1, 2]:
                    if airplanes <= cities:  # 飞机数量不能超过城市数量
                        configs.append({
                            'cities': cities,
                            'city_size': city_size,
                            'packages': packages,
                            'airplanes': airplanes,
                            'seed': random.randint(1, 1000)
                        })
    
    # 中等规模实例
    for cities in [3, 4]:
        for city_size in [3, 4]:
            for packages in [5, 6, 7, 8]:
                for airplanes in [1, 2, 3]:
                    if airplanes <= cities:
                        configs.append({
                            'cities': cities,
                            'city_size': city_size,
                            'packages': packages,
                            'airplanes': airplanes,
                            'seed': random.randint(1, 1000)
                        })
    
    generate_multiple_problems(configs, "problems", count=count)

def generate_random_instances(num_instances=50, count=None):
    """生成随机配置的实例"""
    # 兼容：优先使用 count，如果未提供，则使用 num_instances
    effective_count = int(count) if count is not None else int(num_instances)
    print(f"生成 {effective_count} 个随机配置的实例...")
    
    configs = []
    
    for i in range(effective_count):
        # 随机参数范围
        cities = random.randint(1, 8)
        city_size = random.randint(2, 6)
        packages = random.randint(2, min(20, cities * city_size))
        airplanes = random.randint(1, min(5, cities))
        trucks = random.randint(cities, cities + 2) if random.random() > 0.7 else None
        
        configs.append({
            'cities': cities,
            'city_size': city_size,
            'packages': packages,
            'airplanes': airplanes,
            'trucks': trucks,
            'seed': random.randint(1, 10000)
        })
    
    generate_multiple_problems(configs, "problems", count=effective_count)

def main():
    parser = argparse.ArgumentParser(description="生成logistics问题")
    parser.add_argument("--type", choices=["ipc00", "ipc98", "custom", "random", "single"], 
                       default="custom", help="生成类型")
    parser.add_argument("--count", type=int, help="要生成的实例数量（适用于非single类型）")
    parser.add_argument("--cities", type=int, help="城市数量")
    parser.add_argument("--city-size", type=int, help="城市大小")
    parser.add_argument("--packages", type=int, help="包裹数量")
    parser.add_argument("--airplanes", type=int, help="飞机数量")
    parser.add_argument("--trucks", type=int, help="卡车数量")
    parser.add_argument("--seed", type=int, help="随机种子")
    parser.add_argument("--output", type=str, help="输出文件")
    parser.add_argument("--num-random", type=int, default=50, help="随机实例数量")
    
    args = parser.parse_args()
    
    if args.type == "single":
        if not all([args.cities, args.city_size, args.packages, args.airplanes]):
            print("生成单个实例需要指定所有必要参数")
            return
        
        # 如果未指定输出文件，则使用 problems/001.pddl
        output_path = args.output
        if not output_path:
            os.makedirs("problems", exist_ok=True)
            output_path = os.path.join("problems", f"{1:03d}.pddl")
        
        generate_logistics_problem(
            cities=args.cities,
            city_size=args.city_size,
            packages=args.packages,
            airplanes=args.airplanes,
            trucks=args.trucks,
            seed=args.seed,
            output_file=output_path
        )
    
    elif args.type == "ipc00":
        generate_ipc00_instances(count=args.count)
    
    elif args.type == "ipc98":
        generate_ipc98_instances(count=args.count)
    
    elif args.type == "custom":
        generate_custom_instances(count=args.count)
    
    elif args.type == "random":
        # random 模式优先使用 --count，否则使用 --num-random
        generate_random_instances(num_instances=args.num_random, count=args.count)

if __name__ == "__main__":
    main()
