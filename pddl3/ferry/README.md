## Ferry

*   Origin: ?. Taken from the [IPP][6] domain collection.
*   Adaptions: Sail operator modified so that moves can only happen
    between different locations.
*   Description: Untyped STRIPS domain. Transport a number of cars from
    their start- to their goal-locations, using a ferry. Each location is
    accessible from each other location, cars can be debarked or boarded,
    the ferry can always carry only one car at a time.
*   Parameters:
    *   -l number of locations
    *   -c number of cars
*   Generation: randomly distribute the start and goal locations of all
    cars over the locations.

## 问题统计
### all_problems3/testing
- **总问题数**: 200

#### 按位置数量分布
| 位置数 (l) | 问题数 | 占比 |
|------------|--------|------|
| 3 | 28 | 14.0% |
| 4 | 61 | 30.5% |
| 5 | 52 | 26.0% |
| 6 | 59 | 29.5% |

#### 按汽车数量分布
| 汽车数 (c) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 48 | 24.0% |
| 3 | 152 | 76.0% |

#### 按完整配置分布
| 位置数 (l) | 汽车数 (c) | 问题数 | 占比 |
|------------|------------|--------|------|
| 4 | 3 | 51 | 25.5% |
| 6 | 3 | 39 | 19.5% |
| 5 | 3 | 36 | 18.0% |
| 3 | 3 | 26 | 13.0% |
| 6 | 2 | 20 | 10.0% |
| 5 | 2 | 16 | 8.0% |
| 4 | 2 | 10 | 5.0% |
| 3 | 2 | 2 | 1.0% |

### sft_500
- **总问题数**: 500

#### 按位置数量分布
| 位置数 (l) | 问题数 | 占比 |
|------------|--------|------|
| 3 | 478 | 95.6% |
| 4 | 22 | 4.4% |

#### 按汽车数量分布
| 汽车数 (c) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 70 | 14.0% |
| 3 | 430 | 86.0% |

#### 按完整配置分布
| 位置数 (l) | 汽车数 (c) | 问题数 | 占比 |
|------------|------------|--------|------|
| 3 | 3 | 430 | 86.0% |
| 3 | 2 | 48 | 9.6% |
| 4 | 2 | 22 | 4.4% |

### 难度分析
问题的难度主要由以下因素决定：
1. **位置数量 (l)**: 位置越多，搜索空间越大
2. **汽车数量 (c)**: 汽车越多，需要运输的任务越多
