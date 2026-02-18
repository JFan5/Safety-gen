#!/bin/bash
python script/run_benchmark.py --solver downward --domain all --time-limit 300 --search-config "astar(lmcut())"
