#!/bin/bash
################################################################################
# Monitor DPO Generation Progress
################################################################################

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

OUTPUT_DIR="/jfan5/dpo_data-1206"
SCRIPT_DIR="$(dirname "$0")"

echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   DPO Generation Progress Monitor${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════════${NC}\n"

# Find latest log file
LATEST_LOG=$(ls -t "${SCRIPT_DIR}"/dpo_generation_*.log 2>/dev/null | head -1)

if [ -n "$LATEST_LOG" ]; then
    echo -e "${GREEN}Latest log file:${NC} $LATEST_LOG"
    echo -e "${GREEN}Last updated:${NC} $(stat -c %y "$LATEST_LOG" | cut -d. -f1)"
    echo ""
fi

# Check output directory
if [ -d "$OUTPUT_DIR" ]; then
    echo -e "${GREEN}Output Directory:${NC} $OUTPUT_DIR"
    echo ""

    # Count files
    JSONL_COUNT=$(find "$OUTPUT_DIR" -name "*.jsonl" 2>/dev/null | wc -l)
    echo -e "${YELLOW}JSONL files:${NC} $JSONL_COUNT"

    # Count pairs per scenario
    for file in "$OUTPUT_DIR"/*.jsonl; do
        if [ -f "$file" ]; then
            COUNT=$(wc -l < "$file" 2>/dev/null || echo "0")
            SIZE=$(du -h "$file" 2>/dev/null | cut -f1)
            echo "  $(basename "$file"): ${COUNT} pairs (${SIZE})"
        fi
    done

    echo ""

    # Show stats if available
    if [ -f "$OUTPUT_DIR/stats.json" ]; then
        echo -e "${GREEN}Statistics:${NC}"
        cat "$OUTPUT_DIR/stats.json" | python3 -m json.tool 2>/dev/null || cat "$OUTPUT_DIR/stats.json"
        echo ""
    fi
else
    echo -e "${YELLOW}Output directory not yet created:${NC} $OUTPUT_DIR"
    echo ""
fi

# Check if generation is running
if pgrep -f "script/generate_dpo_dataset.py" > /dev/null; then
    echo -e "${GREEN}Status:${NC} Generation is RUNNING"
    PID=$(pgrep -f "script/generate_dpo_dataset.py")
    echo -e "${GREEN}PID:${NC} $PID"
    echo ""

    # Show resource usage
    if command -v ps >/dev/null 2>&1; then
        echo -e "${YELLOW}Resource Usage:${NC}"
        ps -p "$PID" -o %cpu,%mem,etime,cmd --no-headers
        echo ""
    fi

    # Tail log if available
    if [ -n "$LATEST_LOG" ]; then
        echo -e "${YELLOW}Recent log entries (last 20 lines):${NC}"
        echo "────────────────────────────────────────────────────────────────"
        tail -n 20 "$LATEST_LOG"
        echo "────────────────────────────────────────────────────────────────"
        echo ""
        echo -e "${BLUE}To follow log in real-time:${NC}"
        echo "  tail -f $LATEST_LOG"
    fi
else
    echo -e "${YELLOW}Status:${NC} No generation process running"
fi

echo ""
echo -e "${BLUE}Refresh this view:${NC} watch -n 10 $0"
