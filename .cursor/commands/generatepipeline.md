你帮我完成这几步：

1. 在目录下找到shell，并调用shell生成unique problems

2. python3 ../script/split_problems.py --input-dir all_problems --num-testing 100
3. python ../script/solve_problems_optic.py all_problems/training domain.pddl 
4. python convert_pddl3.py all_problems/training training_problems3
5. 验证是否能用旧的解决方案解决新问题：python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir training_problems3 --solutions_dir all_problems/training


6. python ../script/solve_problems_optic.py training_problems3 domain3.pddl


