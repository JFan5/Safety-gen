#!/bin/bash

conda activate llmstl
    
python3 script/collect_finetuned_dataset_together.py --max-number 4000 --output /groups/fkong/jfan5/data/sft/multi_scenarios/pddl3.hf --pddl PDDL3

# hyperstack
# python3 script/collect_finetuned_dataset_together.py --max-number 4000 --output ~/data/sft/multi_scenarios/pddl3.hf --pddl PDDL3
