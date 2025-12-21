#!/usr/bin/env python3
"""运行 create_testing_problems100.py"""
import sys
import os

# 切换到脚本目录
os.chdir('/home/ubuntu/Safety-gen/pddl3')

# 导入并运行主脚本
sys.path.insert(0, '/home/ubuntu/Safety-gen/pddl3')
from create_testing_problems100 import main

if __name__ == "__main__":
    main()


