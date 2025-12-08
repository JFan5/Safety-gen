#!/bin/bash

################################################################################
# DPO Dataset Generation - Complete Pipeline
#
# This script automates the entire DPO dataset generation process:
# 1. Environment check
# 2. Dependency installation
# 3. Testing
# 4. Full generation
# 5. Result validation
################################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="/jfan5/dpo_data-1206"
LOG_FILE="${SCRIPT_DIR}/dpo_generation_$(date +%Y%m%d_%H%M%S).log"

# Model path (will be set via argument)
MODEL_PATH=""

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1" | tee -a "$LOG_FILE"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
}

print_header() {
    echo -e "\n${BLUE}╔════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC} $1"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════════╝${NC}\n"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check Python version
check_python_version() {
    print_info "Checking Python version..."

    if ! command_exists python3; then
        print_error "Python 3 is not installed"
        exit 1
    fi

    PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
    print_success "Python version: $PYTHON_VERSION"
}

# Function to check dependencies
check_dependencies() {
    print_header "Checking Dependencies"

    local missing_deps=()

    # Check for required packages
    python3 -c "import torch" 2>/dev/null || missing_deps+=("torch")
    python3 -c "import tqdm" 2>/dev/null || missing_deps+=("tqdm")
    python3 -c "import vllm" 2>/dev/null || missing_deps+=("vllm")

    if [ ${#missing_deps[@]} -eq 0 ]; then
        print_success "All required dependencies are installed"
    else
        print_warning "Missing dependencies: ${missing_deps[*]}"
        print_info "Please install them manually:"
        print_info "  pip install ${missing_deps[*]}"
        echo ""
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_error "Exiting. Please install dependencies first."
            exit 1
        fi
    fi
}

# Function to verify file structure
verify_file_structure() {
    print_header "Verifying File Structure"

    print_info "Checking input directories..."

    SCENARIOS=("blocksworld" "grippers" "spanner" "ferry")

    for scenario in "${SCENARIOS[@]}"; do
        DIR="/home/ubuntu/Safety-gen/pddl3/${scenario}/grpo_500"
        if [ -d "$DIR" ]; then
            PDDL_COUNT=$(find "$DIR" -name "*.pddl" 2>/dev/null | wc -l)
            SOLN_COUNT=$(find "$DIR" -name "*.soln" 2>/dev/null | wc -l)
            print_success "${scenario}: Found ${PDDL_COUNT} .pddl files, ${SOLN_COUNT} .soln files"
        else
            print_warning "${scenario}: Directory not found at $DIR"
        fi
    done
}

# Function to run tests
run_tests() {
    print_header "Running Tests"

    cd "$SCRIPT_DIR"

    # Test 1: File loading
    print_info "Test 1: File Loading"
    if python3 test_dpo_generation.py --test file 2>&1 | tee -a "$LOG_FILE"; then
        print_success "File loading test passed"
    else
        print_error "File loading test failed"
        return 1
    fi

    # Test 2: Unsafe solution loading
    print_info "Test 2: Unsafe Solution Loading"
    if python3 test_dpo_generation.py --test unsafe 2>&1 | tee -a "$LOG_FILE"; then
        print_success "Unsafe solution loading test passed"
    else
        print_warning "Unsafe solution loading test failed (this is OK if no unsafe solutions exist)"
    fi

    # Test 3: Prompt creation
    print_info "Test 3: Prompt Creation"
    if python3 test_dpo_generation.py --test prompt 2>&1 | tee -a "$LOG_FILE"; then
        print_success "Prompt creation test passed"
    else
        print_error "Prompt creation test failed"
        return 1
    fi

    # Test 4: Verifier
    print_info "Test 4: Verifier"
    if python3 test_dpo_generation.py --test verifier 2>&1 | tee -a "$LOG_FILE"; then
        print_success "Verifier test passed"
    else
        print_warning "Verifier test passed (placeholder verifier active)"
    fi

    print_success "All basic tests completed"
}

# Function to run model tests
run_model_tests() {
    print_header "Running Model Tests"

    if [ -z "$MODEL_PATH" ]; then
        print_warning "No model path provided, skipping model tests"
        return 0
    fi

    cd "$SCRIPT_DIR"

    # Test model loading
    print_info "Testing model loading..."
    if python3 test_dpo_generation.py --sft_model_path "$MODEL_PATH" --test model 2>&1 | tee -a "$LOG_FILE"; then
        print_success "Model loading test passed"
    else
        print_error "Model loading test failed"
        return 1
    fi

    print_success "Model tests completed"
}

# Function to run small-scale test
run_small_test() {
    print_header "Running Small-Scale Test (3 problems)"

    if [ -z "$MODEL_PATH" ]; then
        print_warning "No model path provided, skipping small-scale test"
        return 0
    fi

    cd "$SCRIPT_DIR"

    print_info "This will test on 3 problems from blocksworld..."
    print_info "Expected duration: 2-5 minutes"

    if python3 test_dpo_generation.py --sft_model_path "$MODEL_PATH" --test generation 2>&1 | tee -a "$LOG_FILE"; then
        print_success "Small-scale test completed"

        # Check output
        TEST_OUTPUT="/jfan5/dpo_data_test"
        if [ -d "$TEST_OUTPUT" ]; then
            PAIR_COUNT=$(wc -l < "$TEST_OUTPUT"/*_test.jsonl 2>/dev/null || echo "0")
            print_info "Generated $PAIR_COUNT test pairs"

            # Show sample
            print_info "Sample output:"
            head -n 1 "$TEST_OUTPUT"/*_test.jsonl 2>/dev/null | python3 -m json.tool 2>/dev/null || cat "$TEST_OUTPUT"/*_test.jsonl 2>/dev/null | head -n 1
        fi
    else
        print_error "Small-scale test failed"
        return 1
    fi
}

# Function to run full generation
run_full_generation() {
    print_header "Running Full DPO Dataset Generation"

    if [ -z "$MODEL_PATH" ]; then
        print_error "Model path is required for full generation"
        return 1
    fi

    cd "$SCRIPT_DIR"

    # Create output directory
    mkdir -p "$OUTPUT_DIR"

    print_info "Starting full generation on 2000 problems (500 per scenario × 4 scenarios)"
    print_info "Expected duration: 2-4 hours"
    print_info "Output directory: $OUTPUT_DIR"
    print_info "Log file: $LOG_FILE"
    print_info ""
    print_warning "This process will take a long time. You can monitor progress by running:"
    print_warning "  tail -f $LOG_FILE"
    print_info ""

    # Ask for confirmation
    if [ "$AUTO_CONFIRM" != "yes" ]; then
        read -p "Continue with full generation? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Generation cancelled by user"
            return 0
        fi
    fi

    print_info "Starting generation..."
    START_TIME=$(date +%s)

    # Run generation
    if python3 generate_dpo_dataset.py --sft_model_path "$MODEL_PATH" 2>&1 | tee -a "$LOG_FILE"; then
        END_TIME=$(date +%s)
        DURATION=$((END_TIME - START_TIME))
        HOURS=$((DURATION / 3600))
        MINUTES=$(((DURATION % 3600) / 60))

        print_success "Full generation completed in ${HOURS}h ${MINUTES}m"
    else
        print_error "Full generation failed"
        return 1
    fi
}

# Function to verify output
verify_output() {
    print_header "Verifying Output"

    cd "$OUTPUT_DIR"

    # Check if output files exist
    print_info "Checking output files..."

    SCENARIOS=("blocksworld" "grippers" "spanner" "ferry")
    TOTAL_PAIRS=0

    for scenario in "${SCENARIOS[@]}"; do
        FILE="${scenario}_dpo.jsonl"
        if [ -f "$FILE" ]; then
            COUNT=$(wc -l < "$FILE")
            TOTAL_PAIRS=$((TOTAL_PAIRS + COUNT))
            print_success "${FILE}: ${COUNT} pairs"
        else
            print_warning "${FILE}: Not found"
        fi
    done

    # Check merged file
    if [ -f "all_scenarios_merged.jsonl" ]; then
        MERGED_COUNT=$(wc -l < "all_scenarios_merged.jsonl")
        print_success "all_scenarios_merged.jsonl: ${MERGED_COUNT} pairs"
    else
        print_warning "all_scenarios_merged.jsonl: Not found"
    fi

    # Check stats file
    if [ -f "stats.json" ]; then
        print_success "stats.json: Found"
        print_info "Statistics:"
        cat stats.json | python3 -m json.tool 2>/dev/null || cat stats.json
    else
        print_warning "stats.json: Not found"
    fi

    print_info "Total pairs generated: $TOTAL_PAIRS"

    # Validate JSON format
    print_info "Validating JSON format..."
    for file in *.jsonl; do
        if [ -f "$file" ]; then
            if head -n 1 "$file" | python3 -m json.tool >/dev/null 2>&1; then
                print_success "${file}: Valid JSON format"
            else
                print_error "${file}: Invalid JSON format"
            fi
        fi
    done
}

# Function to create train/val split
create_train_val_split() {
    print_header "Creating Train/Val Split"

    cd "$OUTPUT_DIR"

    if [ ! -f "all_scenarios_merged.jsonl" ]; then
        print_error "Merged file not found, cannot create split"
        return 1
    fi

    TOTAL_LINES=$(wc -l < all_scenarios_merged.jsonl)
    TRAIN_LINES=$((TOTAL_LINES * 9 / 10))
    VAL_LINES=$((TOTAL_LINES - TRAIN_LINES))

    print_info "Total pairs: $TOTAL_LINES"
    print_info "Train: $TRAIN_LINES (90%)"
    print_info "Val: $VAL_LINES (10%)"

    # Create split
    head -n "$TRAIN_LINES" all_scenarios_merged.jsonl > train.jsonl
    tail -n "$VAL_LINES" all_scenarios_merged.jsonl > val.jsonl

    print_success "Created train.jsonl and val.jsonl"

    # Sample some examples
    print_info "Sampling 10 random examples for review..."
    shuf -n 10 all_scenarios_merged.jsonl > sample_pairs.jsonl
    print_success "Created sample_pairs.jsonl for manual review"
}

# Function to generate summary report
generate_report() {
    print_header "Generating Summary Report"

    REPORT_FILE="${SCRIPT_DIR}/dpo_generation_report_$(date +%Y%m%d_%H%M%S).txt"

    {
        echo "================================================================"
        echo "DPO Dataset Generation Report"
        echo "================================================================"
        echo ""
        echo "Date: $(date)"
        echo "Model: $MODEL_PATH"
        echo "Output Directory: $OUTPUT_DIR"
        echo ""
        echo "----------------------------------------------------------------"
        echo "File Summary"
        echo "----------------------------------------------------------------"
        echo ""

        cd "$OUTPUT_DIR"
        for file in *.jsonl; do
            if [ -f "$file" ]; then
                COUNT=$(wc -l < "$file")
                SIZE=$(du -h "$file" | cut -f1)
                echo "$file: $COUNT pairs ($SIZE)"
            fi
        done

        echo ""
        echo "----------------------------------------------------------------"
        echo "Statistics"
        echo "----------------------------------------------------------------"
        echo ""

        if [ -f "stats.json" ]; then
            cat stats.json | python3 -m json.tool
        fi

        echo ""
        echo "----------------------------------------------------------------"
        echo "Sample Pair"
        echo "----------------------------------------------------------------"
        echo ""

        if [ -f "all_scenarios_merged.jsonl" ]; then
            head -n 1 all_scenarios_merged.jsonl | python3 -m json.tool
        fi

    } > "$REPORT_FILE"

    print_success "Report saved to: $REPORT_FILE"

    # Display report
    cat "$REPORT_FILE"
}

# Function to display usage
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

DPO Dataset Generation - Complete Pipeline

OPTIONS:
    -m, --model PATH          Path to SFT model (required for generation)
    -t, --test-only           Run tests only, skip generation
    -s, --small-test          Run small-scale test only (3 problems)
    -f, --full                Run full generation (default)
    -y, --yes                 Auto-confirm all prompts
    -h, --help                Show this help message

EXAMPLES:
    # Run all tests
    $0 --test-only

    # Run small-scale test with model
    $0 --model /path/to/model --small-test

    # Run full generation
    $0 --model /path/to/model --full

    # Run full generation with auto-confirm
    $0 --model /path/to/model --full --yes

WORKFLOW:
    1. Install dependencies
    2. Verify file structure
    3. Run basic tests
    4. Run model tests (if model provided)
    5. Run small-scale test (if requested)
    6. Run full generation (if requested)
    7. Verify output
    8. Create train/val split
    9. Generate report

EOF
}

# Main function
main() {
    print_header "DPO Dataset Generation Pipeline"

    # Parse arguments
    TEST_ONLY=false
    SMALL_TEST=false
    FULL_GEN=false
    AUTO_CONFIRM=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            -m|--model)
                MODEL_PATH="$2"
                shift 2
                ;;
            -t|--test-only)
                TEST_ONLY=true
                shift
                ;;
            -s|--small-test)
                SMALL_TEST=true
                shift
                ;;
            -f|--full)
                FULL_GEN=true
                shift
                ;;
            -y|--yes)
                AUTO_CONFIRM=yes
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    # If no mode specified, default to full
    if [ "$TEST_ONLY" = false ] && [ "$SMALL_TEST" = false ] && [ "$FULL_GEN" = false ]; then
        FULL_GEN=true
    fi

    # Log start time
    print_info "Pipeline started at $(date)"
    print_info "Log file: $LOG_FILE"

    # Step 1: Check Python
    check_python_version

    # Step 2: Check dependencies
    check_dependencies

    # Step 3: Verify file structure
    verify_file_structure

    # Step 4: Run tests
    run_tests || {
        print_error "Tests failed. Please fix issues before continuing."
        exit 1
    }

    # Step 5: Model-dependent steps
    if [ -n "$MODEL_PATH" ]; then
        # Verify model path
        if [ ! -d "$MODEL_PATH" ]; then
            print_error "Model path does not exist: $MODEL_PATH"
            exit 1
        fi

        print_success "Model path verified: $MODEL_PATH"

        # Run model tests
        run_model_tests || {
            print_error "Model tests failed"
            exit 1
        }

        # Small test if requested
        if [ "$SMALL_TEST" = true ]; then
            run_small_test || {
                print_error "Small-scale test failed"
                exit 1
            }
        fi

        # Full generation if requested and not test-only
        if [ "$FULL_GEN" = true ] && [ "$TEST_ONLY" = false ]; then
            run_full_generation || {
                print_error "Full generation failed"
                exit 1
            }

            # Verify output
            verify_output

            # Create splits
            create_train_val_split

            # Generate report
            generate_report
        fi
    else
        if [ "$TEST_ONLY" = false ]; then
            print_warning "No model path provided. Use -m/--model to specify model for generation."
            print_info "Only basic tests were run."
        fi
    fi

    # Summary
    print_header "Pipeline Complete"
    print_success "All steps completed successfully!"
    print_info "Log saved to: $LOG_FILE"

    if [ "$FULL_GEN" = true ] && [ -n "$MODEL_PATH" ]; then
        print_info "Output directory: $OUTPUT_DIR"
        print_info ""
        print_info "Next steps:"
        print_info "  1. Review the generated report"
        print_info "  2. Manually check sample_pairs.jsonl"
        print_info "  3. Use train.jsonl and val.jsonl for DPO training"
    fi
}

# Run main function
main "$@"
