现在创建用于SFT和GRPO的数据集流程如下：


阶段一：生成unique training and testing problems， /home/jfan5/Safety-gen/pddl3/spanner/generate_spanner_training_unique.sh
阶段2： 求解所有的pddl2问题，确保问题可以求解：script/solve_problems_optic.py
阶段3：将问题转换为pddl3的:  /home/jfan5/Safety-gen/pddl3/spanner/convert_training_to_pddl3.py，为他们添加约束
阶段4：验证pddl3问题有解且无法被pddl2问题的solution求解:python script/validate_classical_solvers.py 
阶段5: 将总的问题，挑选500个作为sft，500个作为grpo，200个作为测试。同时，我需要让问题的难度尽可能均匀分布

我需要你阅读/home/jfan5/Safety-gen/pddl3/spanner下的文件，然后帮我实现上述流程。
原因：现在生成的问题，太简单了， 训练好的模型一下就到100%的成功率了。
输出：我需要你生成sft_500, grpo_500，以及all_problems all_problems3文件夹