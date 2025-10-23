# Planning Results Visualization

This directory contains tools for visualizing planning results from fine-tuned and unfine-tuned models.

## Files

### `visualize_planning_results.py`
A comprehensive visualization script that generates various charts from planning results JSON data.

### `script/parse_planning_results.py`
A script to parse and classify planning results from JSON files into different error categories.

## Usage

### 1. Parse Planning Results
First, parse your planning results to generate aggregated JSON:

```bash
python script/parse_planning_results.py --aggregate-existing --planning-results-dir planning_results --aggregate-output results.json
```

### 2. Generate Visualizations
Then generate charts from the aggregated results:

```bash
python visualize_planning_results.py --input results.json --output-dir plots
```

## Generated Charts

The visualization script generates the following charts:

### 1. Scenario Comparison Charts
- **`{scenario}_comparison.png`**: Side-by-side comparison of fine-tuned vs unfine-tuned models for each scenario
- Shows percentage breakdown of different error categories
- Includes actual counts and percentages

### 2. Overall Comparison Chart
- **`overall_comparison.png`**: Success rate and format error rate comparison across all scenarios
- Direct comparison between fine-tuned and unfine-tuned models
- Helps identify which scenarios benefit most from fine-tuning

### 3. Category Distribution Chart
- **`category_distribution.png`**: Stacked bar charts showing error category distribution
- Separate charts for fine-tuned and unfine-tuned models
- Shows the proportion of different failure types

## Error Categories

The results are classified into the following categories:

- **Success Plans**: Plans that executed successfully
- **Plan Format Error**: Syntax errors, unknown actions, type errors, etc.
- **Precondition Violation**: Plans that failed due to unsatisfied preconditions
- **Safety Constraints Violation**: Plans that violated safety constraints
- **Goal Not Satisfied**: Plans that executed but didn't achieve the goal
- **Others**: Miscellaneous errors (should be minimal with proper classification)

## Command Line Options

### `visualize_planning_results.py`
- `--input, -i`: Input JSON file path (default: planning_results_aggregated_mistral_final_complete.json)
- `--output-dir, -o`: Output directory for plots (default: plots)
- `--scenarios`: Specific scenarios to plot (default: all)

### `parse_planning_results.py`
- `--aggregate-existing`: Aggregate existing planning results
- `--planning-results-dir`: Directory containing planning results (default: planning_results)
- `--aggregate-output`: Output JSON file path

## Example Workflow

```bash
# 1. Parse and aggregate results
python script/parse_planning_results.py \
  --aggregate-existing \
  --planning-results-dir planning_results \
  --aggregate-output aggregated_results.json

# 2. Generate all visualizations
python visualize_planning_results.py \
  --input aggregated_results.json \
  --output-dir final_plots

# 3. Generate visualizations for specific scenarios only
python visualize_planning_results.py \
  --input aggregated_results.json \
  --output-dir specific_plots \
  --scenarios blocksworld grippers
```

## Chart Interpretation

### Success Rate Analysis
- Higher success rates indicate better model performance
- Compare fine-tuned vs unfine-tuned to see improvement

### Error Pattern Analysis
- **High Format Errors**: Model needs better plan syntax training
- **High Precondition Violations**: Model needs better understanding of action preconditions
- **High Safety Violations**: Model needs better safety constraint understanding
- **High Goal Not Satisfied**: Model needs better goal achievement training

### Fine-tuning Effectiveness
- Look for scenarios where fine-tuned models show significant improvement
- Identify which error categories are most improved by fine-tuning
