A worker is in a shed, containing a number of spanners, and at a gate some
distance away there are a number of nuts that must be tightened. Crucially, once
the worker has left the shed they cannot return. Also, the spanners are fragile,
so once used to tighten a nut they break, and then cannot be used to tighten
another. The goal is planning to pick-up the spanners and tighten the nuts. This
is an interesting domain for learning, as it has a directed search space, and is
challenging for planners employing an 'ignore delete lists' relaxation.

Origin: Created for IPC 2011 by Amanda Coles, Andrew Coles, Maria Fox and Derek Long.

## 问题统计
### all_problems3/testing
- **总问题数**: 195

#### 按扳手数量分布
| 扳手数 (s) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 25 | 12.8% |
| 3 | 152 | 77.9% |
| 4 | 18 | 9.2% |

#### 按螺母数量分布
| 螺母数 (n) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 103 | 52.8% |
| 3 | 92 | 47.2% |

#### 按位置数量分布
| 位置数 (l) | 问题数 | 占比 |
|------------|--------|------|
| 3 | 25 | 12.8% |
| 4 | 170 | 87.2% |

#### 按完整配置分布
| 扳手数 (s) | 螺母数 (n) | 位置数 (l) | 问题数 | 占比 |
|------------|------------|------------|--------|------|
| 3 | 2 | 4 | 78 | 40.0% |
| 3 | 3 | 4 | 74 | 37.9% |
| 2 | 2 | 3 | 25 | 12.8% |
| 4 | 3 | 4 | 18 | 9.2% |

### sft_500
- **总问题数**: 500

#### 按扳手数量分布
| 扳手数 (s) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 324 | 64.8% |
| 3 | 176 | 35.2% |

#### 按螺母数量分布
| 螺母数 (n) | 问题数 | 占比 |
|------------|--------|------|
| 2 | 500 | 100.0% |

#### 按位置数量分布
| 位置数 (l) | 问题数 | 占比 |
|------------|--------|------|
| 3 | 324 | 64.8% |
| 4 | 176 | 35.2% |

#### 按完整配置分布
| 扳手数 (s) | 螺母数 (n) | 位置数 (l) | 问题数 | 占比 |
|------------|------------|------------|--------|------|
| 2 | 2 | 3 | 324 | 64.8% |
| 3 | 2 | 4 | 176 | 35.2% |

### 难度分析
问题的难度主要由以下因素决定：
1. **扳手数量 (s)**: 扳手越多，需要管理的资源越多
2. **螺母数量 (n)**: 螺母越多，需要完成的任务越多
3. **位置数量 (l)**: 位置越多，搜索空间越大
