#!/usr/bin/env python3
"""
PDDL Data Augmentation Script for LLM Fine-Tuning

Performs Symbolic Renaming (De-semanticization) on PDDL domain, problem, and plan files.
Outputs JSONL format suitable for SFT (Supervised Fine-Tuning).

Usage:
    python pddl_augment.py --domain domain.pddl --problem problem.pddl --plan plan.txt --output output.jsonl
    python pddl_augment.py --input_dir data/ --output output.jsonl
"""

import argparse
import json
import re
import random
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass, asdict


# PDDL keywords that should NOT be renamed
PDDL_KEYWORDS = frozenset([
    # Domain/Problem structure
    'define', 'domain', 'problem',
    # Requirements
    ':requirements', ':strips', ':typing', ':equality', ':negative-preconditions',
    ':disjunctive-preconditions', ':existential-preconditions', ':universal-preconditions',
    ':quantified-preconditions', ':conditional-effects', ':fluents', ':numeric-fluents',
    ':adl', ':durative-actions', ':derived-predicates', ':timed-initial-literals',
    ':preferences', ':constraints', ':action-costs',
    # Domain sections
    ':types', ':constants', ':predicates', ':functions',
    # Action keywords
    ':action', ':parameters', ':precondition', ':effect', ':vars',
    ':durative-action', ':duration', ':condition',
    # Problem sections
    ':domain', ':objects', ':init', ':goal', ':metric',
    # Constraint keywords (PDDL3)
    ':constraints', 'and', 'or', 'not', 'imply', 'exists', 'forall',
    'when', 'at', 'start', 'end', 'over', 'all',
    'sometime', 'always', 'within', 'at-most-once', 'sometime-after',
    'sometime-before', 'always-within', 'hold-during', 'hold-after',
    # Numeric
    'increase', 'decrease', 'assign', 'scale-up', 'scale-down',
    'minimize', 'maximize', 'total-cost', 'total-time',
    # Temporal
    'at', 'start', 'end', 'over', 'all',
    # Logical
    'either', 'object',
])


@dataclass
class ObfuscationMapping:
    """Stores the mapping from original to obfuscated names"""
    predicates: Dict[str, str]
    actions: Dict[str, str]
    objects: Dict[str, str]

    def to_dict(self) -> Dict:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict) -> 'ObfuscationMapping':
        return cls(
            predicates=data.get('predicates', {}),
            actions=data.get('actions', {}),
            objects=data.get('objects', {})
        )


class PDDLParser:
    """Simple PDDL parser using regex for extracting predicates, actions, and objects"""

    @staticmethod
    def extract_predicates(domain_content: str) -> List[str]:
        """
        Extract predicate names from domain PDDL.

        Args:
            domain_content: PDDL domain string

        Returns:
            List of predicate names
        """
        predicates = []

        # Find the (:predicates ...) block using bracket matching
        start_pattern = r'\(:predicates\s+'
        start_match = re.search(start_pattern, domain_content, re.IGNORECASE)

        if start_match:
            start_pos = start_match.end()
            depth = 1
            i = start_pos

            while i < len(domain_content) and depth > 0:
                if domain_content[i] == '(':
                    depth += 1
                elif domain_content[i] == ')':
                    depth -= 1
                i += 1

            if depth == 0:
                pred_block = domain_content[start_pos:i-1]
                # Match each predicate definition: (name ?params...)
                pred_defs = re.findall(r'\(([\w-]+)(?:\s+[^)]*)?', pred_block)
                predicates = [p for p in pred_defs if p.lower() not in PDDL_KEYWORDS]

        return list(set(predicates))

    @staticmethod
    def extract_actions(domain_content: str) -> List[str]:
        """
        Extract action names from domain PDDL.

        Args:
            domain_content: PDDL domain string

        Returns:
            List of action names
        """
        # Match (:action name ...) or (:durative-action name ...)
        pattern = r'\(:(?:durative-)?action\s+([\w-]+)'
        matches = re.findall(pattern, domain_content, re.IGNORECASE)
        return list(set(matches))

    @staticmethod
    def extract_objects(problem_content: str) -> List[str]:
        """
        Extract object names from problem PDDL.

        Handles both typed and untyped objects:
        - Untyped: (:objects obj1 obj2 obj3)
        - Typed: (:objects obj1 obj2 - type1 obj3 - type2)

        Args:
            problem_content: PDDL problem string

        Returns:
            List of object names
        """
        objects = []

        # Match (:objects ...) block
        obj_pattern = r'\(:objects\s+(.*?)\)'
        match = re.search(obj_pattern, problem_content, re.DOTALL | re.IGNORECASE)

        if match:
            obj_block = match.group(1)
            tokens = obj_block.split()

            skip_next = False
            for token in tokens:
                token = token.strip()
                if skip_next:
                    skip_next = False
                    continue
                if token == '-':
                    skip_next = True  # Skip the type name
                    continue
                # Valid object name: alphanumeric with possible hyphens/underscores
                if token and not token.startswith(';') and re.match(r'^[a-zA-Z0-9_-]+$', token):
                    if token.lower() not in PDDL_KEYWORDS:
                        objects.append(token)

        return list(set(objects))

    @staticmethod
    def extract_types(domain_content: str) -> List[str]:
        """
        Extract type names from domain PDDL (for typed domains).

        Args:
            domain_content: PDDL domain string

        Returns:
            List of type names
        """
        types = []

        # Match (:types ...) block
        type_pattern = r'\(:types\s+(.*?)\)'
        match = re.search(type_pattern, domain_content, re.DOTALL | re.IGNORECASE)

        if match:
            type_block = match.group(1)
            tokens = type_block.split()

            skip_next = False
            for token in tokens:
                token = token.strip()
                if skip_next:
                    skip_next = False
                    continue
                if token == '-':
                    skip_next = True
                    continue
                if token and not token.startswith(';') and re.match(r'^[a-zA-Z0-9_-]+$', token):
                    if token.lower() not in PDDL_KEYWORDS:
                        types.append(token)

        return list(set(types))


class PDDLObfuscator:
    """
    Performs symbolic renaming (de-semanticization) on PDDL files.

    Renames:
    - Predicates: pred_1, pred_2, ...
    - Actions: op_1, op_2, ...
    - Objects: obj_01, obj_02, ...
    """

    def __init__(self, seed: Optional[int] = None,
                 pred_prefix: str = "pred_",
                 action_prefix: str = "op_",
                 object_prefix: str = "obj_"):
        """
        Initialize the obfuscator.

        Args:
            seed: Random seed for shuffling (None for deterministic order)
            pred_prefix: Prefix for renamed predicates
            action_prefix: Prefix for renamed actions
            object_prefix: Prefix for renamed objects
        """
        self.seed = seed
        self.pred_prefix = pred_prefix
        self.action_prefix = action_prefix
        self.object_prefix = object_prefix

        if seed is not None:
            random.seed(seed)

    def create_mapping(self, predicates: List[str], actions: List[str],
                       objects: List[str], shuffle: bool = True) -> ObfuscationMapping:
        """
        Create a consistent mapping from original names to obfuscated names.

        Args:
            predicates: List of predicate names
            actions: List of action names
            objects: List of object names
            shuffle: Whether to shuffle before assigning numbers

        Returns:
            ObfuscationMapping with all mappings
        """
        pred_list = list(predicates)
        action_list = list(actions)
        obj_list = list(objects)

        if shuffle:
            random.shuffle(pred_list)
            random.shuffle(action_list)
            random.shuffle(obj_list)

        pred_map = {p: f"{self.pred_prefix}{i+1}" for i, p in enumerate(pred_list)}
        action_map = {a: f"{self.action_prefix}{i+1}" for i, a in enumerate(action_list)}
        # Zero-pad object numbers for better sorting
        width = max(2, len(str(len(obj_list))))
        obj_map = {o: f"{self.object_prefix}{str(i+1).zfill(width)}" for i, o in enumerate(obj_list)}

        return ObfuscationMapping(
            predicates=pred_map,
            actions=action_map,
            objects=obj_map
        )

    def _replace_tokens(self, text: str, token_map: Dict[str, str]) -> str:
        """
        Replace tokens in text using word boundary matching.

        Args:
            text: Original text
            token_map: Mapping from old to new tokens

        Returns:
            Text with tokens replaced
        """
        # Sort by length (longest first) to avoid partial matches
        sorted_tokens = sorted(token_map.items(), key=lambda x: len(x[0]), reverse=True)

        for old_token, new_token in sorted_tokens:
            # Use word boundary matching, but don't match if preceded by ?
            # This preserves PDDL variables like ?x
            pattern = r'(?<!\?)\b' + re.escape(old_token) + r'\b'
            text = re.sub(pattern, new_token, text)

        return text

    def obfuscate_domain(self, domain_content: str, mapping: ObfuscationMapping) -> str:
        """
        Apply obfuscation to domain PDDL.

        Args:
            domain_content: Original domain PDDL
            mapping: Obfuscation mapping to apply

        Returns:
            Obfuscated domain PDDL
        """
        result = domain_content
        result = self._replace_tokens(result, mapping.predicates)
        result = self._replace_tokens(result, mapping.actions)
        return result

    def obfuscate_problem(self, problem_content: str, mapping: ObfuscationMapping) -> str:
        """
        Apply obfuscation to problem PDDL.

        Args:
            problem_content: Original problem PDDL
            mapping: Obfuscation mapping to apply

        Returns:
            Obfuscated problem PDDL
        """
        result = problem_content
        result = self._replace_tokens(result, mapping.predicates)
        result = self._replace_tokens(result, mapping.objects)
        return result

    def obfuscate_plan(self, plan_content: str, mapping: ObfuscationMapping) -> str:
        """
        Apply obfuscation to plan.

        Supports multiple plan formats:
        - Simple: (action obj1 obj2)
        - Numbered: 0: (action obj1 obj2)
        - IPC format: (action obj1 obj2) ; cost

        Args:
            plan_content: Original plan
            mapping: Obfuscation mapping to apply

        Returns:
            Obfuscated plan
        """
        lines = plan_content.strip().split('\n')
        new_lines = []

        for line in lines:
            line = line.strip()
            if not line or line.startswith(';'):
                new_lines.append(line)
                continue

            # Handle numbered prefix (e.g., "0: ")
            prefix_match = re.match(r'^(\d+:\s*)', line)
            prefix = prefix_match.group(1) if prefix_match else ''
            action_part = line[len(prefix):] if prefix else line

            # Apply obfuscation
            action_part = self._replace_tokens(action_part, mapping.actions)
            action_part = self._replace_tokens(action_part, mapping.objects)

            new_lines.append(prefix + action_part)

        return '\n'.join(new_lines)


class PDDLAugmenter:
    """
    Main class for PDDL data augmentation.

    Combines parsing and obfuscation to process PDDL files and generate
    JSONL output suitable for LLM fine-tuning (obfuscated + original 1:1 mix).
    """

    DEFAULT_INSTRUCTION = (
        "You are a PDDL planning expert. Solve the following problem based on the provided domain."
    )

    def __init__(self, seed: Optional[int] = None,
                 instruction: Optional[str] = None,
                 mix_original: bool = True):
        """
        Initialize the augmenter.

        Args:
            seed: Random seed for obfuscation
            instruction: Custom instruction for JSONL output
            mix_original: When True, emit both obfuscated and original JSONL entries (1:1)
        """
        self.parser = PDDLParser()
        self.obfuscator = PDDLObfuscator(seed=seed)
        self.instruction = instruction or self.DEFAULT_INSTRUCTION
        self.mix_original = mix_original

    def augment_single(self, domain_pddl: str, problem_pddl: str,
                       plan: str, problem_id: str = "problem_1",
                       domain_name: str = "domain") -> Dict:
        """
        Augment a single domain-problem-plan triple. Produces an obfuscated JSONL entry
        and, if enabled, the original entry for 1:1 mixing.

        Args:
            domain_pddl: Domain PDDL string
            problem_pddl: Problem PDDL string
            plan: Plan string
            problem_id: Problem identifier
            domain_name: Domain name

        Returns:
            Dictionary with original, obfuscated, and JSONL-formatted data
        """
        # Parse PDDL to extract symbols
        predicates = self.parser.extract_predicates(domain_pddl)
        actions = self.parser.extract_actions(domain_pddl)
        objects = self.parser.extract_objects(problem_pddl)

        # Create obfuscation mapping
        mapping = self.obfuscator.create_mapping(predicates, actions, objects)

        # Apply obfuscation
        obf_domain = self.obfuscator.obfuscate_domain(domain_pddl, mapping)
        obf_problem = self.obfuscator.obfuscate_problem(problem_pddl, mapping)
        obf_plan = self.obfuscator.obfuscate_plan(plan, mapping)

        # Create JSONL entry
        input_obf = f"Domain:\n{obf_domain}\n\nProblem:\n{obf_problem}"
        jsonl_obf = {
            "instruction": self.instruction,
            "input": input_obf,
            "output": obf_plan
        }

        input_original = f"Domain:\n{domain_pddl}\n\nProblem:\n{problem_pddl}"
        jsonl_original = {
            "instruction": self.instruction,
            "input": input_original,
            "output": plan
        }

        jsonl_entries = [jsonl_obf]
        if self.mix_original:
            jsonl_entries.append(jsonl_original)

        return {
            "problem_id": problem_id,
            "domain_name": domain_name,
            "mapping": mapping.to_dict(),
            "original": {
                "domain": domain_pddl,
                "problem": problem_pddl,
                "plan": plan
            },
            "obfuscated": {
                "domain": obf_domain,
                "problem": obf_problem,
                "plan": obf_plan
            },
            "jsonl_entry": jsonl_obf,  # backward compatibility
            "jsonl_entries": jsonl_entries
        }

    def augment_from_files(self, domain_file: Path, problem_file: Path,
                           plan_file: Path) -> Dict:
        """
        Augment from file paths.

        Args:
            domain_file: Path to domain PDDL file
            problem_file: Path to problem PDDL file
            plan_file: Path to plan file

        Returns:
            Augmentation result dictionary
        """
        domain_pddl = domain_file.read_text(encoding='utf-8')
        problem_pddl = problem_file.read_text(encoding='utf-8')
        plan = plan_file.read_text(encoding='utf-8')

        problem_id = problem_file.stem
        domain_name = domain_file.parent.name

        return self.augment_single(domain_pddl, problem_pddl, plan,
                                   problem_id, domain_name)

    def process_directory(self, input_dir: Path, output_file: Path,
                          domain_filename: str = "domain3.pddl",
                          problems_subdir: str = "sft_500",
                          plan_extension: str = ".soln") -> int:
        """
        Process a directory structure with multiple problems.

        Expected structure:
            input_dir/
                domain_name/
                    domain3.pddl
                    sft_500/
                        problem1.pddl
                        problem1.soln
                        problem2.pddl
                        problem2.soln
                        ...

        Args:
            input_dir: Root input directory
            output_file: Output JSONL file path
            domain_filename: Name of domain file
            problems_subdir: Subdirectory containing problems
            plan_extension: Extension of plan files

        Returns:
            Number of entries processed
        """
        count = 0

        with open(output_file, 'w', encoding='utf-8') as out_f:
            # Find all domain directories
            for domain_dir in sorted(input_dir.iterdir()):
                if not domain_dir.is_dir():
                    continue

                domain_file = domain_dir / domain_filename
                if not domain_file.exists():
                    continue

                problems_dir = domain_dir / problems_subdir
                if not problems_dir.exists():
                    continue

                domain_pddl = domain_file.read_text(encoding='utf-8')

                # Process each problem file
                for problem_file in sorted(problems_dir.glob("*.pddl")):
                    plan_file = problem_file.with_suffix(plan_extension)
                    if not plan_file.exists():
                        continue

                    problem_pddl = problem_file.read_text(encoding='utf-8')
                    plan = plan_file.read_text(encoding='utf-8')

                    result = self.augment_single(
                        domain_pddl, problem_pddl, plan,
                        problem_id=problem_file.stem,
                        domain_name=domain_dir.name
                    )

                    # Write JSONL entries (obfuscated + optional original)
                    for entry in result.get("jsonl_entries", [result["jsonl_entry"]]):
                        out_f.write(json.dumps(entry, ensure_ascii=False) + '\n')
                    count += 1

        return count

    def process_domains_to_separate_files(self, input_dir: Path, output_dir: Path,
                                          domains: Optional[List[str]] = None,
                                          domain_filename: str = "domain3.pddl",
                                          problems_subdir: str = "sft_500",
                                          plan_extension: str = ".soln") -> Dict[str, int]:
        """
        Process multiple domains and output separate JSONL files for each domain.

        Expected input structure:
            input_dir/
                blocksworld/
                    domain3.pddl
                    sft_500/
                        problem1.pddl
                        problem1.soln
                        ...
                ferry/
                    domain3.pddl
                    sft_500/
                        ...

        Output structure:
            output_dir/
                blocksworld.jsonl
                ferry.jsonl
                ...
                combined.jsonl (all domains combined)

        Args:
            input_dir: Root input directory (e.g., pddl3/)
            output_dir: Output directory for JSONL files (e.g., /jfan5/sft_randomized/)
            domains: List of domain names to process (None = all found domains)
            domain_filename: Name of domain file
            problems_subdir: Subdirectory containing problems
            plan_extension: Extension of plan files

        Returns:
            Dictionary mapping domain names to number of entries processed
        """
        # Create output directory
        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        results = {}
        all_entries = []

        # Find domain directories
        if domains:
            domain_dirs = [input_dir / d for d in domains if (input_dir / d).is_dir()]
        else:
            domain_dirs = [d for d in sorted(input_dir.iterdir()) if d.is_dir()]

        for domain_dir in domain_dirs:
            domain_name = domain_dir.name

            domain_file = domain_dir / domain_filename
            if not domain_file.exists():
                print(f"  Skipping {domain_name}: no {domain_filename} found")
                continue

            problems_dir = domain_dir / problems_subdir
            if not problems_dir.exists():
                print(f"  Skipping {domain_name}: no {problems_subdir}/ directory found")
                continue

            print(f"Processing domain: {domain_name}")

            domain_pddl = domain_file.read_text(encoding='utf-8')
            domain_entries = []

            # Process each problem file
            problem_files = sorted(problems_dir.glob("*.pddl"))
            for problem_file in problem_files:
                plan_file = problem_file.with_suffix(plan_extension)
                if not plan_file.exists():
                    continue

                problem_pddl = problem_file.read_text(encoding='utf-8')
                plan = plan_file.read_text(encoding='utf-8')

                result = self.augment_single(
                    domain_pddl, problem_pddl, plan,
                    problem_id=problem_file.stem,
                    domain_name=domain_name
                )

                domain_entries.extend(result.get("jsonl_entries", [result["jsonl_entry"]]))

            # Write domain-specific JSONL file
            if domain_entries:
                domain_output_file = output_dir / f"{domain_name}.jsonl"
                with open(domain_output_file, 'w', encoding='utf-8') as f:
                    for entry in domain_entries:
                        f.write(json.dumps(entry, ensure_ascii=False) + '\n')

                results[domain_name] = len(domain_entries)
                all_entries.extend(domain_entries)
                print(f"  Wrote {len(domain_entries)} entries to {domain_output_file}")

        # Write combined JSONL file
        if all_entries:
            combined_output_file = output_dir / "combined.jsonl"
            with open(combined_output_file, 'w', encoding='utf-8') as f:
                for entry in all_entries:
                    f.write(json.dumps(entry, ensure_ascii=False) + '\n')
            print(f"\nWrote {len(all_entries)} total entries to {combined_output_file}")

        return results

    def write_jsonl(self, entries: List[Dict], output_file: Path):
        """
        Write entries to JSONL file.

        Args:
            entries: List of augmentation result dictionaries
            output_file: Output file path
        """
        with open(output_file, 'w', encoding='utf-8') as f:
            for entry in entries:
                jsonl_entry = entry.get("jsonl_entry", entry)
                f.write(json.dumps(jsonl_entry, ensure_ascii=False) + '\n')


def main():
    parser = argparse.ArgumentParser(
        description='PDDL Data Augmentation for LLM Fine-Tuning',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Process single files
  python pddl_augment.py --domain domain.pddl --problem problem.pddl --plan plan.txt -o output.jsonl

  # Process directory structure (single output file)
  python pddl_augment.py --input_dir pddl3/ -o training_data.jsonl

  # Process multiple domains and output separate JSONL per domain
  python pddl_augment.py --input_dir pddl3/ --output_dir /jfan5/sft_randomized --domains blocksworld ferry spanner grippers

  # With custom seed and instruction
  python pddl_augment.py --domain d.pddl --problem p.pddl --plan plan.txt -o out.jsonl --seed 42 --instruction "Solve this planning problem:"
"""
    )

    # Input options
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument('--domain', type=str, help='Path to domain PDDL file')
    input_group.add_argument('--input_dir', type=str, help='Input directory with domain subdirectories')

    parser.add_argument('--problem', type=str, help='Path to problem PDDL file (required with --domain)')
    parser.add_argument('--plan', type=str, help='Path to plan file (required with --domain)')

    # Output options
    parser.add_argument('-o', '--output', type=str, help='Output JSONL file path (for single file output)')
    parser.add_argument('--output_dir', type=str, help='Output directory for per-domain JSONL files')
    parser.add_argument('--domains', nargs='+', help='List of domain names to process (default: all)')

    # Configuration
    parser.add_argument('--seed', type=int, default=None, help='Random seed for obfuscation')
    parser.add_argument('--instruction', type=str, default=None, help='Custom instruction for JSONL')
    parser.add_argument('--no-mix-original', action='store_false', dest='mix_original',
                        help='Disable adding original (non-obfuscated) entries; default mixes 1:1 with obfuscated')
    parser.add_argument('--verbose', '-v', action='store_true', help='Verbose output')
    parser.add_argument('--problems_subdir', type=str, default='sft_500',
                        help='Subdirectory containing problems (default: sft_500)')

    parser.set_defaults(mix_original=True)

    args = parser.parse_args()

    # Validate arguments
    if args.domain and (not args.problem or not args.plan):
        parser.error("--problem and --plan are required when using --domain")

    if args.input_dir and not args.output and not args.output_dir:
        parser.error("Either --output or --output_dir is required when using --input_dir")

    # Create augmenter
    augmenter = PDDLAugmenter(
        seed=args.seed,
        instruction=args.instruction,
        mix_original=args.mix_original
    )

    if args.domain:
        # Process single file set
        result = augmenter.augment_from_files(
            Path(args.domain),
            Path(args.problem),
            Path(args.plan)
        )

        # Write output
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        augmenter.write_jsonl([result], output_path)

        if args.verbose:
            print(f"Processed: {args.problem}")
            print(f"Mapping: {json.dumps(result['mapping'], indent=2)}")

        print(f"Output written to: {args.output}")

    elif args.output_dir:
        # Process directory with separate output files per domain
        print("=" * 70)
        print("PDDL Data Augmentation - Per-Domain JSONL Output")
        print("=" * 70)
        print(f"Input directory: {args.input_dir}")
        print(f"Output directory: {args.output_dir}")
        print(f"Problems subdirectory: {args.problems_subdir}")
        if args.domains:
            print(f"Domains: {', '.join(args.domains)}")
        print("=" * 70 + "\n")

        results = augmenter.process_domains_to_separate_files(
            Path(args.input_dir),
            Path(args.output_dir),
            domains=args.domains,
            problems_subdir=args.problems_subdir
        )

        print("\n" + "=" * 70)
        print("Summary:")
        print("=" * 70)
        total = 0
        for domain_name, count in results.items():
            print(f"  {domain_name}: {count} entries")
            total += count
        print(f"  Total: {total} entries")
        print("=" * 70)

    else:
        # Process directory (single output file)
        count = augmenter.process_directory(
            Path(args.input_dir),
            Path(args.output),
            problems_subdir=args.problems_subdir
        )

        print(f"Processed {count} problem-plan pairs")
        print(f"Output written to: {args.output}")


# ==============================================================================
# Example Usage
# ==============================================================================

def run_example():
    """
    Demonstrate the PDDL augmentation with a simple Blocksworld example.
    """
    print("=" * 70)
    print("PDDL Data Augmentation Example - Blocksworld")
    print("=" * 70)

    # Example Blocksworld domain
    example_domain = """(define (domain blocksworld)
  (:requirements :strips :constraints :negative-preconditions)
  (:predicates (clear ?x)
               (on-table ?x)
               (arm-empty)
               (holding ?x)
               (on ?x ?y))

  (:action pick-up
    :parameters (?ob)
    :precondition (and (clear ?ob) (on-table ?ob) (arm-empty))
    :effect (and (holding ?ob) (not (clear ?ob)) (not (on-table ?ob))
                 (not (arm-empty))))

  (:action put-down
    :parameters (?ob)
    :precondition (holding ?ob)
    :effect (and (clear ?ob) (arm-empty) (on-table ?ob)
                 (not (holding ?ob))))

  (:action stack
    :parameters (?ob ?underob)
    :precondition (and (clear ?underob) (holding ?ob))
    :effect (and (arm-empty) (clear ?ob) (on ?ob ?underob)
                 (not (clear ?underob)) (not (holding ?ob))))

  (:action unstack
    :parameters (?ob ?underob)
    :precondition (and (on ?ob ?underob) (clear ?ob) (arm-empty))
    :effect (and (holding ?ob) (clear ?underob)
                 (not (on ?ob ?underob)) (not (clear ?ob)) (not (arm-empty)))))
"""

    # Example problem
    example_problem = """(define (problem BW-rand-3)
(:domain blocksworld)
(:objects block_a block_b block_c)
(:init
  (arm-empty)
  (on-table block_a)
  (on block_b block_a)
  (on block_c block_b)
  (clear block_c)
)
(:goal
  (and
    (on block_a block_b)
    (on block_b block_c)
    (on-table block_c))
)
(:constraints
  (sometime-before (on block_b block_c) (on block_a block_b))
)
)
"""

    # Example plan
    example_plan = """(unstack block_c block_b)
(put-down block_c)
(unstack block_b block_a)
(put-down block_b)
(pick-up block_a)
(stack block_a block_b)
(unstack block_a block_b)
(put-down block_a)
(pick-up block_b)
(stack block_b block_c)
(pick-up block_a)
(stack block_a block_b)
"""

    # Create augmenter with fixed seed for reproducibility
    augmenter = PDDLAugmenter(seed=42)

    # Perform augmentation
    result = augmenter.augment_single(
        example_domain,
        example_problem,
        example_plan,
        problem_id="blocksworld_example",
        domain_name="blocksworld"
    )

    # Display results
    print("\n" + "-" * 70)
    print("ORIGINAL DOMAIN (excerpt):")
    print("-" * 70)
    print(result['original']['domain'][:500] + "...")

    print("\n" + "-" * 70)
    print("OBFUSCATED DOMAIN (excerpt):")
    print("-" * 70)
    print(result['obfuscated']['domain'][:500] + "...")

    print("\n" + "-" * 70)
    print("ORIGINAL PROBLEM:")
    print("-" * 70)
    print(result['original']['problem'])

    print("\n" + "-" * 70)
    print("OBFUSCATED PROBLEM:")
    print("-" * 70)
    print(result['obfuscated']['problem'])

    print("\n" + "-" * 70)
    print("ORIGINAL PLAN:")
    print("-" * 70)
    print(result['original']['plan'])

    print("\n" + "-" * 70)
    print("OBFUSCATED PLAN:")
    print("-" * 70)
    print(result['obfuscated']['plan'])

    print("\n" + "-" * 70)
    print("MAPPING:")
    print("-" * 70)
    print(json.dumps(result['mapping'], indent=2))

    print("\n" + "-" * 70)
    print("JSONL ENTRY (for SFT training):")
    print("-" * 70)
    print(json.dumps(result['jsonl_entry'], indent=2, ensure_ascii=False)[:1500] + "...")

    # Save example output
    example_output = Path("example_augmented.jsonl")
    augmenter.write_jsonl([result], example_output)
    print(f"\n✅ Example JSONL written to: {example_output}")

    print("\n" + "=" * 70)
    print("Example completed successfully!")
    print("=" * 70)


if __name__ == '__main__':
    import sys

    if len(sys.argv) == 1:
        # No arguments: run example
        run_example()
    elif '--example' in sys.argv:
        run_example()
    else:
        main()
