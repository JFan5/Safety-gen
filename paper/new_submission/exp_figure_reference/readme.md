Figure 3, Benchmark comparasion

Source: runs/benchmark/compare


Figure 4 single-domain sft and grpo

baseline: /home/jfan5/Safety-gen/paper_results_iccps2025/mistral-blocksworld-variant/baseline.json
sft: /home/jfan5/Safety-gen/runs/mistral/sft/20251125_003048_proj-pddl-finetune_method-sft_base-mistral_7b_ds-unknown_seed-3407_2gvrrx7s/evals/blocksworld_-jfan5-sft_models-mistral_variant-blocksworld_50_20251207_034712.json
grpo: /home/jfan5/Safety-gen/runs/mistral/grpo/20251221_145922_proj-pddl-grpo-mistral7b_method-grpo_base-mistral_7b_ds-blocksworld_seed-3407_h62ki5xw/eval/solver_batch__temp0.6_max512_bs8/scenarios/blocksworld.json

调用shell， /home/jfan5/Safety-gen/shells/plot_mistral_blocksworld.sh

## table 2的数据来源
Pretrained:  paper_results_iccps2025/qwen3-14b/baseline
SFT:  /home/jfan5/Safety-gen/runs/qwen3/sft/20251212_155500_proj-pddl-finetune_method-sft_base-qwen3_14b_ds-unknown_seed-3407_ae96jbqy/eval/solver_batch__temp0.6_max512_bs8_20260126_184501
GRPO: /home/jfan5/Safety-gen/runs/qwen3/grpo/grpo_qwen3-14b-curriculum_v2-all-0111-stl_20260111_015253_seed3407/eval/solver_batch__temp0.6_max512_bs8_20260122_143526



