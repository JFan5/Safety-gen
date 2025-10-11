# Logistics Problem Generator

这个Python脚本用于生成不同参数的logistics问题，支持多种配置和批量生成。

## 功能特性

- **支持多种生成模式**：
  - IPC-2000风格实例
  - IPC-1998风格实例
  - 自定义配置实例
  - 随机配置实例
  - 单个实例生成

- **灵活的参数配置**：
  - 城市数量 (cities)
  - 城市大小 (city_size)
  - 包裹数量 (packages)
  - 飞机数量 (airplanes)
  - 卡车数量 (trucks，可选)
  - 随机种子 (seed，可选)

- **批量生成**：支持一次生成多个不同配置的问题

- **分类存储**：按生成类型自动创建子目录

## 使用方法

### 基本用法

```bash
# 生成自定义配置的实例（默认）
python generate_problems.py

# 生成IPC-2000风格的实例
python generate_problems.py --type ipc00

# 生成IPC-1998风格的实例
python generate_problems.py --type ipc98

# 生成随机配置的实例
python generate_problems.py --type random

# 生成指定数量的随机实例
python generate_problems.py --type random --num-random 100
```

### 生成单个实例

```bash
# 生成单个实例
python generate_problems.py --type single --cities 2 --city-size 3 --packages 4 --airplanes 1 --seed 123

# 指定输出文件
python generate_problems.py --type single --cities 3 --city-size 4 --packages 6 --airplanes 2 --output my_problem.pddl

# 包含卡车数量
python generate_problems.py --type single --cities 2 --city-size 3 --packages 4 --airplanes 1 --trucks 3
```

## 参数说明

### 必需参数
- `--cities`: 城市数量（最小1）
- `--city-size`: 城市大小，即每个城市内的位置数量（最小1）
- `--packages`: 包裹数量（最小1）
- `--airplanes`: 飞机数量（最小1）

### 可选参数
- `--trucks`: 卡车数量（可选，默认为城市数量）
- `--seed`: 随机种子（可选，用于重现性）
- `--output`: 输出文件路径（仅用于单个实例）
- `--num-random`: 随机实例数量（默认50）

### 生成类型
- `ipc00`: IPC-2000风格实例
- `ipc98`: IPC-1998风格实例
- `custom`: 自定义配置实例
- `random`: 随机配置实例
- `single`: 单个实例

## 输出结构

生成的问题文件将按以下结构组织：

```
logistics/
├── problems_ipc00/          # IPC-2000风格实例
│   ├── logistics-c2-s3-p4-a1-r123.pddl
│   ├── logistics-c2-s3-p6-a2-r456.pddl
│   └── ...
├── problems_ipc98/          # IPC-1998风格实例
│   ├── logistics-c2-s3-p6-a2-r789.pddl
│   ├── logistics-c3-s3-p9-a3-r101.pddl
│   └── ...
├── problems_custom/         # 自定义配置实例
│   ├── logistics-c1-s2-p2-a1-r202.pddl
│   ├── logistics-c2-s3-p4-a1-r303.pddl
│   └── ...
└── problems_random/         # 随机配置实例
    ├── logistics-c3-s4-p8-a2-t4-r404.pddl
    ├── logistics-c5-s3-p12-a3-r505.pddl
    └── ...
```

## 实例配置说明

### IPC-2000风格实例
根据IPC-2000竞赛的实例特点生成：
- **小规模**: 2个城市，4-8个包裹，1-2架飞机
- **中等规模**: 3个城市，6-10个包裹，1-2架飞机
- **大规模**: 5个城市，10-15个包裹，1-2架飞机

### IPC-1998风格实例
根据IPC-1998竞赛的实例特点生成：
- **线性扩展**: 城市数量从2到8线性增长
- **包裹数量**: 与城市数量成比例
- **飞机数量**: 最多5架，与城市数量相关
- **特殊实例**: 包含更多卡车的变体

### 自定义配置实例
包含各种规模的测试实例：
- **小规模**: 1-2个城市，2-4个包裹
- **中等规模**: 3-4个城市，5-8个包裹
- **参数组合**: 覆盖各种合理的参数组合

### 随机配置实例
完全随机生成的实例：
- **城市数量**: 1-8个
- **城市大小**: 2-6个位置
- **包裹数量**: 2-20个（受城市容量限制）
- **飞机数量**: 1-5架（不超过城市数量）
- **卡车数量**: 随机决定是否指定

## 文件名格式

生成的文件名遵循以下格式：
```
logistics-c{cities}-s{city_size}-p{packages}-a{airplanes}[-t{trucks}][-r{seed}].pddl
```

例如：
- `logistics-c2-s3-p4-a1.pddl`: 2个城市，城市大小3，4个包裹，1架飞机
- `logistics-c3-s4-p6-a2-t4-r123.pddl`: 3个城市，城市大小4，6个包裹，2架飞机，4辆卡车，种子123

## 约束条件

生成器会自动处理以下约束：
- 飞机数量不能超过城市数量
- 包裹数量不能超过所有位置的总数
- 卡车数量至少等于城市数量
- 每个城市至少有一个机场位置

## 错误处理

脚本包含完善的错误处理机制：
- 参数验证：检查必需参数是否提供
- 约束检查：确保参数组合合理
- 异常捕获：处理生成过程中的错误
- 详细日志：提供生成进度和错误信息

## 示例输出

运行脚本后，您将看到类似以下的输出：

```
生成自定义配置的实例...
生成问题 1/24: logistics-c1-s2-p2-a1-r123.pddl
生成问题 2/24: logistics-c1-s2-p3-a1-r456.pddl
...
生成问题 24/24: logistics-c4-s4-p8-a3-r789.pddl

总共生成了 24 个问题文件
输出目录: problems_custom
```

## 与原始生成器的关系

这个Python脚本是对原始C语言生成器(`./logistics`)的封装，提供了：
- 更友好的Python接口
- 批量生成功能
- 预设配置模板
- 更好的错误处理
- 自动文件管理

原始生成器的所有功能都得到保留，同时增加了更多便利功能。
