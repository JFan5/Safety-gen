A generator for the Delivery domain.

How to use:
- Install uv (https://docs.astral.sh/uv/#installation)
- Run like the following:
```bash
uv run generate.py --grid_size_splits=5,7,9 --max_nr_packages=3 --nr_instances_per_setup=5
```

The above example will generate training instances with grid sizes of 2-5, validation instances with grid sizes of 6-7, and test instances with grid sizes of 8-9. For each grid size there will be 5 instances with 1-3 packages, for a total of 5 * 3 = 15 instances per grid size. The generated instances will be saved in the `output` directory. Currently, only square grids are supported.

Description of the parameters:
- `grid_size_splits`: Specifies the maximum size of the grid in each of the dataset splits. The grid size splits for the delivery domain. It should be a comma-separated list of integers.
- `max_nr_packages`: The maximum number of packages to be delivered. The generator will create instances with [1, max_nr_packages] packages, for each integer in the interval.
- `nr_instances_per_setup`: The number of instances to be generated for each setup.

## Ferry-like unique problem generation (simplest-first)

We also provide a unique-problem generator and a shell script that prioritizes simplest instances first, similar to the `ferry` setup.

### Quick start

```bash
# Trucks-style: predefined simplest-first tiers (produces ~1000 problems)
./generate_delivery_training_unique.sh

# Manual single-tier generation
./generate_delivery_unique.sh ./all_problems 2 1 100
```

This script iterates tiers in increasing difficulty by `(size, packages)`
from `size=MIN_SIZE..MAX_SIZE` and `packages=1..MAX_PACKAGES`,
splitting the total target approximately evenly across tiers. Uniqueness is
enforced by the tuple `(size, packages, truck_cell, sorted(init package cells), sorted(goal package cells))`.

### Standalone generator

You can also run the Python generator directly for a single tier:

```bash
python3 gen_unique_delivery.py \
  --count 100 \
  --target-dir all_problems \
  --size 2 \
  --packages 1 \
  --seed 20250101 \
  --domain domain.pddl
```

Output files are written under the chosen target directory with names like
`delivery-s2-p1-seed1234567.pddl`.

