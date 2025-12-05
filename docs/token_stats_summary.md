# Token Statistics Summary

- Data root: `/home/ubuntu/Safety-gen/data/sft`

## qwen3_4b_instruct

- Repository: `unsloth/Qwen3-4B-Instruct-2507`

| Scenario | Dataset | Entries | Mean Solution Tokens | Max Solution Tokens | Mean Total Tokens | Max Total Tokens | Total P95 | Total P99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| blocksworld | pddl2_dataset.json | 2000 | 73.3 | 287 | 987.4 | 1178 | 1072 | 1143 |
| blocksworld | pddl3_dataset.json | 2000 | 85.4 | 225 | 1034.0 | 1186 | 1112 | 1140 |
| ferry | pddl2_dataset.json | 2000 | 61.5 | 287 | 1039.5 | 1239 | 1104 | 1211 |
| ferry | pddl3_dataset.json | 2000 | 92.4 | 287 | 1132.7 | 1261 | 1212 | 1230 |
| grid | pddl2_dataset.json | 2000 | 173.4 | 705 | 2697.5 | 3444 | 3089 | 3194 |
| grid | pddl3_dataset.json | 2000 | 183.2 | 690 | 2808.5 | 3501 | 3146 | 3276 |
| grippers | pddl2_dataset.json | 2000 | 78.3 | 203 | 1054.0 | 1180 | 1098 | 1178 |
| grippers | pddl3_dataset.json | 2000 | 85.1 | 266 | 1088.1 | 1272 | 1150 | 1262 |
| rovers | pddl2_dataset.json | 2000 | 229.5 | 613 | 3032.5 | 3832 | 3603 | 3706 |
| rovers | pddl3_dataset.json | 2000 | 260.9 | 656 | 3184.5 | 4070 | 3646 | 3794 |
| spanner | pddl2_dataset.json | 2000 | 93.0 | 113 | 1224.0 | 1268 | 1268 | 1268 |
| spanner | pddl3_dataset.json | 2000 | 94.4 | 113 | 1276.3 | 1317 | 1317 | 1317 |

- Max solution tokens: 705 (dataset `pddl2_dataset.json` / scenario `grid`)
- Max total tokens: 4070 (dataset `pddl3_dataset.json` / scenario `rovers`)

## gpt_oss_20b_4bit

- Repository: `unsloth/gpt-oss-20b-unsloth-bnb-4bit`

| Scenario | Dataset | Entries | Mean Solution Tokens | Max Solution Tokens | Mean Total Tokens | Max Total Tokens | Total P95 | Total P99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| blocksworld | pddl2_dataset.json | 2000 | 72.5 | 228 | 989.6 | 1146 | 1071 | 1117 |
| blocksworld | pddl3_dataset.json | 2000 | 85.4 | 225 | 1038.0 | 1191 | 1117 | 1144 |
| ferry | pddl2_dataset.json | 2000 | 60.4 | 228 | 1043.4 | 1217 | 1109 | 1179 |
| ferry | pddl3_dataset.json | 2000 | 91.3 | 228 | 1138.7 | 1269 | 1213 | 1230 |
| grid | pddl2_dataset.json | 2000 | 173.4 | 705 | 2702.5 | 3449 | 3094 | 3199 |
| grid | pddl3_dataset.json | 2000 | 183.2 | 690 | 2813.5 | 3506 | 3151 | 3281 |
| grippers | pddl2_dataset.json | 2000 | 81.6 | 172 | 1068.9 | 1166 | 1117 | 1164 |
| grippers | pddl3_dataset.json | 2000 | 88.7 | 227 | 1103.5 | 1251 | 1171 | 1240 |
| rovers | pddl2_dataset.json | 2000 | 226.1 | 609 | 3086.2 | 3868 | 3651 | 3763 |
| rovers | pddl3_dataset.json | 2000 | 258.8 | 656 | 3247.5 | 4111 | 3709 | 3852 |
| spanner | pddl2_dataset.json | 2000 | 93.0 | 113 | 1209.1 | 1253 | 1253 | 1253 |
| spanner | pddl3_dataset.json | 2000 | 94.4 | 113 | 1262.4 | 1303 | 1303 | 1303 |

- Max solution tokens: 705 (dataset `pddl2_dataset.json` / scenario `grid`)
- Max total tokens: 4111 (dataset `pddl3_dataset.json` / scenario `rovers`)

## deepseek_r1_llama8b

- Repository: `unsloth/DeepSeek-R1-Distill-Llama-8B`

| Scenario | Dataset | Entries | Mean Solution Tokens | Max Solution Tokens | Mean Total Tokens | Max Total Tokens | Total P95 | Total P99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| blocksworld | pddl2_dataset.json | 2000 | 72.5 | 226 | 986.6 | 1143 | 1068 | 1111 |
| blocksworld | pddl3_dataset.json | 2000 | 85.4 | 225 | 1034.0 | 1186 | 1112 | 1140 |
| ferry | pddl2_dataset.json | 2000 | 60.4 | 226 | 1038.3 | 1210 | 1104 | 1172 |
| ferry | pddl3_dataset.json | 2000 | 91.3 | 226 | 1131.6 | 1261 | 1205 | 1223 |
| grid | pddl2_dataset.json | 2000 | 173.4 | 705 | 2697.5 | 3444 | 3089 | 3194 |
| grid | pddl3_dataset.json | 2000 | 183.2 | 690 | 2808.5 | 3501 | 3146 | 3276 |
| grippers | pddl2_dataset.json | 2000 | 77.4 | 170 | 1053.1 | 1151 | 1098 | 1149 |
| grippers | pddl3_dataset.json | 2000 | 84.2 | 226 | 1087.1 | 1236 | 1150 | 1226 |
| rovers | pddl2_dataset.json | 2000 | 226.1 | 609 | 3004.7 | 3751 | 3547 | 3654 |
| rovers | pddl3_dataset.json | 2000 | 258.8 | 656 | 3166.0 | 4005 | 3612 | 3751 |
| spanner | pddl2_dataset.json | 2000 | 93.0 | 113 | 1204.1 | 1248 | 1248 | 1248 |
| spanner | pddl3_dataset.json | 2000 | 94.4 | 113 | 1256.4 | 1297 | 1297 | 1297 |

- Max solution tokens: 705 (dataset `pddl2_dataset.json` / scenario `grid`)
- Max total tokens: 4005 (dataset `pddl3_dataset.json` / scenario `rovers`)

## mistral_7b_instruct_4bit

- Repository: `unsloth/mistral-7b-instruct-v0.3-bnb-4bit`

| Scenario | Dataset | Entries | Mean Solution Tokens | Max Solution Tokens | Mean Total Tokens | Max Total Tokens | Total P95 | Total P99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| blocksworld | pddl2_dataset.json | 2000 | 89.8 | 301 | 1210.5 | 1403 | 1313 | 1382 |
| blocksworld | pddl3_dataset.json | 2000 | 105.8 | 278 | 1274.3 | 1460 | 1373 | 1407 |
| ferry | pddl2_dataset.json | 2000 | 76.7 | 301 | 1307.7 | 1523 | 1389 | 1483 |
| ferry | pddl3_dataset.json | 2000 | 116.4 | 301 | 1426.6 | 1591 | 1519 | 1541 |
| grid | pddl2_dataset.json | 2000 | 202.6 | 827 | 3072.3 | 3931 | 3517 | 3641 |
| grid | pddl3_dataset.json | 2000 | 214.4 | 817 | 3199.5 | 4005 | 3584 | 3737 |
| grippers | pddl2_dataset.json | 2000 | 98.5 | 217 | 1285.7 | 1410 | 1344 | 1408 |
| grippers | pddl3_dataset.json | 2000 | 107.5 | 300 | 1329.0 | 1532 | 1407 | 1517 |
| rovers | pddl2_dataset.json | 2000 | 332.9 | 900 | 4043.3 | 5214 | 4884 | 5035 |
| rovers | pddl3_dataset.json | 2000 | 379.8 | 969 | 4273.8 | 5582 | 4952 | 5176 |
| spanner | pddl2_dataset.json | 2000 | 105.8 | 129 | 1483.3 | 1534 | 1534 | 1534 |
| spanner | pddl3_dataset.json | 2000 | 107.4 | 129 | 1550.1 | 1597 | 1597 | 1597 |

- Max solution tokens: 969 (dataset `pddl3_dataset.json` / scenario `rovers`)
- Max total tokens: 5582 (dataset `pddl3_dataset.json` / scenario `rovers`)
