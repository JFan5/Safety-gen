#!/bin/bash

conda activate llmstl


python3 script/collect_finetuned_dataset_together.py --max-number 2000 --output /groups/fkong/jfan5/data/sft/multi_scenarios/pddl2.hf --pddl PDDL2