#!/usr/bin/env python3
"""Generate training problems for all PDDL scenarios.

This script creates training_problems directories for each scenario and generates
approximately 1000 problems per scenario using their respective generators.

The script handles different types of generators:
- Python-based generators
- C/C++ compiled generators  
- Special cases with custom build processes
- Scenarios already covered by existing batch scripts
"""

from __future__ import annotations

import argparse
import os
import random
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Dict, List, Optional, Tuple

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SCENARIOS_ROOT = PROJECT_ROOT / "scenarios"

# Scenarios that are handled by existing batch scripts
BATCH_SCRIPT_SCENARIOS = {"blocksworld", "delivery", "logistics"}

# Scenarios that already have configured generators in generate_scenarios_testing.py
CONFIGURED_SCENARIOS = {"agricola", "barman", "childsnack"}

# Scenarios to exclude (those without generators or problematic ones)
EXCLUDED_SCENARIOS = {
    "data",  # No generators
    # Add more as needed
}


@dataclass
class GeneratorConfig:
    """Configuration for a scenario's problem generator."""
    
    name: str
    generator_type: str  # "python", "cpp", "special", "batch_script"
    command_builder: Optional[Callable[[int, random.Random], List[str]]] = None
    build_commands: Optional[List[List[str]]] = None
    working_dir: Optional[Path] = None
    notes: str = ""


class TrainingProblemGenerator:
    """Main class for generating training problems across all scenarios."""
    
    def __init__(self, target_name: str = "training_problems", count: int = 1000, seed: int = 20240924):
        self.target_name = target_name
        self.count = count
        self.seed = seed
        self.python_executable = sys.executable
        self.rng = random.Random(seed)
        
        # Registry of scenario generators
        self.generator_registry: Dict[str, GeneratorConfig] = {}
        self._setup_generators()
    
    def _setup_generators(self) -> None:
        """Set up the generator registry with all supported scenarios."""
        
        # Scenarios handled by existing batch scripts
        for scenario in BATCH_SCRIPT_SCENARIOS:
            self.generator_registry[scenario] = GeneratorConfig(
                name=scenario,
                generator_type="batch_script",
                notes=f"Handled by generate_testing_problems_batch.py"
            )
        
        # Scenarios with configured generators
        for scenario in CONFIGURED_SCENARIOS:
            self.generator_registry[scenario] = GeneratorConfig(
                name=scenario,
                generator_type="configured",
                notes=f"Handled by generate_scenarios_testing.py"
            )
        
        # Python-based generators
        python_generators = {
            "cavediving": self._cavediving_command_builder,
            "elevators": self._elevators_command_builder,
            "floortile": self._floortile_command_builder,
            "grid": self._grid_command_builder,
            "hiking": self._hiking_command_builder,
            "minigrid": self._minigrid_command_builder,
            "nurikabe": self._nurikabe_command_builder,
            "openstacks": self._openstacks_command_builder,
            "scanalyzer": self._scanalyzer_command_builder,
            "matchcellar": self._matchcellar_command_builder,
            "woodworking": self._woodworking_command_builder,
            "citycar": self._citycar_command_builder,
            "pegsol": self._pegsol_command_builder,
            "snake": self._snake_command_builder,
            "spanner": self._spanner_command_builder,
            "spider": self._spider_command_builder,
            "agricola": self._agricola_command_builder,
            "barman": self._barman_command_builder,
            "childsnack": self._childsnack_command_builder,
            "data-network": self._data_network_command_builder,
            "sokoban": self._sokoban_command_builder,
            "tetris": self._tetris_command_builder,
            "transport": self._transport_command_builder,
        }
        
        for scenario, builder in python_generators.items():
            self.generator_registry[scenario] = GeneratorConfig(
                name=scenario,
                generator_type="python",
                command_builder=builder,
                notes="Python-based generator"
            )
        
        # C/C++ generators that need compilation
        cpp_generators = {
            "assembly": (["make"], self._assembly_command_builder),
            "briefcaseworld": (["make"], self._briefcaseworld_command_builder),
            "depots": (["make"], self._depots_command_builder),
            "driverlog": (["make"], self._driverlog_command_builder),
            "ferry": (["make"], self._ferry_command_builder),
            "freecell": (["make"], self._freecell_command_builder),
            "fridge": (["make"], self._fridge_command_builder),
            "goldminer": (["make"], self._goldminer_command_builder),
            "gripper": (["make"], self._gripper_command_builder),
            "grippers": (["make"], self._grippers_command_builder),
            "hanoi": (["make"], self._hanoi_command_builder),
            "maintenance": (["make"], self._maintenance_command_builder),
            "miconic": (["make"], self._miconic_command_builder),
            "miconic-fulladl": (["make"], self._miconic_command_builder),
            "miconic-simpleadl": (["make"], self._miconic_command_builder),
            "movie": (["make"], self._movie_command_builder),
            "mprime": (["make"], self._mprime_command_builder),
            "mystery": (["make"], self._mystery_command_builder),
            "npuzzle": (["make"], self._npuzzle_command_builder),
            "pathways": (["make"], self._pathways_command_builder),
            "rovers": (["make"], self._rovers_command_builder),
            "satellite": (["make"], self._satellite_command_builder),
            "zenotravel": (["make", "ztravel"], self._zenotravel_command_builder),
            "schedule": (["make"], self._schedule_command_builder),
            "storage": (["make"], self._storage_command_builder),
            "tpp": (["make"], self._tpp_command_builder),
            "trucks": (["make"], self._trucks_command_builder),
            "tsp": (["make"], self._tsp_command_builder),
            "turnandopen": (["make"], self._turnandopen_command_builder),
            "tyreworld": (["make"], self._tyreworld_command_builder),
            "visitall": (["make"], self._visitall_command_builder),
        }
        
        for scenario, (build_cmd, builder) in cpp_generators.items():
            self.generator_registry[scenario] = GeneratorConfig(
                name=scenario,
                generator_type="cpp",
                command_builder=builder,
                build_commands=[build_cmd],
                notes="C/C++ generator requiring compilation"
            )
        
        # Special cases
        self.generator_registry["nomystery"] = GeneratorConfig(
            name="nomystery",
            generator_type="special",
            build_commands=[["cmake", "."], ["make"]],
            command_builder=self._nomystery_command_builder,
            notes="CMake-based C++ generator"
        )
        
        self.generator_registry["crewplanning"] = GeneratorConfig(
            name="crewplanning",
            generator_type="special",
            build_commands=[["make"]],
            command_builder=self._crewplanning_command_builder,
            notes="OCaml-based generator"
        )
        
        self.generator_registry["parking"] = GeneratorConfig(
            name="parking",
            generator_type="special",
            command_builder=self._parking_command_builder,
            notes="Perl-based generator"
        )
        
        self.generator_registry["termes"] = GeneratorConfig(
            name="termes",
            generator_type="special",
            command_builder=self._termes_command_builder,
            notes="Multiple Python generators available"
        )
        
        self.generator_registry["tidybot"] = GeneratorConfig(
            name="tidybot",
            generator_type="special",
            command_builder=self._tidybot_command_builder,
            notes="Java-based generator requiring Java environment"
        )
    
    def _run_command(self, cmd: List[str], cwd: Path, capture_output: bool = True) -> subprocess.CompletedProcess:
        """Run a command and return the result."""
        try:
            return subprocess.run(
                cmd,
                cwd=cwd,
                check=True,
                capture_output=capture_output,
                text=True
            )
        except subprocess.CalledProcessError as exc:
            raise RuntimeError(f"Command failed in {cwd}: {' '.join(cmd)} (exit {exc.returncode})") from exc
    
    def _build_scenario(self, config: GeneratorConfig, scenario_root: Path) -> None:
        """Build a scenario if it requires compilation."""
        if not config.build_commands:
            return
        
        print(f"  Building {config.name}...")
        for cmd in config.build_commands:
            self._run_command(cmd, scenario_root)
    
    def _generate_python_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems using a Python generator."""
        # Special handling for elevators unique generator
        if config.name == "elevators":
            self._generate_elevators_unique_problems(config, scenario_root, target_dir)
            return
        
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            
            # Add python executable to the command if not present
            # Skip for commands that already specify the executable (like ruby, perl)
            if not cmd[0].endswith("python") and not cmd[0].endswith("python3") and not cmd[0] in ["ruby", "perl"]:
                cmd = [self.python_executable] + cmd
            
            result = self._run_command(cmd, scenario_root)
            outfile.write_text(result.stdout)
    
    def _generate_elevators_unique_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate unique elevator problems using the dedicated unique generator.

        We pass the testing directory as an exclusion to guarantee no overlap.
        """
        # Determine known testing directories to exclude
        exclude_dirs: List[str] = []
        # Standard testing dir name(s) used in this repo
        for test_dir_name in ["testing_problems", "testing_problems_generated"]:
            test_dir_path = scenario_root / test_dir_name
            if test_dir_path.exists():
                exclude_dirs.append(str(test_dir_path))

        # Run unique generator writing directly into target_dir, excluding testing dirs
        cmd = [self.python_executable, "gen_unique.py", "--count", str(self.count), "--target-dir", str(target_dir)]
        for ex in exclude_dirs:
            cmd += ["--exclude-dir", ex]

        print(f"  Running unique generator for elevators... (exclude {len(exclude_dirs)} dirs)")
        # Ensure target_dir exists; the generator will write into it
        target_dir.mkdir(parents=True, exist_ok=True)
        self._run_command(cmd, scenario_root)
    
    def _generate_cpp_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems using a C/C++ generator."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            
            # For C/C++ generators, we need to redirect output
            cmd_with_output = cmd + [">", str(outfile)]
            cmd_str = " ".join(str(arg) for arg in cmd_with_output)
            
            # Use shell=True for output redirection
            subprocess.run(cmd_str, cwd=scenario_root, shell=True, check=True)
    
    def _generate_batch_script_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems using existing batch scripts."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        
        # Use the existing batch script
        batch_script = PROJECT_ROOT / "scripts" / "generate_testing_problems_batch.py"
        cmd = [
            self.python_executable,
            str(batch_script),
            "--scenarios", config.name,
            "--count", str(self.count),
            "--target-name", self.target_name
        ]
        
        self._run_command(cmd, PROJECT_ROOT)
    
    def _generate_configured_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems using the configured generators."""
        # Use the existing scenarios testing script
        scenarios_script = PROJECT_ROOT / "scripts" / "generate_scenarios_testing.py"
        cmd = [
            self.python_executable,
            str(scenarios_script),
            "--include", config.name,
            "--count", str(self.count),
            "--target-name", self.target_name
        ]
        
        self._run_command(cmd, PROJECT_ROOT)
    
    def generate_scenario_problems(self, scenario_name: str) -> bool:
        """Generate training problems for a specific scenario."""
        scenario_root = SCENARIOS_ROOT / scenario_name
        if not scenario_root.exists():
            print(f"  ERROR: Scenario directory not found: {scenario_root}")
            return False
        
        config = self.generator_registry.get(scenario_name)
        if not config:
            print(f"  ERROR: No generator configured for scenario: {scenario_name}")
            return False
        
        target_dir = scenario_root / self.target_name
        
        print(f"  Generating {self.count} problems for {scenario_name}...")
        print(f"  Target directory: {target_dir}")
        print(f"  Generator type: {config.generator_type}")
        print(f"  Notes: {config.notes}")
        
        try:
            # Build if necessary
            self._build_scenario(config, scenario_root)
            
            # Remove existing target directory if it exists
            if target_dir.exists():
                shutil.rmtree(target_dir)
            
            # Generate problems based on type
            if config.generator_type == "python":
                self._generate_python_problems(config, scenario_root, target_dir)
            elif config.generator_type == "cpp":
                self._generate_cpp_problems(config, scenario_root, target_dir)
            elif config.generator_type == "batch_script":
                self._generate_batch_script_problems(config, scenario_root, target_dir)
            elif config.generator_type == "configured":
                self._generate_configured_problems(config, scenario_root, target_dir)
            elif config.generator_type == "special":
                # Handle special cases individually
                if scenario_name == "nomystery":
                    self._generate_nomystery_problems(config, scenario_root, target_dir)
                elif scenario_name == "crewplanning":
                    self._generate_crewplanning_problems(config, scenario_root, target_dir)
                elif scenario_name == "parking":
                    self._generate_parking_problems(config, scenario_root, target_dir)
                elif scenario_name == "termes":
                    self._generate_termes_problems(config, scenario_root, target_dir)
                elif scenario_name == "tidybot":
                    self._generate_tidybot_problems(config, scenario_root, target_dir)
            
            # Count generated files
            generated_files = list(target_dir.glob("*.pddl"))
            print(f"  Successfully generated {len(generated_files)} problems")
            return True
            
        except Exception as exc:
            print(f"  ERROR: Failed to generate problems for {scenario_name}: {exc}")
            return False
    
    def generate_all_problems(self, scenarios: Optional[List[str]] = None, exclude: Optional[List[str]] = None) -> None:
        """Generate training problems for all or specified scenarios."""
        if scenarios:
            scenario_list = scenarios
        else:
            # Discover all scenarios
            scenario_list = []
            for entry in sorted(SCENARIOS_ROOT.iterdir()):
                if entry.is_dir() and not entry.name.startswith("."):
                    scenario_list.append(entry.name)
        
        # Apply exclusions
        exclude_set = EXCLUDED_SCENARIOS.copy()
        if exclude:
            exclude_set.update(exclude)
        
        scenario_list = [s for s in scenario_list if s not in exclude_set]
        
        print(f"Generating training problems for {len(scenario_list)} scenarios...")
        print(f"Target directory name: {self.target_name}")
        print(f"Problems per scenario: {self.count}")
        print(f"Random seed: {self.seed}")
        
        successful = 0
        failed = 0
        
        for scenario in scenario_list:
            print(f"\n=== Processing {scenario} ===")
            if self.generate_scenario_problems(scenario):
                successful += 1
            else:
                failed += 1
        
        print(f"\n=== Summary ===")
        print(f"Successfully processed: {successful} scenarios")
        print(f"Failed: {failed} scenarios")
    
    # Command builders for different scenarios
    def _cavediving_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # cavediving generator parameters
        problem_name = f"cavediving-{idx}"
        problem_file = f"problem-{idx}.pddl"
        cave_branches = rng.randint(3, 5)  # Need deeper caves
        objectives = rng.randint(1, cave_branches - 1)  # objectives must be less than cave depth
        seed = rng.randint(1, 1000000)
        return ["generator/generator.py", 
                "-problem_file", problem_file,
                "-problem_name", problem_name,
                "-cave_branches", str(cave_branches),
                "-objectives", str(objectives),
                "-seed", str(seed)]
    
    def _elevators_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Use the unique generator instead of the basic generator
        return ["gen_unique.py"]
    def _floortile_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # floortile generator needs: name, num_rows, num_columns, num_robots, mode_flag, seed
        name = f"floortile-{idx}"
        rows = rng.randint(2, 4)
        cols = rng.randint(2, 4)
        robots = rng.randint(1, 2)
        mode = rng.choice(["seq", "time"])
        seed = rng.randint(1, 1000000)
        return ["floortile-generator.py", name, str(rows), str(cols), str(robots), mode, str(seed)]
    
    def _grid_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        x = rng.randint(3, 8)
        y = rng.randint(3, 8)
        return ["generate.py", str(x), str(y), "--seed", str(rng.randint(1, 1000000))]
    
    def _hiking_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        couples = rng.randint(2, 4)
        cars = couples + rng.randint(1, 2)  # cars should be at least couples + 1
        places = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["generator.py", str(couples), str(cars), str(places), str(seed)]
    
    def _minigrid_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # minigrid generator needs floorplan file and nshapes
        floorplans = ["2Hroom2.fpl", "2Hroom3.fpl", "2Vroom2.fpl", "2Vroom3.fpl", 
                     "3Hroom2.fpl", "3Hroom3.fpl", "3Vroom2.fpl", "3Vroom3.fpl",
                     "4room2.fpl", "4room3.fpl", "9room2.fpl", "9room3.fpl",
                     "room2.fpl", "room4.fpl", "room6.fpl"]
        floorplan = rng.choice(floorplans)
        nshapes = rng.randint(1, 4)
        return ["mini_grid.py", f"floorplans/{floorplan}", str(nshapes), "--seed", str(rng.randint(1, 1000000))]
    
    def _nurikabe_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # nurikabe generator needs: type, pid, width, height, seed, output_format
        width = rng.randint(5, 8)
        height = rng.randint(5, 8)
        seed = rng.randint(1, 1000000)
        pid = rng.randint(1, 1000)
        return ["generate.py", "random", str(pid), str(width), str(height), str(seed), "pddl"]
    
    def _openstacks_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        products = rng.randint(3, 8)
        orders = rng.randint(3, 8)
        density = rng.randint(20, 80)
        return ["generator.py", str(products), str(orders), str(density), "--seed", str(rng.randint(1, 1000000))]
    
    def _scanalyzer_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["generator.py", str(rng.randint(3, 8)), str(rng.randint(1, 1000000))]
    
    def _matchcellar_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["matchcellar.py", str(rng.randint(3, 8))]
    
    def _woodworking_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        wood_factor = rng.randint(1, 3)
        size = rng.randint(2, 5)
        num_machines = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["create_woodworking_instance.py", str(wood_factor), str(size), str(num_machines), str(seed)]
    
    def _citycar_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        rows = rng.randint(3, 6)
        columns = rng.randint(3, 6)
        cars = rng.randint(2, 4)
        garages = rng.randint(2, 4)
        return ["generator.py", str(rows), str(columns), str(cars), str(garages), "--seed", str(rng.randint(1, 1000000))]
    
    def _pegsol_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # pegsol uses Ruby generator
        return ["ruby", "generator.rb", str(rng.randint(3, 8))]
    
    def _snake_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Choose a random board from available boards
        boards = ["no-spawn-6x6.txt", "no-spawn-10x10.txt", "obstacles-6x6.txt", "obstacles-7x7.txt", "obstacles-8x8.txt", "obstacles-10x10.txt"]
        board = rng.choice(boards)
        snake_size = rng.randint(2, 5)
        num_initial_apples = rng.randint(1, 3)
        num_spawn_apples = rng.randint(1, 3)
        seed = rng.randint(1, 1000000)
        return ["generate.py", board, str(snake_size), str(num_initial_apples), str(num_spawn_apples), str(seed), "pddl"]
    
    def _spanner_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        spanners = rng.randint(2, 4)
        nuts = rng.randint(1, spanners)  # nuts <= spanners
        locations = rng.randint(2, 4)
        seed = rng.randint(1, 1000000)
        return ["spanner-generator.py", str(spanners), str(nuts), str(locations), "--seed", str(seed)]
    
    def _spider_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        num_decks = rng.randint(1, 2)
        num_suits = rng.randint(2, 4)
        num_values = rng.randint(3, 6)
        num_piles = rng.randint(4, 8)
        num_deals = rng.randint(2, 4)
        seed = rng.randint(1, 1000000)
        return ["generate.py", str(num_decks), str(num_suits), str(num_values), str(num_piles), str(num_deals), str(seed), "pddl"]
    
    def _agricola_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        last_stage = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["GenAgricola.py", str(last_stage), str(seed)]
    
    def _barman_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        num_cocktails = rng.randint(2, 4)
        num_ingredients = rng.randint(3, 6)
        num_shots = num_cocktails + rng.randint(1, 3)
        seed = rng.randint(1, 1000000)
        return ["barman-generator.py", str(num_cocktails), str(num_ingredients), str(num_shots), str(seed)]
    
    def _childsnack_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        problem_type = rng.choice(["pool", "control", "numeric"])
        seed = rng.randint(1, 1000000)
        num_children = rng.randint(2, 5)
        num_trays = rng.randint(2, 4)
        gluten_factor = rng.randint(1, 3)
        const_ratio = rng.uniform(1.0, 3.0)
        return ["child-snack-generator.py", problem_type, str(seed), str(num_children), str(num_trays), str(gluten_factor), str(const_ratio)]
    
    def _data_network_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Use one of the predefined network files
        networks = ["tiny-network", "small-network", "ring-network"]
        network = rng.choice(networks)
        layers = rng.randint(2, 5)
        data = rng.randint(layers + 2, layers * 10)  # data must be larger than layers
        scripts = rng.randint(data - 2, data * 3)  # scripts must be >= data-2
        seed = rng.randint(1, 1000000)
        return ["generator/generator.py", str(data), str(layers), str(scripts), network, "--seed", str(seed)]
    
    def _sokoban_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Use build-problems.py as it's the main generator
        return ["build-problems.py", str(rng.randint(3, 8)), str(rng.randint(1, 1000000))]
    
    def _tetris_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        grid_size = rng.choice([4, 6, 8, 10])  # Only even numbers
        block_type = rng.randint(1, 4)
        seed = rng.randint(1, 1000000)
        return ["generator.py", str(grid_size), str(block_type), str(seed)]
    
    def _transport_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Use three-cities-generator.py as it seems more complete
        nodes = rng.randint(5, 10)
        size = rng.randint(2, 4)
        degree = rng.randint(2, 4)
        mindistance = rng.randint(1, 3)
        nr_trucks = rng.randint(2, 4)
        nr_packages = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["three-cities-generator.py", str(nodes), str(size), str(degree), str(mindistance), str(nr_trucks), str(nr_packages), str(seed)]
    
    # C/C++ command builders
    def _assembly_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        depth = rng.randint(2, 4)
        max_sons = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["./assembly", "-s", str(seed), "-d", str(depth), "-m", str(max_sons)]
    
    def _briefcaseworld_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        objects = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["./briefcaseworld", "-o", str(objects), "-s", str(seed)]
    
    def _depots_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        depots = rng.randint(2, 4)
        distributors = rng.randint(2, 3)
        trucks = rng.randint(2, 3)
        pallets = rng.randint(3, 6)
        hoists = rng.randint(3, 5)
        crates = rng.randint(4, 8)
        seed = rng.randint(1, 1000000)
        return ["./depots", "-e", str(depots), "-i", str(distributors), "-t", str(trucks), 
                "-p", str(pallets), "-h", str(hoists), "-c", str(crates), "-s", str(seed)]
    
    def _driverlog_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        junctions = rng.randint(3, 6)
        drivers = rng.randint(2, 4)
        packages = rng.randint(3, 8)
        trucks = rng.randint(2, 4)
        distance = rng.randint(5, 20)
        seed = rng.randint(1, 1000000)
        return ["./dlgen", str(seed), str(junctions), str(drivers), str(packages), str(trucks), str(distance)]
    
    def _ferry_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        locations = rng.randint(3, 6)
        cars = rng.randint(2, 5)
        seed = rng.randint(1, 1000000)
        return ["./ferry", "-l", str(locations), "-c", str(cars), "-s", str(seed)]
    
    def _freecell_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        freecells = rng.randint(2, 4)
        cols = rng.randint(6, 8)
        suits = 4
        suit_size = rng.randint(8, 13)
        initial_stacks = rng.randint(4, 8)
        seed = rng.randint(1, 1000000)
        return ["./freecell", "-f", str(freecells), "-c", str(cols), "-s", str(suits), 
                "-0", str(suit_size), "-1", str(suit_size), "-2", str(suit_size), "-3", str(suit_size),
                "-i", str(initial_stacks), "-r", str(seed)]
    
    def _fridge_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        screws = rng.randint(3, 8)
        fridges = rng.randint(2, 4)
        seed = rng.randint(1, 1000000)
        return ["./fridge", "-s", str(screws), "-f", str(fridges), "-r", str(seed)]
    
    def _goldminer_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        rows = rng.randint(3, 6)
        cols = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["./gold-miner-generator", "-r", str(rows), "-c", str(cols), "-s", str(seed)]
    
    def _gripper_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        balls = rng.randint(2, 6)
        return ["./gripper", "-n", str(balls)]
    
    def _grippers_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        robots = rng.randint(2, 4)
        rooms = rng.randint(2, 4)
        balls = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["./grippers", "-n", str(robots), "-r", str(rooms), "-o", str(balls), "-s", str(seed)]
    
    def _hanoi_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        discs = rng.randint(3, 8)
        return ["./hanoi", "-n", str(discs)]
    
    def _maintenance_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        days = rng.randint(2, 4)
        planes = rng.randint(2, 4)
        mechanics = rng.randint(2, 4)
        cities = rng.randint(2, 4)
        visits = rng.randint(1, 3)
        seed = rng.randint(1, 1000000)
        return ["./maintenance", str(days), str(planes), str(mechanics), str(cities), str(visits), str(seed)]
    
    def _miconic_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        floors = rng.randint(3, 8)
        passengers = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["./miconic", "-f", str(floors), "-p", str(passengers), "-r", str(seed)]
    
    def _movie_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["./movie", "-n", str(rng.randint(3, 8))]
    
    def _mprime_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        locations = rng.randint(3, 6)
        fuel = rng.randint(5, 15)
        space = rng.randint(5, 15)
        vehicles = rng.randint(2, 4)
        cargos = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["./mprime", "-l", str(locations), "-f", str(fuel), "-s", str(space), 
                "-v", str(vehicles), "-c", str(cargos), "-r", str(seed)]
    
    def _mystery_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        locations = rng.randint(3, 6)
        fuel = rng.randint(5, 15)
        space = rng.randint(5, 15)
        vehicles = rng.randint(2, 4)
        cargos = rng.randint(3, 8)
        seed = rng.randint(1, 1000000)
        return ["./mystery", "-l", str(locations), "-f", str(fuel), "-s", str(space), 
                "-v", str(vehicles), "-c", str(cargos), "-r", str(seed)]
    
    def _npuzzle_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        size = rng.randint(3, 6)
        seed = rng.randint(1, 1000000)
        return ["./n-puzzle-generator", "-n", str(size), "-s", str(seed)]
    
    def _pathways_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["./pathways", str(rng.randint(3, 8))]
    
    def _rovers_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["./rovgen", str(rng.randint(3, 8))]
    
    def _satellite_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        seed = rng.randint(1, 1000000)
        satellites = rng.randint(1, 3)
        instruments = 3  # max instruments per satellite
        modes = rng.randint(3, 5)
        targets = rng.randint(7, 15)
        observations = rng.randint(3, 10)
        return ["./satgen", str(seed), str(satellites), str(instruments), str(modes), str(targets), str(observations)]
    
    def _zenotravel_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        cities = rng.randint(3, 8)
        planes = rng.randint(1, 3)
        people = rng.randint(2, 6)
        distance = rng.randint(5, 20)
        return ["./ztravel", str(rng.randint(1, 1000000)), str(cities), str(planes), str(people), str(distance)]
    
    def _schedule_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        parts = rng.randint(3, 6)
        shapes = rng.randint(0, 2)
        colors = rng.randint(2, 4)
        widths = rng.randint(2, 3)
        orientations = rng.randint(1, 2)
        seed = rng.randint(1, 1000000)
        return ["./schedule", "-p", str(parts), "-s", str(shapes), "-c", str(colors), 
                "-w", str(widths), "-o", str(orientations), "-r", str(seed)]
    
    def _storage_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # storage generator parameters
        containers = rng.randint(1, 3)
        hoists = rng.randint(1, 3)
        crates = rng.randint(1, 4)
        store_areas = rng.randint(max(crates, hoists), 8)
        depots = rng.randint(1, 2)
        seed = rng.randint(1, 1000000)
        return ["./storage", "-o", str(containers), "-n", str(hoists), "-c", str(crates), 
                "-s", str(store_areas), "-d", str(depots), "-e", str(seed), "pfile"]
    
    def _tpp_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        products = rng.randint(2, 4)
        markets = rng.randint(3, 6)
        trucks = rng.randint(2, 4)
        depots = rng.randint(2, 4)
        levels = rng.randint(5, 15)
        seed = rng.randint(1, 1000000)
        return ["./tpp", "-s", str(seed), "-p", str(products), "-m", str(markets), 
                "-t", str(trucks), "-d", str(depots), "-l", str(levels), "pfile"]
    
    def _trucks_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # trucks generator parameters
        trucks = rng.randint(1, 2)
        locations = rng.randint(3, 6)
        packages = rng.randint(3, 8)
        areas = rng.randint(2, 4)
        seed = rng.randint(1, 1000000)
        return ["./trucks", "-t", str(trucks), "-l", str(locations), "-p", str(packages), 
                "-a", str(areas), "-n", str(idx), "-seed", str(seed)]
    
    def _tsp_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        locations = rng.randint(4, 8)
        return ["./tsp", "-n", str(locations)]
    
    def _turnandopen_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        robots = rng.randint(1, 3)
        rooms = rng.randint(1, 3)
        balls = rng.randint(1, 3)
        seed = rng.randint(1, 1000000)
        return ["./turnandopen", "-n", str(robots), "-r", str(rooms), "-o", str(balls), "-s", str(seed)]
    
    def _tyreworld_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        tyres = rng.randint(1, 5)
        return ["./tyreworld", "-n", str(tyres)]
    
    def _visitall_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        size = rng.randint(3, 6)
        ratio = rng.uniform(0.3, 0.7)
        unavailable = rng.randint(0, 2)
        seed = rng.randint(1, 1000000)
        return ["./grid", "-n", str(size), "-r", str(ratio), "-u", str(unavailable), "-s", str(seed)]
    
    # Special case generators
    def _nomystery_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        return ["./build/nomystery"]
    
    def _crewplanning_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        days = rng.randint(3, 8)
        crew = rng.randint(2, 6)
        util = rng.choice([2, 3, 4])  # 2: 50%, 3: 75%, 4: 100%
        seed = rng.randint(1, 1000000)
        return ["./main.native", "-day", str(days), "-crew", str(crew), "-util", str(util), "-seed", str(seed)]
    
    def _parking_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        base_name = f"parking-{idx}"
        curbs = rng.randint(2, 4)
        cars = min(curbs, rng.randint(2, 4))  # cars cannot exceed curbs
        mode = rng.randint(1, 2)
        seed = rng.randint(1, 1000000)
        return ["perl", "parking-generator.pl", base_name, str(curbs), str(cars), str(mode), str(seed)]
    
    def _termes_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        # Use the basic generate.py for termes
        return ["generate.py", str(rng.randint(3, 8)), str(rng.randint(1, 1000000))]
    
    def _tidybot_command_builder(self, idx: int, rng: random.Random) -> List[str]:
        worldsize = rng.randint(4, 8)
        ntables = rng.randint(2, 4)
        ncupboards = rng.randint(2, 4)
        minsurfacesize = 1
        maxsurfacesize = 2
        cupboardsize = 2
        return ["gentidy.py", str(worldsize), str(ntables), str(ncupboards), 
                str(minsurfacesize), str(maxsurfacesize), str(cupboardsize)]
    
    def _generate_nomystery_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems for nomystery (CMake-based)."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            cmd_with_output = cmd + [">", str(outfile)]
            cmd_str = " ".join(str(arg) for arg in cmd_with_output)
            subprocess.run(cmd_str, cwd=scenario_root, shell=True, check=True)
    
    def _generate_crewplanning_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems for crewplanning (OCaml-based)."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            cmd_with_output = cmd + [">", str(outfile)]
            cmd_str = " ".join(str(arg) for arg in cmd_with_output)
            subprocess.run(cmd_str, cwd=scenario_root, shell=True, check=True)
    
    def _generate_parking_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems for parking (Perl-based)."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            cmd_with_output = cmd + [">", str(outfile)]
            cmd_str = " ".join(str(arg) for arg in cmd_with_output)
            subprocess.run(cmd_str, cwd=scenario_root, shell=True, check=True)
    
    def _generate_termes_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems for termes (Python-based with multiple generators)."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            
            # Add python executable to the command if not present
            if not cmd[0].endswith("python") and not cmd[0].endswith("python3"):
                cmd = [self.python_executable] + cmd
            
            result = self._run_command(cmd, scenario_root)
            outfile.write_text(result.stdout)
    
    def _generate_tidybot_problems(self, config: GeneratorConfig, scenario_root: Path, target_dir: Path) -> None:
        """Generate problems for tidybot (Java-based)."""
        # Ensure clean directory
        if target_dir.exists():
            shutil.rmtree(target_dir)
        target_dir.mkdir(parents=True, exist_ok=True)
        width = max(4, len(str(self.count)))
        
        for idx in range(1, self.count + 1):
            outfile = target_dir / f"{idx:0{width}d}.pddl"
            cmd = config.command_builder(idx, self.rng)
            
            # Add python executable to the command if not present
            if not cmd[0].endswith("python") and not cmd[0].endswith("python3"):
                cmd = [self.python_executable] + cmd
            
            try:
                result = self._run_command(cmd, scenario_root)
                outfile.write_text(result.stdout)
            except Exception as e:
                print(f"    Warning: Failed to generate problem {idx} for tidybot: {e}")
                # Create a simple placeholder file
                outfile.write_text(f"; Placeholder for tidybot problem {idx}\n; Generator failed: {e}\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Generate training problems for all PDDL scenarios")
    parser.add_argument(
        "--scenarios",
        nargs="*",
        default=None,
        help="Specific scenarios to process (default: all scenarios)"
    )
    parser.add_argument(
        "--exclude",
        nargs="*",
        default=None,
        help="Scenarios to exclude from processing"
    )
    parser.add_argument(
        "--count",
        type=int,
        default=1000,
        help="Number of problems to generate per scenario (default: 1000)"
    )
    parser.add_argument(
        "--target-name",
        default="training_problems",
        help="Name of the target directory under each scenario (default: training_problems)"
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=20240924,
        help="Random seed for reproducible generation (default: 20240924)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show what would be generated without actually generating problems"
    )
    
    args = parser.parse_args()
    
    generator = TrainingProblemGenerator(
        target_name=args.target_name,
        count=args.count,
        seed=args.seed
    )
    
    if args.dry_run:
        print("DRY RUN MODE - No problems will be generated")
        print(f"Would generate {args.count} problems per scenario")
        print(f"Target directory: {args.target_name}")
        print(f"Random seed: {args.seed}")
        
        if args.scenarios:
            print(f"Scenarios: {', '.join(args.scenarios)}")
        else:
            print("All discovered scenarios")
        
        if args.exclude:
            print(f"Excluding: {', '.join(args.exclude)}")
        
        print(f"\nConfigured generators for {len(generator.generator_registry)} scenarios:")
        for name, config in generator.generator_registry.items():
            print(f"  {name}: {config.generator_type} - {config.notes}")
        return
    
    generator.generate_all_problems(
        scenarios=args.scenarios,
        exclude=args.exclude
    )


if __name__ == "__main__":
    main()
