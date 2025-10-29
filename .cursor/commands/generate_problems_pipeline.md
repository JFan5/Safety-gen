你帮我完成这几步：

1. 在目录下找到shell，帮我修改shell生成unique problems的参数，保证总量在5000个problem，生成问题必须实时生成，如果卡住说明超出了排列组合上限，修改shell，缩小该参数生成的问题数，增加其他参数的生成问题


2. 求解生成的问题：python ../script/solve_problems_optic.py all_problems domain.pddl 
3. 把生成的问题转换为pddl3，调用脚本，python convert_pddl3.py all_problems all_problems3
4. 验证是否能用旧的解决方案解决新问题：python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir training_problems3 --solutions_dir all_problems/training
5. 用求解器求解pddl3 problem：python ../script/solve_problems_optic.py all_problems3 domain3.pddl 
6. 用validator进行验证，删除未通过验证的problem和solution，python ../script/validate_classical_solvers.py --domain domain3.pddl --problems_dir all_problems3 --solutions_dir all_problems3
7. 进行分割，分割200个testing文件， python3 ../script/split_problems.py --input-dir all_problems3 --num-testing 200

最终生成md文件汇报求解结果



