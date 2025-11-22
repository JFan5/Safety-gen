#!/usr/bin/env bash
set -euo pipefail

# Test script to verify distribution logic with small numbers

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON_EXEC="${PYTHON_EXEC:-/usr/bin/python3}"
GEN_PY="$SCRIPT_DIR/generate_problems.py"
TARGET_DIR="$SCRIPT_DIR/test_all_problems"

# Start clean
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"

echo "Testing distribution logic with small numbers..."

# Function to generate multiple instances with different seeds
generate_instances() {
    local cities=$1
    local city_size=$2
    local packages=$3
    local airplanes=$4
    local trucks=$5
    local count=$6
    local start_seed=$7
    
    echo "Generating $count instances: cities=$cities, city_size=$city_size, packages=$packages, airplanes=$airplanes, trucks=$trucks"
    
    for ((i=0; i<count; i++)); do
        seed=$((start_seed + i))
        echo "Generating instance $((i+1))/$count with seed $seed..."
        
        $PYTHON_EXEC "$GEN_PY" \
          --type single \
          --output-dir "$TARGET_DIR" \
          --cities "$cities" \
          --city-size "$city_size" \
          --packages "$packages" \
          --airplanes "$airplanes" \
          --trucks "$trucks" \
          --seed "$seed" \
          --unique
    done
}

# Test with scaled down numbers (total 22 instances)
# 1) 2 cities, 2 locations each, 1 package, 1 airplane (4 instances - 18.2%)
generate_instances 2 2 1 1 2 4 10001

# 2) 2 cities, 2 locations each, 2 packages, 1 airplane (4 instances - 18.2%)
generate_instances 2 2 2 1 2 4 20001

# 3) 3 cities, 2 locations each, 1 package, 1 airplane (3 instances - 13.6%)
generate_instances 3 2 1 1 3 3 30001

# 4) 2 cities, 3 locations each, 1 package, 1 airplane (3 instances - 13.6%)
generate_instances 2 3 1 1 2 3 40001

# 5) 3 cities, 2 locations each, 2 packages, 1 airplane (2 instances - 9.1%)
generate_instances 3 2 2 1 3 2 50001

# 6) 2 cities, 2 locations each, 1 package, 2 airplanes (2 instances - 9.1%)
generate_instances 2 2 1 2 2 2 60001

# 7) 4 cities, 3 locations each, 2 packages, 2 airplanes (2 instances - 9.1%)
generate_instances 4 3 2 2 4 2 70001

# 8) 3 cities, 3 locations each, 3 packages, 2 airplanes (2 instances - 9.1%)
generate_instances 3 3 3 2 3 2 80001

# Report
TOTAL=$(ls -1 "$TARGET_DIR"/*.pddl 2>/dev/null | wc -l || true)
echo "Generated $TOTAL problems in $TARGET_DIR (expected 22)"
echo "Distribution test completed successfully!"



