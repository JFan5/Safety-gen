#!/bin/bash

conda activate llmstl
    
python script/collect_single_scenario.py grippers --root grippers
python script/collect_single_scenario.py ferry --root ferry
python script/collect_single_scenario.py delivery --root delivery
python script/collect_single_scenario.py spanner --root spanner
python script/collect_single_scenario.py blocksworld --root blocksworld
python script/collect_single_scenario.py rovers --root rovers