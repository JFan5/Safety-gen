#!/bin/bash
################################################################################
# Analyze DPO Dataset Output
################################################################################

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

OUTPUT_DIR="/jfan5/dpo_data-1206"

echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   DPO Dataset Analysis${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}\n"

if [ ! -d "$OUTPUT_DIR" ]; then
    echo -e "${RED}Error: Output directory not found: $OUTPUT_DIR${NC}"
    exit 1
fi

cd "$OUTPUT_DIR"

# File summary
echo -e "${GREEN}1. File Summary${NC}"
echo "────────────────────────────────────────────────────────────────"

TOTAL_PAIRS=0
TOTAL_SIZE=0

for file in *.jsonl; do
    if [ -f "$file" ]; then
        COUNT=$(wc -l < "$file")
        SIZE=$(stat -c%s "$file")
        SIZE_HR=$(du -h "$file" | cut -f1)

        TOTAL_PAIRS=$((TOTAL_PAIRS + COUNT))
        TOTAL_SIZE=$((TOTAL_SIZE + SIZE))

        printf "%-35s %8d pairs   %10s\n" "$file" "$COUNT" "$SIZE_HR"
    fi
done

echo "────────────────────────────────────────────────────────────────"
TOTAL_SIZE_HR=$(numfmt --to=iec-i --suffix=B $TOTAL_SIZE 2>/dev/null || echo "${TOTAL_SIZE} bytes")
printf "%-35s %8d pairs   %10s\n" "TOTAL" "$TOTAL_PAIRS" "$TOTAL_SIZE_HR"
echo ""

# Statistics
if [ -f "stats.json" ]; then
    echo -e "${GREEN}2. Statistics by Scenario${NC}"
    echo "────────────────────────────────────────────────────────────────"
    python3 << 'EOF'
import json
import sys

try:
    with open('stats.json', 'r') as f:
        stats = json.load(f)

    for scenario, data in stats.items():
        print(f"\n{scenario}:")
        for key, value in data.items():
            print(f"  {key:30s}: {value}")
except Exception as e:
    print(f"Error reading stats: {e}", file=sys.stderr)
EOF
    echo ""
fi

# Score distribution
echo -e "${GREEN}3. Score Distribution${NC}"
echo "────────────────────────────────────────────────────────────────"

python3 << 'EOF'
import json
from collections import Counter

score_counts = Counter()

try:
    with open('all_scenarios_merged.jsonl', 'r') as f:
        for line in f:
            data = json.loads(line)
            score_diff = data.get('score_diff', '')
            score_counts[score_diff] += 1

    print("\nScore Difference Distribution:")
    for score_diff in sorted(score_counts.keys()):
        count = score_counts[score_diff]
        percentage = (count / sum(score_counts.values())) * 100
        print(f"  {score_diff:10s}: {count:6d} pairs ({percentage:5.1f}%)")

    print(f"\nTotal: {sum(score_counts.values())} pairs")
except FileNotFoundError:
    print("all_scenarios_merged.jsonl not found")
except Exception as e:
    print(f"Error: {e}")
EOF
echo ""

# Scenario distribution
echo -e "${GREEN}4. Scenario Distribution${NC}"
echo "────────────────────────────────────────────────────────────────"

python3 << 'EOF'
import json
from collections import Counter

scenario_counts = Counter()

try:
    with open('all_scenarios_merged.jsonl', 'r') as f:
        for line in f:
            data = json.loads(line)
            scenario = data.get('scenario', '')
            scenario_counts[scenario] += 1

    print("\nPairs by Scenario:")
    for scenario in sorted(scenario_counts.keys()):
        count = scenario_counts[scenario]
        percentage = (count / sum(scenario_counts.values())) * 100
        print(f"  {scenario:15s}: {count:6d} pairs ({percentage:5.1f}%)")

    print(f"\nTotal: {sum(scenario_counts.values())} pairs")
except FileNotFoundError:
    print("all_scenarios_merged.jsonl not found")
except Exception as e:
    print(f"Error: {e}")
EOF
echo ""

# Sample examples
echo -e "${GREEN}5. Sample Pairs${NC}"
echo "────────────────────────────────────────────────────────────────"

if [ -f "all_scenarios_merged.jsonl" ]; then
    echo -e "\n${YELLOW}Example 1: 100 vs 80 (Logic Error)${NC}"
    grep '"score_diff": "100-80"' all_scenarios_merged.jsonl | head -n 1 | python3 -m json.tool 2>/dev/null | head -n 30

    echo -e "\n${YELLOW}Example 2: 100 vs 60 (Safety Violation)${NC}"
    grep '"score_diff": "100-60"' all_scenarios_merged.jsonl | head -n 1 | python3 -m json.tool 2>/dev/null | head -n 30 || echo "No 100 vs 60 pairs found"

    echo -e "\n${YELLOW}Example 3: 100 vs 40 (Precondition Violation)${NC}"
    grep '"score_diff": "100-40"' all_scenarios_merged.jsonl | head -n 1 | python3 -m json.tool 2>/dev/null | head -n 30 || echo "No 100 vs 40 pairs found"
fi

echo ""

# Data quality checks
echo -e "${GREEN}6. Data Quality Checks${NC}"
echo "────────────────────────────────────────────────────────────────"

python3 << 'EOF'
import json

def check_quality():
    issues = []
    total_checked = 0

    try:
        with open('all_scenarios_merged.jsonl', 'r') as f:
            for i, line in enumerate(f, 1):
                total_checked += 1
                try:
                    data = json.loads(line)

                    # Check required fields
                    required_fields = ['prompt', 'chosen', 'rejected', 'score_diff', 'scenario', 'problem_id']
                    for field in required_fields:
                        if field not in data:
                            issues.append(f"Line {i}: Missing field '{field}'")

                    # Check if chosen and rejected are different
                    if data.get('chosen') == data.get('rejected'):
                        issues.append(f"Line {i}: Chosen and rejected are identical")

                    # Check if strings are non-empty
                    for field in ['prompt', 'chosen', 'rejected']:
                        if not data.get(field, '').strip():
                            issues.append(f"Line {i}: Empty field '{field}'")

                except json.JSONDecodeError:
                    issues.append(f"Line {i}: Invalid JSON")

                # Limit to first 1000 for quick check
                if i >= 1000:
                    break

        print(f"Checked: {total_checked} pairs")

        if issues:
            print(f"\nFound {len(issues)} issues:")
            for issue in issues[:10]:  # Show first 10
                print(f"  - {issue}")
            if len(issues) > 10:
                print(f"  ... and {len(issues) - 10} more")
        else:
            print("\n✓ No issues found!")

    except FileNotFoundError:
        print("all_scenarios_merged.jsonl not found")
    except Exception as e:
        print(f"Error: {e}")

check_quality()
EOF

echo ""
echo "────────────────────────────────────────────────────────────────"
echo -e "${GREEN}Analysis complete!${NC}"
echo ""
echo "Files are located in: $OUTPUT_DIR"
echo ""
echo "Next steps:"
echo "  1. Review the statistics above"
echo "  2. Manually check sample_pairs.jsonl (if created)"
echo "  3. Use train.jsonl and val.jsonl for DPO training"
