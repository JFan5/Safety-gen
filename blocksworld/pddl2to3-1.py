import re
from typing import List, Dict, Set, Tuple, Optional
from dataclasses import dataclass
import os


@dataclass
class BlocksworldState:
    """Represents the state in blocksworld"""
    on_table: Set[str]  # blocks on table
    on: Dict[str, str]  # block -> block it's on
    clear: Set[str]  # blocks that are clear
    holding: Optional[str]  # block being held
    handempty: bool  # whether hand is empty


class BlocksworldPDDL3Generator:
    """Generator for PDDL3 domain and problem files for blocksworld"""
    
    def __init__(self, original_domain_file: str = None, original_problem_file: str = None):
        """
        Initialize the generator
        
        Args:
            original_domain_file: Optional path to original domain.pddl file
            original_problem_file: Optional path to original problem.pddl file
        """
        self.original_domain_file = original_domain_file
        self.original_problem_file = original_problem_file
        self.domain_name = "blocksworld"
        self.problem_name = "blocksworld-problem"
        self.blocks = []
        self.initial_state = None
        self.goal_state = None
        self.raw_init = []
        self.raw_goal = ""
        
        # Parse original files if provided
        if original_problem_file and os.path.exists(original_problem_file):
            self._parse_original_problem()
        if original_domain_file and os.path.exists(original_domain_file):
            self._parse_original_domain()
    
    def _parse_original_domain(self):
        """Parse original domain file if exists"""
        try:
            with open(self.original_domain_file, 'r') as f:
                content = f.read()
            # Extract domain name
            domain_match = re.search(r'\(domain\s+(\S+)\)', content)
            if domain_match:
                self.domain_name = domain_match.group(1)
        except:
            pass
    
    def _parse_original_problem(self):
        """Parse original problem.pddl to extract initial and goal states"""
        with open(self.original_problem_file, 'r') as f:
            content = f.read()
        
        # Extract problem name
        problem_match = re.search(r'\(problem\s+(\S+)\)', content)
        if problem_match:
            self.problem_name = problem_match.group(1)
        
        # Extract objects (blocks)
        objects_match = re.search(r'\(:objects\s+(.*?)\)', content, re.DOTALL)
        if objects_match:
            objects_str = objects_match.group(1).strip()
            # Remove type annotations if present
            objects_str = re.sub(r'-\s*\w+', '', objects_str)
            self.blocks = objects_str.split()
        
        # Extract init state
        init_match = re.search(r'\(:init\s+(.*?)\)\s*\(:', content, re.DOTALL)
        if init_match:
            init_str = init_match.group(1)
            self.raw_init = re.findall(r'\([^)]+\)', init_str)
            self.raw_init = [p.strip() for p in self.raw_init]
        
        # Extract goal state
        goal_match = re.search(r'\(:goal\s+(.*?)\)\s*(?:\(:|\s*\))', content, re.DOTALL)
        if goal_match:
            self.raw_goal = goal_match.group(1).strip()
        
        # Analyze states
        self._analyze_states()
    
    def _analyze_states(self):
        """Analyze initial and goal states to understand the problem structure"""
        # Parse initial state
        self.initial_state = BlocksworldState(
            on_table=set(),
            on={},
            clear=set(),
            holding=None,
            handempty=False
        )
        
        for pred in self.raw_init:
            if 'on-table' in pred or 'ontable' in pred:
                block = re.search(r'\((?:on-table|ontable)\s+(\w+)\)', pred)
                if block:
                    self.initial_state.on_table.add(block.group(1))
            elif 'on ' in pred or '(on' in pred:
                match = re.search(r'\(on\s+(\w+)\s+(\w+)\)', pred)
                if match:
                    self.initial_state.on[match.group(1)] = match.group(2)
            elif 'clear' in pred:
                block = re.search(r'\(clear\s+(\w+)\)', pred)
                if block:
                    self.initial_state.clear.add(block.group(1))
            elif 'holding' in pred:
                block = re.search(r'\(holding\s+(\w+)\)', pred)
                if block:
                    self.initial_state.holding = block.group(1)
            elif 'handempty' in pred or 'hand-empty' in pred:
                self.initial_state.handempty = True
        
        # Parse goal state
        self.goal_state = BlocksworldState(
            on_table=set(),
            on={},
            clear=set(),
            holding=None,
            handempty=False
        )
        
        goal_preds = re.findall(r'\([^)]+\)', self.raw_goal)
        for pred in goal_preds:
            if 'on-table' in pred or 'ontable' in pred:
                block = re.search(r'\((?:on-table|ontable)\s+(\w+)\)', pred)
                if block:
                    self.goal_state.on_table.add(block.group(1))
            elif 'on ' in pred or '(on' in pred:
                match = re.search(r'\(on\s+(\w+)\s+(\w+)\)', pred)
                if match:
                    self.goal_state.on[match.group(1)] = match.group(2)
    
    def generate_domain_pddl3(self, output_file: str = "domain_pddl3.pddl") -> str:
        """
        Generate a PDDL3-compatible domain file for blocksworld
        
        Args:
            output_file: Path to save the domain file
        
        Returns:
            Generated domain content as string
        """
        domain_content = []
        
        # Domain header with PDDL3 requirements
        domain_content.append(f"(define (domain {self.domain_name})")
        domain_content.append("  (:requirements :strips :typing :constraints :preferences :conditional-effects)")
        domain_content.append("")
        
        # Types
        domain_content.append("  (:types")
        domain_content.append("    block - object")
        domain_content.append("  )")
        domain_content.append("")
        
        # Predicates
        domain_content.append("  (:predicates")
        domain_content.append("    (on ?x - block ?y - block)")
        domain_content.append("    (on-table ?x - block)")
        domain_content.append("    (clear ?x - block)")
        domain_content.append("    (handempty)")
        domain_content.append("    (holding ?x - block)")
        domain_content.append("  )")
        domain_content.append("")
        
        # Action: pick-up (from table)
        domain_content.append("  (:action pick-up")
        domain_content.append("    :parameters (?x - block)")
        domain_content.append("    :precondition (and")
        domain_content.append("      (clear ?x)")
        domain_content.append("      (on-table ?x)")
        domain_content.append("      (handempty)")
        domain_content.append("    )")
        domain_content.append("    :effect (and")
        domain_content.append("      (not (on-table ?x))")
        domain_content.append("      (not (clear ?x))")
        domain_content.append("      (not (handempty))")
        domain_content.append("      (holding ?x)")
        domain_content.append("    )")
        domain_content.append("  )")
        domain_content.append("")
        
        # Action: put-down (to table)
        domain_content.append("  (:action put-down")
        domain_content.append("    :parameters (?x - block)")
        domain_content.append("    :precondition (holding ?x)")
        domain_content.append("    :effect (and")
        domain_content.append("      (not (holding ?x))")
        domain_content.append("      (clear ?x)")
        domain_content.append("      (handempty)")
        domain_content.append("      (on-table ?x)")
        domain_content.append("    )")
        domain_content.append("  )")
        domain_content.append("")
        
        # Action: stack (put on another block)
        domain_content.append("  (:action stack")
        domain_content.append("    :parameters (?x - block ?y - block)")
        domain_content.append("    :precondition (and")
        domain_content.append("      (holding ?x)")
        domain_content.append("      (clear ?y)")
        domain_content.append("    )")
        domain_content.append("    :effect (and")
        domain_content.append("      (not (holding ?x))")
        domain_content.append("      (not (clear ?y))")
        domain_content.append("      (clear ?x)")
        domain_content.append("      (handempty)")
        domain_content.append("      (on ?x ?y)")
        domain_content.append("    )")
        domain_content.append("  )")
        domain_content.append("")
        
        # Action: unstack (pick up from another block)
        domain_content.append("  (:action unstack")
        domain_content.append("    :parameters (?x - block ?y - block)")
        domain_content.append("    :precondition (and")
        domain_content.append("      (on ?x ?y)")
        domain_content.append("      (clear ?x)")
        domain_content.append("      (handempty)")
        domain_content.append("    )")
        domain_content.append("    :effect (and")
        domain_content.append("      (holding ?x)")
        domain_content.append("      (clear ?y)")
        domain_content.append("      (not (clear ?x))")
        domain_content.append("      (not (handempty))")
        domain_content.append("      (not (on ?x ?y))")
        domain_content.append("    )")
        domain_content.append("  )")
        
        domain_content.append(")")
        
        # Write to file
        domain_str = '\n'.join(domain_content)
        with open(output_file, 'w') as f:
            f.write(domain_str)
        
        print(f"Generated PDDL3 domain file: {output_file}")
        return domain_str
    
    def generate_constraints(self) -> List[str]:
        """
        Generate intelligent constraints based on initial and goal states
        
        Returns:
            List of PDDL3 constraint strings
        """
        constraints = []
        
        # Identify blocks that need to be moved
        blocks_to_move = set()
        for block in self.blocks:
            # Check if block's position changes
            if block in self.initial_state.on and block in self.goal_state.on:
                if self.initial_state.on[block] != self.goal_state.on[block]:
                    blocks_to_move.add(block)
            elif block in self.initial_state.on_table and block in self.goal_state.on:
                blocks_to_move.add(block)
            elif block in self.initial_state.on and block in self.goal_state.on_table:
                blocks_to_move.add(block)
        
        # 1. Goal achievement constraints
        for block_a, block_b in self.goal_state.on.items():
            constraints.append(f"(sometime (on {block_a} {block_b}))")
        
        # 2. Efficiency constraints
        for block in blocks_to_move:
            constraints.append(f"(at-most-once (holding {block}))")
        
        # 3. Ordering constraints
        for block_a, block_b in self.goal_state.on.items():
            if block_b in blocks_to_move:
                constraints.append(f"(sometime-after (clear {block_b}) (on {block_a} {block_b}))")
        
        # 4. Final state constraints
        constraints.append("(at-end (handempty))")
        
        # 5. Preference constraints (optional, for optimization)
        # Prefer to minimize the number of actions
        for block in self.blocks:
            if block not in blocks_to_move:
                # Blocks that don't need to move should stay in place
                if block in self.initial_state.on_table:
                    constraints.append(f"(always (on-table {block}))")
        
        return constraints
    
    def generate_problem_pddl3(self, output_file: str = "problem_pddl3.pddl",
                               include_constraints: bool = True,
                               custom_constraints: Optional[List[str]] = None) -> str:
        """
        Generate a PDDL3-compatible problem file
        
        Args:
            output_file: Path to save the problem file
            include_constraints: Whether to include auto-generated constraints
            custom_constraints: Optional list of custom constraints to add
        
        Returns:
            Generated problem content as string
        """
        problem_content = []
        
        # Problem definition
        problem_content.append(f"(define (problem {self.problem_name}_pddl3)")
        problem_content.append(f"  (:domain {self.domain_name})")
        problem_content.append("")
        
        # Objects
        problem_content.append("  (:objects")
        problem_content.append(f"    {' '.join(self.blocks)} - block")
        problem_content.append("  )")
        problem_content.append("")
        
        # Initial state
        problem_content.append("  (:init")
        for pred in self.raw_init:
            problem_content.append(f"    {pred}")
        problem_content.append("  )")
        problem_content.append("")
        
        # Goal state
        problem_content.append("  (:goal")
        problem_content.append(f"    {self.raw_goal}")
        problem_content.append("  )")
        
        # Constraints
        if include_constraints:
            constraints = self.generate_constraints()
            if custom_constraints:
                constraints.extend(custom_constraints)
            
            if constraints:
                problem_content.append("")
                problem_content.append("  (:constraints")
                if len(constraints) > 1:
                    problem_content.append("    (and")
                    for constraint in constraints:
                        problem_content.append(f"      {constraint}")
                    problem_content.append("    )")
                else:
                    problem_content.append(f"    {constraints[0]}")
                problem_content.append("  )")
        
        # Optional: Add metric for optimization
        problem_content.append("")
        problem_content.append("  (:metric minimize (total-time))")
        
        problem_content.append(")")
        
        # Write to file
        problem_str = '\n'.join(problem_content)
        with open(output_file, 'w') as f:
            f.write(problem_str)
        
        print(f"Generated PDDL3 problem file: {output_file}")
        if include_constraints:
            print(f"Added {len(constraints)} constraints")
        
        return problem_str


def generate_blocksworld_pddl3(original_domain: str = None,
                               original_problem: str = None,
                               output_domain: str = "domain_pddl3.pddl",
                               output_problem: str = "problem_pddl3.pddl",
                               include_constraints: bool = True,
                               custom_constraints: Optional[List[str]] = None) -> Tuple[str, str]:
    """
    Main function to generate both PDDL3 domain and problem files for blocksworld
    
    Args:
        original_domain: Optional path to original domain file
        original_problem: Optional path to original problem file
        output_domain: Path for generated domain file
        output_problem: Path for generated problem file
        include_constraints: Whether to include auto-generated constraints
        custom_constraints: Optional list of custom constraints
    
    Returns:
        Tuple of (domain_content, problem_content) as strings
    
    Example:
        >>> domain, problem = generate_blocksworld_pddl3(
        ...     original_problem="blocksworld_problem.pddl",
        ...     output_domain="new_domain.pddl",
        ...     output_problem="new_problem.pddl"
        ... )
    """
    generator = BlocksworldPDDL3Generator(original_domain, original_problem)
    
    # Generate domain
    domain_content = generator.generate_domain_pddl3(output_domain)
    
    # Generate problem
    problem_content = generator.generate_problem_pddl3(
        output_problem, 
        include_constraints, 
        custom_constraints
    )
    
    return domain_content, problem_content


def generate_from_problem_only(problem_file: str,
                              output_domain: str = "domain_pddl3.pddl",
                              output_problem: str = "problem_pddl3.pddl") -> Tuple[str, str]:
    """
    Convenience function to generate PDDL3 files from just a problem file
    
    Args:
        problem_file: Path to original problem.pddl
        output_domain: Path for generated domain file
        output_problem: Path for generated problem file
    
    Returns:
        Tuple of (domain_content, problem_content) as strings
    """
    return generate_blocksworld_pddl3(
        original_problem=problem_file,
        output_domain=output_domain,
        output_problem=output_problem,
        include_constraints=True
    )


# Example usage
if __name__ == "__main__":
    print("="*60)
    print("Blocksworld PDDL3 Generator")
    print("="*60)
    
    # Example 1: Generate from existing problem file
    if os.path.exists("problem.pddl"):
        print("\nGenerating PDDL3 files from existing problem.pddl...")
        domain, problem = generate_from_problem_only(
            problem_file="problem.pddl",
            output_domain="domain_pddl3.pddl",
            output_problem="problem_pddl3.pddl"
        )
        print("\nGenerated files successfully!")
    
    # Example 2: Generate with custom constraints
    else:
        print("\nExample: Generating PDDL3 files with sample data...")
        
        # Create a sample generator with mock data
        generator = BlocksworldPDDL3Generator()
        generator.blocks = ["a", "b", "c", "d"]
        generator.raw_init = [
            "(clear c)",
            "(clear a)",
            "(clear b)",
            "(clear d)",
            "(on-table c)",
            "(on-table a)",
            "(on-table b)",
            "(on-table d)",
            "(handempty)"
        ]
        generator.raw_goal = "(and (on d c) (on c b) (on b a))"
        generator._analyze_states()
        
        # Generate domain
        domain = generator.generate_domain_pddl3("example_domain.pddl")
        
        # Generate problem with custom constraints
        custom = [
            "(preference p1 (sometime (clear b)))",
            "(preference p2 (at-most-once (holding a)))"
        ]
        problem = generator.generate_problem_pddl3(
            "example_problem.pddl",
            include_constraints=True,
            custom_constraints=custom
        )
        
        print("\n" + "="*40)
        print("Generated Domain:")
        print("="*40)
        print(domain[:500] + "...\n")
        
        print("="*40)
        print("Generated Problem:")
        print("="*40)
        print(problem)