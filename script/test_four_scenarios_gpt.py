#!/usr/bin/env python3
"""
批量测试四个场景的GPT模型评估脚本
测试 blocksworld, spanner, ferry, grippers 四个场景
"""
import os
import sys
import subprocess
import json
from pathlib import Path
from datetime import datetime
from typing import Dict, List

# 配置要测试的场景
SCENARIOS = [
    {
        'name': 'blocksworld',
        'problems_dir': 'benchmark_problems/blocksworld',
        'domain_file': 'pddl3/blocksworld/domain.pddl'
    },
    {
        'name': 'spanner',
        'problems_dir': 'benchmark_problems/spanner',
        'domain_file': 'pddl3/spanner/domain.pddl'
    },
    {
        'name': 'ferry',
        'problems_dir': 'benchmark_problems/ferry',
        'domain_file': 'pddl3/ferry/domain.pddl'
    },
    {
        'name': 'grippers',
        'problems_dir': 'benchmark_problems/grippers',
        'domain_file': 'pddl3/grippers/domain.pddl'
    }
]

def get_repo_root():
    """获取仓库根目录"""
    script_dir = Path(__file__).parent
    return script_dir.parent

def run_evaluation(scenario: Dict, model: str, api_key: str = None, 
                   max_problems: int = 0, temperature: float = 0.6,
                   one_shot: bool = False, output_dir: str = None):
    """
    运行单个场景的评估
    
    Args:
        scenario: 场景配置字典
        model: 模型名称
        api_key: API密钥
        max_problems: 最大问题数量（0表示全部）
        temperature: 温度参数
        one_shot: 是否使用one-shot模式
        output_dir: 输出目录
    """
    repo_root = get_repo_root()
    problems_dir = repo_root / scenario['problems_dir']
    domain_file = repo_root / scenario['domain_file']
    
    # 检查路径是否存在
    if not problems_dir.exists():
        print(f"Error: Problems directory not found: {problems_dir}")
        return None
    
    if not domain_file.exists():
        print(f"Error: Domain file not found: {domain_file}")
        return None
    
    # 构建输出文件名
    if output_dir:
        output_path = Path(output_dir) / f"{scenario['name']}_results.json"
    else:
        output_path = repo_root / f"{scenario['name']}_results.json"
    
    # 构建命令
    script_path = repo_root / "script" / "evaluate_api_llm_solver.py"
    cmd = [
        sys.executable,
        str(script_path),
        "--model", model,
        "--problems-dir", str(problems_dir),
        "--domain-file", str(domain_file),
        "--output", str(output_path),
        "--temperature", str(temperature),
        "--family", "auto"
    ]
    
    if api_key:
        cmd.extend(["--api-key", api_key])
    
    if max_problems > 0:
        cmd.extend(["--max-problems", str(max_problems)])
    
    if one_shot:
        cmd.append("--one-shot")
    
    print(f"\n{'='*80}")
    print(f"Testing scenario: {scenario['name']}")
    print(f"{'='*80}")
    print(f"Problems dir: {problems_dir}")
    print(f"Domain file: {domain_file}")
    print(f"Output file: {output_path}")
    print(f"Command: {' '.join(cmd)}")
    print(f"{'='*80}\n")
    
    # 运行评估
    try:
        result = subprocess.run(
            cmd,
            cwd=str(repo_root),
            capture_output=False,  # 显示实时输出
            text=True,
            check=False
        )
        
        if result.returncode == 0:
            print(f"\n✓ Successfully completed evaluation for {scenario['name']}")
            return str(output_path)
        else:
            print(f"\n✗ Evaluation failed for {scenario['name']} with return code {result.returncode}")
            return None
    except Exception as e:
        print(f"\n✗ Error running evaluation for {scenario['name']}: {e}")
        return None

def load_results(result_file: str) -> Dict:
    """加载评估结果JSON文件"""
    try:
        with open(result_file, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error loading results from {result_file}: {e}")
        return None

def generate_summary(all_results: List[Dict], output_file: str):
    """生成汇总报告"""
    summary = {
        'timestamp': datetime.now().isoformat(),
        'total_scenarios': len(all_results),
        'scenarios': []
    }
    
    total_tests = 0
    total_success = 0
    
    for result in all_results:
        if result is None:
            continue
        
        scenario_summary = {
            'scenario_name': result.get('scenario_name', 'unknown'),
            'model_name': result.get('model_name', 'unknown'),
            'total_tests': result.get('total_tests', 0),
            'success_count': result.get('success_count', 0),
            'success_rate': result.get('success_rate', 0),
            'category_counts': result.get('category_counts', {}),
            'category_rates': result.get('category_rates', {}),
            'one_shot': result.get('one_shot', False),
            'temperature': result.get('temperature', 0.6),
            'result_file': result.get('result_file', '')
        }
        
        summary['scenarios'].append(scenario_summary)
        total_tests += scenario_summary['total_tests']
        total_success += scenario_summary['success_count']
    
    summary['overall'] = {
        'total_tests': total_tests,
        'total_success': total_success,
        'overall_success_rate': (total_success / total_tests * 100) if total_tests > 0 else 0
    }
    
    # 保存汇总报告
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    # 打印汇总报告
    print(f"\n{'='*80}")
    print("SUMMARY REPORT")
    print(f"{'='*80}")
    print(f"Total scenarios tested: {summary['total_scenarios']}")
    print(f"Overall success rate: {summary['overall']['overall_success_rate']:.1f}%")
    print(f"Total tests: {summary['overall']['total_tests']}")
    print(f"Total success: {summary['overall']['total_success']}")
    print(f"\nPer-scenario results:")
    print(f"{'-'*80}")
    
    for scenario in summary['scenarios']:
        print(f"\n{scenario['scenario_name']}:")
        print(f"  Success rate: {scenario['success_rate']:.1f}% ({scenario['success_count']}/{scenario['total_tests']})")
        print(f"  Category breakdown:")
        for category, count in scenario['category_counts'].items():
            rate = scenario['category_rates'].get(category, 0)
            print(f"    {category}: {count} ({rate:.1f}%)")
    
    print(f"\n{'='*80}")
    print(f"Summary saved to: {output_file}")
    print(f"{'='*80}\n")
    
    return summary

def main():
    """主函数"""
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Batch test GPT model on four scenarios (blocksworld, spanner, ferry, grippers)"
    )
    parser.add_argument(
        "--model", 
        type=str, 
        default="gpt-4",
        help="API model name (default: gpt-4)"
    )
    parser.add_argument(
        "--api-key", 
        type=str, 
        default=None,
        help="API key (if not provided, will use OPENAI_API_KEY environment variable)"
    )
    parser.add_argument(
        "--max-problems", 
        type=int, 
        default=0,
        help="Maximum number of problems per scenario (0 for all, default: 0)"
    )
    parser.add_argument(
        "--temperature", 
        type=float, 
        default=0.6,
        help="Temperature for text generation (default: 0.6)"
    )
    parser.add_argument(
        "--one-shot", 
        dest='one_shot', 
        action='store_true',
        help="Use one-shot mode with examples (default: False)"
    )
    parser.add_argument(
        "--no-one-shot", 
        dest='one_shot', 
        action='store_false',
        help="Disable one-shot mode (default)"
    )
    parser.add_argument(
        "--output-dir", 
        type=str, 
        default=None,
        help="Output directory for result files (default: repo root)"
    )
    parser.add_argument(
        "--summary-file", 
        type=str, 
        default=None,
        help="Summary report file path (default: auto-generated)"
    )
    parser.set_defaults(one_shot=False)
    
    args = parser.parse_args()
    
    # 获取API密钥
    api_key = args.api_key or os.getenv('OPENAI_API_KEY')
    if not api_key:
        print("Warning: No API key provided. Set OPENAI_API_KEY environment variable or use --api-key")
        response = input("Continue anyway? (y/n): ")
        if response.lower() != 'y':
            return
    
    # 准备输出目录
    repo_root = get_repo_root()
    if args.output_dir:
        output_dir = Path(args.output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
    else:
        output_dir = repo_root
    
    # 生成汇总文件名
    if args.summary_file:
        summary_file = args.summary_file
    else:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        oneshot_suffix = "_oneshot" if args.one_shot else ""
        summary_file = str(output_dir / f"four_scenarios_summary{oneshot_suffix}_{timestamp}.json")
    
    print(f"\n{'='*80}")
    print("BATCH EVALUATION: FOUR SCENARIOS")
    print(f"{'='*80}")
    print(f"Model: {args.model}")
    print(f"Max problems per scenario: {args.max_problems if args.max_problems > 0 else 'all'}")
    print(f"Temperature: {args.temperature}")
    print(f"One-shot mode: {args.one_shot}")
    print(f"Output directory: {output_dir}")
    print(f"Summary file: {summary_file}")
    print(f"{'='*80}\n")
    
    # 运行所有场景的评估
    all_results = []
    result_files = []
    
    for scenario in SCENARIOS:
        result_file = run_evaluation(
            scenario=scenario,
            model=args.model,
            api_key=api_key,
            max_problems=args.max_problems,
            temperature=args.temperature,
            one_shot=args.one_shot,
            output_dir=str(output_dir)
        )
        
        if result_file and Path(result_file).exists():
            result_data = load_results(result_file)
            if result_data:
                result_data['scenario_name'] = scenario['name']
                result_data['result_file'] = result_file
                all_results.append(result_data)
                result_files.append(result_file)
    
    # 生成汇总报告
    if all_results:
        generate_summary(all_results, summary_file)
        print(f"\nAll result files:")
        for rf in result_files:
            print(f"  - {rf}")
    else:
        print("\nNo results to summarize. All evaluations may have failed.")
        return 1
    
    return 0

if __name__ == "__main__":
    sys.exit(main())

