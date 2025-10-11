### Gripper scenario: parameterized problem generation

This folder contains the `gripper` STRIPS domain and an enhanced generator that can produce a variety of problem instances beyond the classic "move N balls from rooma to roomb" setup.

#### Binary options (gripper)

- **-n <num>**: number of balls (>=1)
- **-R <rooms>**: number of rooms (>=1; default 2)
- **-cap <1|2>**: gripper capacity (default 2). If 1, only `left` exists.
- **-seed <uint>**: RNG seed (default: time-based). Required for reproducibility when using random distributions.
- **-init <rand|spec>**: initial ball distribution across rooms
  - `rand`: randomly assign each ball to one of the R rooms
  - `rK:v,...`: explicit counts per room, e.g., `r1:3,r2:2,r4:1` (sum must equal `-n`)
  - omitted: legacy default, all balls in `rooma`
- **-goal <all@rK|rand|spec>**: goal distribution
  - `all@rK`: all balls must be at room K (1..R)
  - `rand`: randomly distribute target locations across rooms
  - `rK:v,...`: explicit counts per room, sum equals `-n`
  - omitted: legacy default, all balls to `roomb` (or `rooma` if R=1)

Build the binary in this folder with:

```bash
make
```

#### Python wrapper: generate_gripper_problems.py

Use the wrapper to generate one or multiple problem files and have filenames include the generation parameters.

```bash
python3 generate_gripper_problems.py -n 10 --build
```

Key arguments:

- **-n, --balls**: number of balls (required)
- **-R, --rooms**: number of rooms (default 2)
- **--cap**: capacity/gripper count (1 or 2; default 2)
- **--init**: `rand` or a spec like `r1:3,r2:2` (omit for default)
- **--goal**: `all@rK`, `rand`, or spec like `r2:5,r3:5` (omit for default)
- **--seed**: seed for reproducibility. If omitted and `rand` is used, seeds auto-vary per instance
- **-c, --count**: number of instances to generate (default 1)
- **-o, --out-dir**: output directory (default `training_problems`)
- **--prefix**: filename prefix (default `gripper`)
- **--start-index**: starting index when generating multiple instances (default 1)
- **--build**: build binary automatically if missing
- **--dry-run**: print planned filenames and commands without writing

#### Filename convention

Each generated file is named using a parameter signature so you can infer the configuration from the name. The pattern is:

```
<prefix>_n<N>_R<R>_cap<C>_init-<INIT>_goal-<GOAL>[_seed<SEED>][_i####].pddl
```

- `<INIT>` and `<GOAL>` are sanitized (commas/colons replaced) to be path-safe. If not provided, they are `init-default` / `goal-default`.
- `_seed<SEED>` appears when a seed is explicitly set or auto-assigned because randomness is used.
- `_i####` is added when multiple instances are generated (e.g., `_i0001`).

#### Examples

1) Legacy instance, 10 balls to `roomb` (default goal):

```bash
python3 generate_gripper_problems.py -n 10 --build
```

Produces a file like:

```
training_problems/gripper_n10_R2_cap2_init-default_goal-default.pddl
```

2) Randomized start and goal with 3 rooms, 5 instances:

```bash
python3 generate_gripper_problems.py -n 12 -R 3 --init rand --goal rand -c 5 -o training_problems --prefix gripper --build
```

Produces files like:

```
training_problems/gripper_n12_R3_cap2_init-rand_goal-rand_seed123456789_i0001.pddl
...
training_problems/gripper_n12_R3_cap2_init-rand_goal-rand_seed123456793_i0005.pddl
```

3) Explicit distributions with one gripper and a fixed seed:

```bash
python3 generate_gripper_problems.py -n 8 -R 3 --cap 1 --init r1:3,r2:5 --goal all@r3 --seed 42
```

Produces:

```
training_problems/gripper_n8_R3_cap1_init-r1-3-r2-5_goal-all@r3_seed42.pddl
```

#### Notes

- The domain file is `domain.pddl`. The problems produced by `gripper` are compatible with `:domain gripper-strips`.
- When `--count > 1` and `--seed` is provided, seeds are incremented by +i to avoid duplicates.
- When randomness is used (`--init rand` or `--goal rand`) and `--seed` is omitted, the wrapper assigns a distinct time-based seed per instance and includes it in the filename.


