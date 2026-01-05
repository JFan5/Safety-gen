# Problem Difficulty Distribution Statistics for All Scenarios

Generated: 2025-12-03 10:02:34

This document summarizes the problem difficulty and quantity distribution statistics for all PDDL3 Scenarios.

Statistics include the following directories:
- `all_problems3`: All PDDL3 problems
- `all_problems3/testing`: Test set problems
- `sft_500`: SFT training set (500 problems)
- `grpo_500`: GRPO training set (500 problems)

## GRID

### all_problems3

- **Total problems**: 1209 (root directory)
- **training**: 1009 problems
- **testing**: 200 problems

#### Distribution by Configuration (x, y, sh, k, l) - Sorted by Complexity
| Configuration (x, y, sh, k, l) | Complexity | Total Problems | training | testing |
|-------------------------------|------------|----------------|----------|---------|
| (2, 2, 1, 1, 1) | 7 | 6 | 5 | 1 |
| (3, 3, 2, 2, 2) | 15 | 51 | 41 | 10 |
| (4, 4, 2, 2, 2) | 22 | 235 | 207 | 28 |
| (4, 4, 2, 3, 3) | 24 | 225 | 191 | 34 |
| (4, 4, 3, 3, 3) | 25 | 106 | 85 | 21 |
| (5, 5, 2, 3, 3) | 33 | 227 | 180 | 47 |
| (5, 5, 3, 3, 3) | 34 | 271 | 222 | 49 |
| (5, 5, 3, 4, 4) | 36 | 88 | 78 | 10 |

**Notes**: 
- All problems have valid solutions
- Complexity = x × y + sh + k + l
- x, y: grid size; sh: shapes; k: keys; l: locks

### all_problems3/testing

- **Total problems**: 200

**Notes**: 
- All problems have valid solutions
- Uniform distribution, containing various difficulty configurations

### sft_500

- **Total problems**: 500
- **Average complexity**: 27.4
- **Source**: all_problems3/training

#### Distribution by Configuration (x, y, sh, k, l) - Sorted by Complexity
| Configuration (x, y, sh, k, l) | Complexity | Problem Count |
|-------------------------------|------------|---------------|
| (2, 2, 1, 1, 1) | 7 | 5 |
| (3, 3, 2, 2, 2) | 15 | 41 |
| (4, 4, 2, 2, 2) | 22 | 94 |
| (4, 4, 2, 3, 3) | 24 | 74 |
| (4, 4, 3, 3, 3) | 25 | 64 |
| (5, 5, 2, 3, 3) | 33 | 72 |
| (5, 5, 3, 3, 3) | 34 | 86 |
| (5, 5, 3, 4, 4) | 36 | 64 |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/training`

### grpo_500

- **Total problems**: 500
- **Average complexity**: 28.5
- **Source**: all_problems3/training

#### Distribution by Configuration (x, y, sh, k, l) - Sorted by Complexity
| Configuration (x, y, sh, k, l) | Complexity | Problem Count |
|-------------------------------|------------|---------------|
| (4, 4, 2, 2, 2) | 22 | 113 |
| (4, 4, 2, 3, 3) | 24 | 114 |
| (4, 4, 3, 3, 3) | 25 | 21 |
| (5, 5, 2, 3, 3) | 33 | 105 |
| (5, 5, 3, 3, 3) | 34 | 133 |
| (5, 5, 3, 4, 4) | 36 | 14 |

**Notes**: 
- All problems have valid solutions
- No overlap with `testing_problem50` (0 problems)
- No overlap with `sft_500` (0 problems)
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/training`, excluding problems in `sft_500`

### testing_problem50

- **Total problems**: 50
- **Average complexity**: 26.8
- **Source**: all_problems3/testing

#### Distribution by Configuration (x, y, sh, k, l) - Sorted by Complexity
| Configuration (x, y, sh, k, l) | Complexity | Problem Count |
|-------------------------------|------------|---------------|
| (2, 2, 1, 1, 1) | 7 | 1 |
| (3, 3, 2, 2, 2) | 15 | 7 |
| (4, 4, 2, 2, 2) | 22 | 6 |
| (4, 4, 2, 3, 3) | 24 | 6 |
| (4, 4, 3, 3, 3) | 25 | 8 |
| (5, 5, 2, 3, 3) | 33 | 8 |
| (5, 5, 3, 3, 3) | 34 | 8 |
| (5, 5, 3, 4, 4) | 36 | 6 |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/testing`


---

## BLOCKSWORLD

### all_problems3

- **Total problems**: 4005

#### Distribution by Number of Operators
| Ops | Problem Count | Percentage |
|-----|---------------|------------|
| 3 | 2362 | 59.0% |
| 4 | 1643 | 41.0% |

#### Distribution by Number of Blocks
| Blocks (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 3 | 243 | 6.1% |
| 4 | 644 | 16.1% |
| 5 | 1256 | 31.4% |
| 6 | 1862 | 46.5% |

#### Main Configurations (Top 5)
| Ops | Blocks (n) | Problem Count | Percentage |
|-----|------------|---------------|------------|
| 3 | 6 | 944 | 23.6% |
| 4 | 6 | 918 | 22.9% |
| 3 | 5 | 708 | 17.7% |
| 4 | 5 | 548 | 13.7% |
| 3 | 4 | 467 | 11.7% |

### all_problems3/testing

- **Total problems**: 200

#### Distribution by Number of Operators
| Ops | Problem Count | Percentage |
|-----|---------------|------------|
| 3 | 108 | 54.0% |
| 4 | 92 | 46.0% |

#### Distribution by Number of Blocks
| Blocks (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 3 | 14 | 7.0% |
| 4 | 31 | 15.5% |
| 5 | 53 | 26.5% |
| 6 | 102 | 51.0% |

#### Main Configurations (Top 5)
| Ops | Blocks (n) | Problem Count | Percentage |
|-----|------------|---------------|------------|
| 4 | 6 | 52 | 26.0% |
| 3 | 6 | 50 | 25.0% |
| 4 | 5 | 27 | 13.5% |
| 3 | 5 | 26 | 13.0% |
| 3 | 4 | 18 | 9.0% |

### sft_500

- **Total problems**: 500

#### Distribution by Number of Operators
| Ops | Problem Count | Percentage |
|-----|---------------|------------|
| 3 | 500 | 100.0% |

#### Distribution by Number of Blocks
| Blocks (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 3 | 23 | 4.6% |
| 4 | 98 | 19.6% |
| 5 | 213 | 42.6% |
| 6 | 166 | 33.2% |

#### Main Configurations (Top 5)
| Ops | Blocks (n) | Problem Count | Percentage |
|-----|------------|---------------|------------|
| 3 | 5 | 213 | 42.6% |
| 3 | 6 | 166 | 33.2% |
| 3 | 4 | 98 | 19.6% |
| 3 | 3 | 23 | 4.6% |

### grpo_500

- **Total problems**: 500

#### Distribution by Number of Operators
| Ops | Problem Count | Percentage |
|-----|---------------|------------|
| 3 | 123 | 24.6% |
| 4 | 377 | 75.4% |

#### Distribution by Number of Blocks
| Blocks (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 4 | 62 | 12.4% |
| 5 | 226 | 45.2% |
| 6 | 212 | 42.4% |

#### Main Configurations (Top 5)
| Ops | Blocks (n) | Problem Count | Percentage |
|-----|------------|---------------|------------|
| 4 | 5 | 226 | 45.2% |
| 3 | 6 | 123 | 24.6% |
| 4 | 6 | 89 | 17.8% |
| 4 | 4 | 62 | 12.4% |

### testing_problem50

- **Total problems**: 50
- **Source**: all_problems3/testing

#### Distribution by Number of Operators
| Ops | Problem Count | Percentage |
|-----|---------------|------------|
| 3 | 24 | 48.0% |
| 4 | 26 | 52.0% |

#### Distribution by Number of Blocks
| Blocks (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 3 | 7 | 14.0% |
| 4 | 14 | 28.0% |
| 5 | 13 | 26.0% |
| 6 | 16 | 32.0% |

#### Main Configurations
| Ops | Blocks (n) | Problem Count | Percentage |
|-----|------------|---------------|------------|
| 4 | 5 | 10 | 20.0% |
| 4 | 6 | 9 | 18.0% |
| 3 | 3 | 7 | 14.0% |
| 3 | 4 | 7 | 14.0% |
| 3 | 6 | 7 | 14.0% |
| 4 | 4 | 7 | 14.0% |
| 3 | 5 | 3 | 6.0% |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/testing`

---

## FERRY

### all_problems3

- **Total problems**: 5000

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 740 | 14.8% |
| 4 | 1220 | 24.4% |
| 5 | 1369 | 27.4% |
| 6 | 1671 | 33.4% |

#### Distribution by Number of Cars
| Cars (c) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 1296 | 25.9% |
| 3 | 3704 | 74.1% |

#### Main Configurations (Top 5)
| Locations (l) | Cars (c) | Problem Count | Percentage |
|---------------|----------|---------------|------------|
| 4 | 3 | 1045 | 20.9% |
| 6 | 3 | 1000 | 20.0% |
| 5 | 3 | 1000 | 20.0% |
| 6 | 2 | 671 | 13.4% |
| 3 | 3 | 659 | 13.2% |

### all_problems3/testing

- **Total problems**: 200

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 28 | 14.0% |
| 4 | 61 | 30.5% |
| 5 | 52 | 26.0% |
| 6 | 59 | 29.5% |

#### Distribution by Number of Cars
| Cars (c) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 48 | 24.0% |
| 3 | 152 | 76.0% |

#### Main Configurations (Top 5)
| Locations (l) | Cars (c) | Problem Count | Percentage |
|---------------|----------|---------------|------------|
| 4 | 3 | 51 | 25.5% |
| 6 | 3 | 39 | 19.5% |
| 5 | 3 | 36 | 18.0% |
| 3 | 3 | 26 | 13.0% |
| 6 | 2 | 20 | 10.0% |

### sft_500

- **Total problems**: 500

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 478 | 95.6% |
| 4 | 22 | 4.4% |

#### Distribution by Number of Cars
| Cars (c) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 70 | 14.0% |
| 3 | 430 | 86.0% |

#### Main Configurations (Top 5)
| Locations (l) | Cars (c) | Problem Count | Percentage |
|---------------|----------|---------------|------------|
| 3 | 3 | 430 | 86.0% |
| 3 | 2 | 48 | 9.6% |
| 4 | 2 | 22 | 4.4% |

### grpo_500

- **Total problems**: 500

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 4 | 500 | 100.0% |

#### Distribution by Number of Cars
| Cars (c) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 130 | 26.0% |
| 3 | 370 | 74.0% |

#### Main Configurations (Top 5)
| Locations (l) | Cars (c) | Problem Count | Percentage |
|---------------|----------|---------------|------------|
| 4 | 3 | 370 | 74.0% |
| 4 | 2 | 130 | 26.0% |

### testing_problem50

- **Total problems**: 50
- **Source**: all_problems3/testing

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 13 | 26.0% |
| 4 | 13 | 26.0% |
| 5 | 12 | 24.0% |
| 6 | 12 | 24.0% |

#### Distribution by Number of Cars
| Cars (c) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 25 | 50.0% |
| 3 | 25 | 50.0% |

#### Main Configurations
| Locations (l) | Cars (c) | Problem Count | Percentage |
|---------------|----------|---------------|------------|
| 5 | 2 | 12 | 24.0% |
| 3 | 3 | 11 | 22.0% |
| 6 | 3 | 11 | 22.0% |
| 4 | 2 | 10 | 20.0% |
| 4 | 3 | 3 | 6.0% |
| 3 | 2 | 2 | 4.0% |
| 6 | 2 | 1 | 2.0% |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/testing`

---

## SPANNER

### all_problems3

- **Total problems**: 2892

#### Distribution by Number of Spanners
| Spanners (s) | Problem Count | Percentage |
|--------------|---------------|------------|
| 2 | 349 | 12.1% |
| 3 | 2248 | 77.7% |
| 4 | 295 | 10.2% |

#### Distribution by Number of Nuts
| Nuts (n) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 1400 | 48.4% |
| 3 | 1492 | 51.6% |

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 349 | 12.1% |
| 4 | 2543 | 87.9% |

#### Main Configurations (Top 5)
| Spanners (s) | Nuts (n) | Locations (l) | Problem Count | Percentage |
|--------------|----------|---------------|---------------|------------|
| 3 | 3 | 4 | 1197 | 41.4% |
| 3 | 2 | 4 | 1051 | 36.3% |
| 2 | 2 | 3 | 349 | 12.1% |
| 4 | 3 | 4 | 295 | 10.2% |

### all_problems3/testing

- **Total problems**: 195

#### Distribution by Number of Spanners
| Spanners (s) | Problem Count | Percentage |
|--------------|---------------|------------|
| 2 | 25 | 12.8% |
| 3 | 152 | 77.9% |
| 4 | 18 | 9.2% |

#### Distribution by Number of Nuts
| Nuts (n) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 103 | 52.8% |
| 3 | 92 | 47.2% |

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 25 | 12.8% |
| 4 | 170 | 87.2% |

#### Main Configurations (Top 5)
| Spanners (s) | Nuts (n) | Locations (l) | Problem Count | Percentage |
|--------------|----------|---------------|---------------|------------|
| 3 | 2 | 4 | 78 | 40.0% |
| 3 | 3 | 4 | 74 | 37.9% |
| 2 | 2 | 3 | 25 | 12.8% |
| 4 | 3 | 4 | 18 | 9.2% |

### sft_500

- **Total problems**: 500

#### Distribution by Number of Spanners
| Spanners (s) | Problem Count | Percentage |
|--------------|---------------|------------|
| 2 | 324 | 64.8% |
| 3 | 176 | 35.2% |

#### Distribution by Number of Nuts
| Nuts (n) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 500 | 100.0% |

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 324 | 64.8% |
| 4 | 176 | 35.2% |

#### Main Configurations (Top 5)
| Spanners (s) | Nuts (n) | Locations (l) | Problem Count | Percentage |
|--------------|----------|---------------|---------------|------------|
| 2 | 2 | 3 | 324 | 64.8% |
| 3 | 2 | 4 | 176 | 35.2% |

### grpo_500

- **Total problems**: 500

#### Distribution by Number of Spanners
| Spanners (s) | Problem Count | Percentage |
|--------------|---------------|------------|
| 3 | 500 | 100.0% |

#### Distribution by Number of Nuts
| Nuts (n) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 399 | 79.8% |
| 3 | 101 | 20.2% |

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 4 | 500 | 100.0% |

#### Main Configurations (Top 5)
| Spanners (s) | Nuts (n) | Locations (l) | Problem Count | Percentage |
|--------------|----------|---------------|---------------|------------|
| 3 | 2 | 4 | 399 | 79.8% |
| 3 | 3 | 4 | 101 | 20.2% |

### testing_problem50

- **Total problems**: 50
- **Source**: all_problems3/testing

#### Distribution by Number of Spanners
| Spanners (s) | Problem Count | Percentage |
|--------------|---------------|------------|
| 2 | 17 | 34.0% |
| 3 | 17 | 34.0% |
| 4 | 16 | 32.0% |

#### Distribution by Number of Nuts
| Nuts (n) | Problem Count | Percentage |
|----------|---------------|------------|
| 2 | 25 | 50.0% |
| 3 | 25 | 50.0% |

#### Distribution by Number of Locations
| Locations (l) | Problem Count | Percentage |
|---------------|---------------|------------|
| 3 | 17 | 34.0% |
| 4 | 33 | 66.0% |

#### Main Configurations
| Spanners (s) | Nuts (n) | Locations (l) | Problem Count | Percentage |
|--------------|----------|---------------|---------------|------------|
| 2 | 2 | 3 | 17 | 34.0% |
| 4 | 3 | 4 | 16 | 32.0% |
| 3 | 3 | 4 | 9 | 18.0% |
| 3 | 2 | 4 | 8 | 16.0% |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/testing`

---

## GRIPPERS

### all_problems3

- **Total problems**: 5000

#### Distribution by Number of Robots
| Robots (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 1 | 750 | 15.0% |
| 2 | 4250 | 85.0% |

#### Distribution by Number of Rooms
| Rooms (r) | Problem Count | Percentage |
|-----------|---------------|------------|
| 3 | 1100 | 22.0% |
| 4 | 3900 | 78.0% |

#### Distribution by Number of Objects
| Objects (o) | Problem Count | Percentage |
|-------------|---------------|------------|
| 2 | 50 | 1.0% |
| 3 | 3150 | 63.0% |
| 4 | 1800 | 36.0% |

#### Main Configurations (Top 5)
| Robots (n) | Rooms (r) | Objects (o) | Problem Count | Percentage |
|------------|-----------|-------------|---------------|------------|
| 2 | 4 | 4 | 1800 | 36.0% |
| 2 | 4 | 3 | 1500 | 30.0% |
| 2 | 3 | 3 | 900 | 18.0% |
| 1 | 4 | 3 | 600 | 12.0% |
| 1 | 3 | 3 | 150 | 3.0% |

### all_problems3/testing

- **Total problems**: 200

#### Distribution by Number of Robots
| Robots (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 1 | 28 | 14.0% |
| 2 | 172 | 86.0% |

#### Distribution by Number of Rooms
| Rooms (r) | Problem Count | Percentage |
|-----------|---------------|------------|
| 3 | 56 | 28.0% |
| 4 | 144 | 72.0% |

#### Distribution by Number of Objects
| Objects (o) | Problem Count | Percentage |
|-------------|---------------|------------|
| 2 | 2 | 1.0% |
| 3 | 134 | 67.0% |
| 4 | 64 | 32.0% |

#### Main Configurations (Top 5)
| Robots (n) | Rooms (r) | Objects (o) | Problem Count | Percentage |
|------------|-----------|-------------|---------------|------------|
| 2 | 4 | 4 | 64 | 32.0% |
| 2 | 4 | 3 | 55 | 27.5% |
| 2 | 3 | 3 | 51 | 25.5% |
| 1 | 4 | 3 | 25 | 12.5% |
| 1 | 3 | 3 | 3 | 1.5% |

### sft_500

- **Total problems**: 500

#### Distribution by Number of Robots
| Robots (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 1 | 500 | 100.0% |

#### Distribution by Number of Rooms
| Rooms (r) | Problem Count | Percentage |
|-----------|---------------|------------|
| 3 | 142 | 28.4% |
| 4 | 358 | 71.6% |

#### Distribution by Number of Objects
| Objects (o) | Problem Count | Percentage |
|-------------|---------------|------------|
| 3 | 500 | 100.0% |

#### Main Configurations (Top 5)
| Robots (n) | Rooms (r) | Objects (o) | Problem Count | Percentage |
|------------|-----------|-------------|---------------|------------|
| 1 | 4 | 3 | 358 | 71.6% |
| 1 | 3 | 3 | 142 | 28.4% |

### grpo_500

- **Total problems**: 500

#### Distribution by Number of Robots
| Robots (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 1 | 211 | 42.2% |
| 2 | 289 | 57.8% |

#### Distribution by Number of Rooms
| Rooms (r) | Problem Count | Percentage |
|-----------|---------------|------------|
| 3 | 289 | 57.8% |
| 4 | 211 | 42.2% |

#### Distribution by Number of Objects
| Objects (o) | Problem Count | Percentage |
|-------------|---------------|------------|
| 2 | 23 | 4.6% |
| 3 | 477 | 95.4% |

#### Main Configurations (Top 5)
| Robots (n) | Rooms (r) | Objects (o) | Problem Count | Percentage |
|------------|-----------|-------------|---------------|------------|
| 2 | 3 | 3 | 266 | 53.2% |
| 1 | 4 | 3 | 211 | 42.2% |
| 2 | 3 | 2 | 23 | 4.6% |

### testing_problem50

- **Total problems**: 50
- **Source**: all_problems3/testing

#### Distribution by Number of Robots
| Robots (n) | Problem Count | Percentage |
|------------|---------------|------------|
| 1 | 25 | 50.0% |
| 2 | 25 | 50.0% |

#### Distribution by Number of Rooms
| Rooms (r) | Problem Count | Percentage |
|-----------|---------------|------------|
| 3 | 25 | 50.0% |
| 4 | 25 | 50.0% |

#### Distribution by Number of Objects
| Objects (o) | Problem Count | Percentage |
|-------------|---------------|------------|
| 2 | 2 | 4.0% |
| 3 | 48 | 96.0% |

#### Main Configurations
| Robots (n) | Rooms (r) | Objects (o) | Problem Count | Percentage |
|------------|-----------|-------------|---------------|------------|
| 1 | 4 | 3 | 22 | 44.0% |
| 2 | 3 | 3 | 20 | 40.0% |
| 1 | 3 | 3 | 3 | 6.0% |
| 2 | 4 | 3 | 3 | 6.0% |
| 2 | 3 | 2 | 2 | 4.0% |

**Notes**: 
- All problems have valid solutions
- **Uniform distribution**, containing various difficulty configurations
- Uniformly sampled from `all_problems3/testing`

---

## DELIVERY

### all_problems3

- **Total problems**: 1311 (after cleanup, removed 689 problems without solutions or with invalid solutions)

#### Distribution by Configuration (s, p)
| Configuration (s, p) | Problem Count |
|---------------------|---------------|
| (2, 1) | 12 |
| (2, 2) | 33 |
| (3, 1) | 185 |
| (3, 2) | 384 |
| (4, 1) | 319 |
| (4, 2) | 378 |

**Notes**: 
- s: grid size
- p: number of packages
- All problems have valid solutions

### all_problems3/testing

- **Total problems**: 1311 (delivery project does not have a separate testing subdirectory, all problems are in the root directory)

### sft_500_new

- **Total problems**: 500

#### Distribution by Configuration (s, p)
| Configuration (s, p) | Problem Count |
|---------------------|---------------|
| (2, 1) | 12 |
| (2, 2) | 33 |
| (3, 1) | 103 |
| (3, 2) | 118 |
| (4, 1) | 112 |
| (4, 2) | 122 |

**Notes**: 
- All problems cannot be solved by old solutions from `all_problems`
- All problems have valid solutions
- Uniform distribution, containing various difficulty levels

### grpo_500

- **Total problems**: 500

#### Distribution by Configuration (s, p)
| Configuration (s, p) | Problem Count |
|---------------------|---------------|
| (3, 1) | 81 |
| (3, 2) | 143 |
| (4, 1) | 135 |
| (4, 2) | 141 |

**Notes**: 
- All problems have valid solutions
- No overlap with `testing_problem50` (0 problems)
- No overlap with `sft_500_new` (0 problems)
- Uniform distribution, containing various difficulty levels

### testing_problem50

- **Total problems**: 50

#### Distribution by Configuration (s, p)
| Configuration (s, p) | Problem Count |
|---------------------|---------------|
| (2, 1) | 9 |
| (2, 2) | 9 |
| (3, 1) | 8 |
| (3, 2) | 8 |
| (4, 1) | 8 |
| (4, 2) | 8 |

**Notes**: 
- All problems have valid solutions
- Uniform distribution, containing various difficulty levels


---

## Training Set Validation Statistics

This section provides statistics on whether problems in `all_problems3/training` can be solved by old solutions (PDDL2 solutions) from `all_problems/training`. This validates the effectiveness of PDDL3 constraints: if constraints are effective, old solutions should not be able to solve the new PDDL3 problems.

### Validation Method

For each scenario, validated using `validate_classical_solvers.py`:
- **Domain**: `domain3.pddl` (PDDL3 domain)
- **Problems**: All `.pddl` files in `all_problems3/training` directory
- **Solutions**: Corresponding `.soln` files in `all_problems/training` directory

### Statistics Results

| Scenario | Total Problems (all_problems3/training) | Solvable by Old Solutions | Not Solvable by Old Solutions | Solvable Ratio |
|----------|----------------------------------------|---------------------------|------------------------------|----------------|
| **blocksworld** | 3,805 | **1,626** | 2,030 | **42.73%** |
| **ferry** | 4,800 | **377** | 4,423 | **7.85%** |
| **spanner** | 1,497 | **0** | 377 | **0.00%** |
| **grippers** | 4,605 | **1,285** | 3,318 | **27.90%** |

### Explanation

- **Solvable by Old Solutions**: Problems in `all_problems3/training` where a `.soln` from `all_problems/training` validates as valid under `domain3.pddl`
- **Not Solvable by Old Solutions**: Problems in `all_problems3/training` where all corresponding old solutions are invalid under PDDL3
- **Validation Date**: 2025-12-03

### Conclusions

- **spanner**: ✅ Constraints fully effective, 0 problems solvable by old solutions (100% constraint effectiveness)
- **ferry**: ⚠️ 377 problems (7.85%) still solvable by old solutions
- **grippers**: ⚠️ 1,285 problems (27.90%) still solvable by old solutions
- **blocksworld**: ⚠️ 1,626 problems (42.73%) still solvable by old solutions

---

## Summary

### Total Problems by Directory

| Directory | Total Problems |
|-----------|----------------|
| all_problems3 | 23018 (blocksworld: 4005, delivery: 1311, ferry: 5000, grippers: 5000, spanner: 2892, grid: 2810) |
| all_problems3/testing | 4763 (blocksworld: 151, delivery: 1311, ferry: 200, spanner: 108, grippers: 183, grid: 2810) |
| sft_500 | 2000 |
| sft_500_new | 3000 (blocksworld: 500, delivery: 500, ferry: 500, spanner: 500, grippers: 500, grid: 500) |
| grpo_500 | 3000 (blocksworld: 500, delivery: 500, ferry: 500, spanner: 500, grippers: 500, grid: 500) |
| testing_problem50 | 300 (blocksworld: 50, delivery: 50, ferry: 50, spanner: 50, grippers: 50, grid: 50) |

### Problem Count Distribution by Scenario

| Scenario | all_problems3 | all_problems3/testing | sft_500 | sft_500_new | grpo_500 | testing_problem50 |
|----------|---------------|----------------------|---------|-------------|----------|-------------------|
| blocksworld | 4005 | 151 | 500 | 500 | 500 | 50 |
| delivery | 1311 | 1311 | 0 | 500 | 500 | 50 |
| ferry | 5000 | 200 | 500 | 500 | 500 | 50 |
| grid | 2810 | 2810 | 0 | 500 | 500 | 50 |
| grippers | 5000 | 183 | 500 | 500 | 500 | 50 |
| spanner | 2892 | 108 | 500 | 500 | 500 | 50 |

## Final Validation and Statistics Report

Generated: 2025-12-05

This report contains the final validation and statistics results for four main scenarios (blocksworld, ferry, spanner, grippers).

### 1. Solution Validity Verification

#### 1.1 sft_500_new Dataset Validation

| Scenario | Total Problems | Valid Solutions | Invalid Solutions | Validity Rate |
|----------|----------------|-----------------|-------------------|---------------|
| blocksworld | 500 | 500 | 0 | 100.00% |
| ferry | 500 | 500 | 0 | 100.00% |
| spanner | 500 | 500 | 0 | 100.00% |
| grippers | 500 | 500 | 0 | 100.00% |

**Conclusion**: ✅ All solutions in `sft_500_new` dataset are 100% valid for all scenarios.

#### 1.2 all_problems3/testing Dataset Validation

| Scenario | Total Problems | Valid Solutions | Invalid Solutions | Validity Rate |
|----------|----------------|-----------------|-------------------|---------------|
| blocksworld | 151 | 151 | 0 | 100.00% |
| ferry | 200 | 200 | 0 | 100.00% |
| spanner | 108 | 108 | 0 | 100.00% |
| grippers | 183 | 183 | 0 | 100.00% |

**Conclusion**: ✅ All solutions in `all_problems3/testing` dataset are 100% valid for all scenarios.

### 2. sft_500_new and sft_500 Overlap Statistics

| Scenario | sft_500_new | sft_500 | Overlapping Problems | Overlap Rate | Union Problems |
|----------|-------------|---------|----------------------|--------------|----------------|
| blocksworld | 500 | 500 | 228 | 45.6% | 772 |
| ferry | 500 | 500 | 125 | 25.0% | 875 |
| spanner | 500 | 500 | 73 | 14.6% | 927 |
| grippers | 500 | 500 | 135 | 27.0% | 865 |

**Notes**: 
- Overlap Rate = (Overlapping Problems / sft_500_new Total) × 100%
- `sft_500_new` dataset prioritizes problems that cannot be solved by old solutions (`all_problems/training`), resulting in lower overlap with `sft_500`
- spanner has the lowest overlap rate (14.6%), indicating the constraints are most effective for this scenario

### 3. Dataset Problem Count and Distribution Statistics

#### 3.1 all_problems3/testing Dataset

##### blocksworld
- **Total problems**: 151

| Configuration (ops, n) | Problem Count |
|------------------------|---------------|
| (3, 3) | 7 |
| (3, 4) | 13 |
| (3, 5) | 16 |
| (3, 6) | 41 |
| (4, 4) | 9 |
| (4, 5) | 23 |
| (4, 6) | 42 |

##### ferry
- **Total problems**: 200

| Configuration (l, c) | Problem Count |
|----------------------|---------------|
| (3, 2) | 2 |
| (3, 3) | 26 |
| (4, 2) | 10 |
| (4, 3) | 51 |
| (5, 2) | 16 |
| (5, 3) | 36 |
| (6, 2) | 20 |
| (6, 3) | 39 |

##### spanner
- **Total problems**: 108

| Configuration (s, n, l) | Problem Count |
|-------------------------|---------------|
| (2, 2, 3) | 25 |
| (3, 2, 4) | 44 |
| (3, 3, 4) | 33 |
| (4, 3, 4) | 6 |

##### grippers
- **Total problems**: 183

| Configuration (n, r, o) | Problem Count |
|-------------------------|---------------|
| (1, 3, 3) | 3 |
| (1, 4, 3) | 25 |
| (2, 3, 2) | 2 |
| (2, 3, 3) | 38 |
| (2, 4, 3) | 54 |
| (2, 4, 4) | 61 |

#### 3.2 testing_problem50 Dataset

##### blocksworld
- **Total problems**: 50

| Configuration (ops, n) | Problem Count |
|------------------------|---------------|
| (3, 3) | 7 |
| (3, 4) | 7 |
| (3, 5) | 3 |
| (3, 6) | 7 |
| (4, 4) | 7 |
| (4, 5) | 10 |
| (4, 6) | 9 |

##### ferry
- **Total problems**: 50

| Configuration (l, c) | Problem Count |
|----------------------|---------------|
| (3, 2) | 2 |
| (3, 3) | 11 |
| (4, 2) | 10 |
| (4, 3) | 3 |
| (5, 2) | 12 |
| (6, 2) | 1 |
| (6, 3) | 11 |

##### spanner
- **Total problems**: 50

| Configuration (s, n, l) | Problem Count |
|-------------------------|---------------|
| (2, 2, 3) | 17 |
| (3, 2, 4) | 8 |
| (3, 3, 4) | 9 |
| (4, 3, 4) | 16 |

##### grippers
- **Total problems**: 50

| Configuration (n, r, o) | Problem Count |
|-------------------------|---------------|
| (1, 3, 3) | 3 |
| (1, 4, 3) | 22 |
| (2, 3, 2) | 2 |
| (2, 3, 3) | 20 |
| (2, 4, 3) | 3 |

#### 3.3 sft_500_new Dataset Distribution

##### blocksworld
- **Total problems**: 500

| Configuration (ops, n) | Problem Count |
|------------------------|---------------|
| (3, 3) | 20 |
| (3, 4) | 76 |
| (3, 5) | 84 |
| (3, 6) | 83 |
| (4, 4) | 57 |
| (4, 5) | 86 |
| (4, 6) | 94 |

##### ferry
- **Total problems**: 500

| Configuration (l, c) | Problem Count |
|----------------------|---------------|
| (3, 2) | 48 |
| (3, 3) | 66 |
| (4, 2) | 63 |
| (4, 3) | 65 |
| (5, 2) | 63 |
| (5, 3) | 65 |
| (6, 2) | 63 |
| (6, 3) | 67 |

##### spanner
- **Total problems**: 500

| Configuration (s, n, l) | Problem Count |
|-------------------------|---------------|
| (2, 2, 3) | 52 |
| (3, 2, 4) | 73 |
| (3, 3, 4) | 273 |
| (4, 3, 4) | 102 |

##### grippers
- **Total problems**: 500

| Configuration (n, r, o) | Problem Count |
|-------------------------|---------------|
| (1, 3, 3) | 84 |
| (1, 4, 3) | 91 |
| (2, 3, 2) | 23 |
| (2, 3, 3) | 88 |
| (2, 4, 3) | 104 |
| (2, 4, 4) | 110 |

### 4. grpo_500 Dataset Validation

#### 4.1 Solution Completeness Verification

| Scenario | Total Problems | With Solutions | Without Solutions | Completeness Rate |
|----------|----------------|----------------|-------------------|-------------------|
| blocksworld | 500 | 500 | 0 | 100.00% |
| ferry | 500 | 500 | 0 | 100.00% |
| spanner | 500 | 500 | 0 | 100.00% |
| grippers | 500 | 500 | 0 | 100.00% |

**Conclusion**: ✅ All problems in `grpo_500` dataset have corresponding solutions for all scenarios.

#### 4.2 Solution Validity Verification

| Scenario | Valid Solutions | Invalid Solutions | Validity Rate |
|----------|-----------------|-------------------|---------------|
| blocksworld | 500 | 0 | 100.00% |
| ferry | 500 | 0 | 100.00% |
| spanner | 500 | 0 | 100.00% |
| grippers | 500 | 0 | 100.00% |

**Conclusion**: ✅ All solutions in `grpo_500` dataset are 100% valid for all scenarios.

#### 4.3 grpo_500 and sft_500_new Overlap Statistics

| Scenario | grpo_500 | sft_500_new | Overlapping Problems | Overlap Rate (grpo) | Overlap Rate (sft) |
|----------|----------|-------------|----------------------|---------------------|--------------------|
| blocksworld | 500 | 500 | 195 | 39.0% | 39.0% |
| delivery | 500 | 500 | 0 | 0.0% | 0.0% |
| ferry | 500 | 500 | 80 | 16.0% | 16.0% |
| spanner | 500 | 500 | 137 | 27.4% | 27.4% |
| grippers | 500 | 500 | 122 | 24.4% | 24.4% |

**Notes**: 
- Overlap between `grpo_500` and `sft_500_new` ranges from 0.0% to 39.0%
- delivery and grid have the lowest overlap rate (0.0%), indicating the largest difference in problem selection strategies between the two datasets, with no overlap
- ferry has an overlap rate of 16.0%, indicating a relatively large difference in problem selection strategies
- blocksworld has the highest overlap rate (39.0%), indicating more common selections between the two datasets for this scenario

### 5. Conclusions

1. **Solution Validity**: ✅ All datasets (`sft_500_new`, `all_problems3/testing`, `grpo_500`) have 100% valid solutions
2. **Dataset Completeness**: ✅ All problems in all datasets have corresponding solutions
3. **Dataset Differences**: 
   - Overlap between `sft_500_new` and `sft_500` ranges from 14.6% to 45.6%, indicating `sft_500_new` successfully selected more problems that cannot be solved by old solutions
   - Overlap between `grpo_500` and `sft_500_new` ranges from 16.0% to 39.0% (0% for delivery), indicating partial overlap while maintaining relative independence
   - delivery's `grpo_500` has no overlap with `testing_problem50` and `sft_500_new`
4. **Data Distribution**: All datasets maintain a relatively uniform difficulty distribution
5. **Delivery Project**: All 1311 problems cannot be solved by old solutions, indicating highly effective PDDL3 constraints

