#!/bin/bash

conda activate llmstl
    

python3 script/collect_single_scenario.py blocksworld --pddl PDDL3 --root blocksworld --output data/sft/blocksworld_pddl3.hf --max_number 2000
python3 script/collect_single_scenario.py grippers --pddl PDDL3 --root grippers --output data/sft/grippers_pddl3.hf --max_number 2000
python3 script/collect_single_scenario.py ferry --pddl PDDL3 --root ferry --output data/sft/ferry_pddl3.hf --max_number 2000
python3 script/collect_single_scenario.py delivery --pddl PDDL3 --root delivery --output data/sft/delivery_pddl3.hf --max_number 2000
python3 script/collect_single_scenario.py spanner --pddl PDDL3 --root spanner --output data/sft/spanner_pddl3.hf --max_number 2000
python3 script/collect_single_scenario.py rovers --pddl PDDL3 --root rovers --output data/sft/rovers_pddl3.hf --max_number 2000

python3 script/collect_single_scenario.py grid --pddl PDDL3 --root grid --output data/sft/grid_pddl3.hf --max_number 2000
