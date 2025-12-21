#!/bin/bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  symbolize_delivery_all_problems.sh --output_dir PATH [--input_dir PATH] [--seed INT] [--problems_subdir NAME] [--no_save_hf]

Defaults:
  --input_dir       $(pwd)/pddl3
  --seed            42
  --problems_subdir all_problems
  --save_hf         enabled (use --no_save_hf to disable)

Examples:
  ./shells/symbolize_delivery_all_problems.sh --output_dir /tmp/pddl3_symbolized_delivery_all_problems
  ./shells/symbolize_delivery_all_problems.sh --output_dir /tmp/out --seed 123 --input_dir /home/ubuntu/Safety-gen/pddl3
EOF
}

INPUT_DIR="$(pwd)/pddl3"
OUTPUT_DIR=""
SEED=42
PROBLEMS_SUBDIR="all_problems"
SAVE_HF=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --input_dir)
      INPUT_DIR="${2:-}"; shift 2 ;;
    --output_dir)
      OUTPUT_DIR="${2:-}"; shift 2 ;;
    --seed)
      SEED="${2:-}"; shift 2 ;;
    --problems_subdir)
      PROBLEMS_SUBDIR="${2:-}"; shift 2 ;;
    --no_save_hf)
      SAVE_HF=0; shift 1 ;;
    -h|--help)
      usage; exit 0 ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 2
      ;;
  esac
done

if [[ -z "${OUTPUT_DIR}" ]]; then
  echo "Error: --output_dir is required" >&2
  usage
  exit 2
fi

cmd=(python3 pddl3/pddl_symbolized_v4.py
  --input_dir "${INPUT_DIR}"
  --output_dir "${OUTPUT_DIR}"
  --domains delivery
  --problems_subdir "${PROBLEMS_SUBDIR}"
  --seed "${SEED}"
)
if [[ "${SAVE_HF}" -eq 1 ]]; then
  cmd+=(--save_hf)
fi

echo "Running:"
printf '  %q' "${cmd[@]}"
echo
"${cmd[@]}"

echo ""
echo "Finished. Output is in: ${OUTPUT_DIR}"


