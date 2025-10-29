#!/bin/bash

conda activate llmstl

python3 script/collect_single_scenario.py grippers --pddl PDDL2 --root grippers --output data/sft/grippers_pddl2.hf --max_number 2000   
python3 script/collect_single_scenario.py ferry --pddl PDDL2 --root ferry --output data/sft/ferry_pddl2.hf --max_number 2000
python3 script/collect_single_scenario.py delivery --pddl PDDL2 --root delivery --output data/sft/delivery_pddl2.hf --max_number 2000
python3 script/collect_single_scenario.py spanner --pddl PDDL2 --root spanner --output data/sft/spanner_pddl2.hf --max_number 2000
python3 script/collect_single_scenario.py blocksworld --pddl PDDL2 --root blocksworld --output data/sft/blocksworld_pddl2.hf --max_number 2000
python3 script/collect_single_scenario.py rovers --pddl PDDL2 --root rovers --output data/sft/rovers_pddl2.hf --max_number 2000


python3 script/collect_single_scenario.py grid --pddl PDDL2 --root grid --output data/sft/grid_pddl2.hf --max_number 2000   