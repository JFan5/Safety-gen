#!/usr/bin/env python3
import importlib.util
import sys

# 使用 importlib 加载并执行脚本
spec = importlib.util.spec_from_file_location(
    "create_testing_problems100",
    "/home/ubuntu/Safety-gen/pddl3/create_testing_problems100.py"
)
module = importlib.util.module_from_spec(spec)
sys.modules["create_testing_problems100"] = module
spec.loader.exec_module(module)

# 执行 main 函数
module.main()


