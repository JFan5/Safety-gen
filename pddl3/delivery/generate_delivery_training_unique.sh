#!/usr/bin/env bash
set -euo pipefail

# Generate unique Delivery problems
# Target: ~2000 problems total
# Note: Adjusted counts to match actual unique problem limits

# Start clean
rm -rf "/home/ubuntu/Safety-gen/delivery/all_problems"
mkdir -p "/home/ubuntu/Safety-gen/delivery/all_problems"

echo "Generating Delivery problems (target ~2000)"

# Generate problems: COUNT SIZE PKGS SEED
# Adjusted to match unique problem limits:
# - size=2, pkgs=1: max ~48 unique
# - size=2, pkgs=2: max ~144 unique
# - size=3, pkgs=1: many unique available
# - size=3, pkgs=2: many unique available
# - size=4, pkgs=1: many unique available
# - size=4, pkgs=2: many unique available
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 48  --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 2 --packages 1 --seed 10001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 144 --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 2 --packages 2 --seed 11001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 300 --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 3 --packages 1 --seed 12001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 600 --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 3 --packages 2 --seed 13001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 400 --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 4 --packages 1 --seed 14001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl
python3 /home/ubuntu/Safety-gen/delivery/gen_unique_delivery.py --count 508 --target-dir /home/ubuntu/Safety-gen/delivery/all_problems --size 4 --packages 2 --seed 15001 --domain /home/ubuntu/Safety-gen/delivery/domain.pddl

# Report
TOTAL=$(ls -1 /home/ubuntu/Safety-gen/delivery/all_problems/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in /home/ubuntu/Safety-gen/delivery/all_problems."
