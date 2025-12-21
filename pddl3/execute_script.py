#!/usr/bin/env python3
import subprocess
import sys

# 直接执行脚本
result = subprocess.run(
    [sys.executable, '/home/ubuntu/Safety-gen/pddl3/create_testing_problems100.py'],
    cwd='/home/ubuntu/Safety-gen/pddl3',
    capture_output=True,
    text=True
)

print(result.stdout)
if result.stderr:
    print("STDERR:", result.stderr, file=sys.stderr)
sys.exit(result.returncode)


