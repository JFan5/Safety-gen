#!/usr/bin/env python3
"""直接调用 create_testing_problems100 的 main 函数"""
import importlib.util
import sys

spec = importlib.util.spec_from_file_location(
    "create_testing_problems100",
    "/home/ubuntu/Safety-gen/pddl3/create_testing_problems100.py"
)
module = importlib.util.module_from_spec(spec)
sys.modules["create_testing_problems100"] = module
spec.loader.exec_module(module)

# 调用 main 函数
module.main()


