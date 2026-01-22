#!/usr/bin/env python3
"""
PDDL-to-Natural-Language Conversion Tool

Converts PDDL3 problem files to structured natural language descriptions
for testing LLM generalization on planning tasks.

Usage:
    python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/
    python script/pddl_to_nl.py --input path/to/single_file.pddl
    python script/pddl_to_nl.py --input pddl3/ --recursive --verbose
"""

import argparse
import os
import re
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, field


# ==============================================================================
# 1. DATA STRUCTURES
# ==============================================================================

@dataclass
class PDDLProblem:
    """Parsed PDDL problem representation."""
    problem_name: str = ""
    domain_name: str = ""
    objects: List[str] = field(default_factory=list)
    init: List[Tuple[str, List[str]]] = field(default_factory=list)  # (predicate_name, [args])
    goal: List[Tuple[str, List[str]]] = field(default_factory=list)
    constraints: List[Dict[str, Any]] = field(default_factory=list)
    raw_content: str = ""
    parse_errors: List[str] = field(default_factory=list)


# ==============================================================================
# 2. PDDL PARSER
# ==============================================================================

class PDDLProblemParser:
    """Parser for PDDL problem files."""

    def __init__(self):
        # Regex patterns for extraction
        self.problem_name_pattern = re.compile(
            r'\(define\s+\(problem\s+([\w\-]+)\)', re.IGNORECASE | re.DOTALL
        )
        self.domain_name_pattern = re.compile(
            r'\(:domain\s+([\w\-]+)\)', re.IGNORECASE
        )
        self.predicate_pattern = re.compile(
            r'\(\s*([\w\-]+)([^)]*)\)', re.IGNORECASE
        )

    def _strip_comments(self, content: str) -> str:
        """Remove PDDL comments (lines starting with ;)."""
        return re.sub(r';[^\n]*', '', content)

    def _find_balanced_section(self, content: str, section_name: str) -> Optional[str]:
        """
        Find a balanced parenthesis section like (:init ...) or (:goal ...).
        Returns the content inside the section (excluding the section keyword).
        """
        pattern = re.compile(rf'\(:{section_name}\s+', re.IGNORECASE)
        match = pattern.search(content)
        if not match:
            return None

        start_pos = match.end()
        depth = 1
        i = start_pos

        while i < len(content) and depth > 0:
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
            i += 1

        if depth == 0:
            return content[start_pos:i-1].strip()
        return None

    def _parse_predicates(self, block: str) -> List[Tuple[str, List[str]]]:
        """
        Parse predicates from a block like:
        (arm-empty) (on-table b1) (on b2 b3)
        Returns list of (predicate_name, [args]) tuples.
        """
        predicates = []
        for match in self.predicate_pattern.finditer(block):
            pred_name = match.group(1).lower()
            args_str = match.group(2).strip()
            args = [a.strip() for a in args_str.split() if a.strip()]
            predicates.append((pred_name, args))
        return predicates

    def _parse_goal_block(self, goal_block: str) -> List[Tuple[str, List[str]]]:
        """Parse goal block, handling (and ...) wrapper."""
        # Check if wrapped in (and ...)
        and_match = re.search(r'\(\s*and\s+(.*)\)', goal_block, re.IGNORECASE | re.DOTALL)
        if and_match:
            inner = and_match.group(1)
        else:
            inner = goal_block

        return self._parse_predicates(inner)

    def _parse_objects(self, objects_block: str) -> List[str]:
        """
        Parse objects from block like: b1 b2 b3
        Handles untyped objects (blocksworld style) and typed objects (obj - type).
        """
        objects = []
        # Remove type annotations (- type)
        cleaned = re.sub(r'-\s+[\w\-]+', '', objects_block)
        tokens = cleaned.split()
        for token in tokens:
            token = token.strip()
            if token and re.match(r'^[a-zA-Z0-9_\-]+$', token):
                objects.append(token)
        return objects

    def _parse_constraints(self, constraints_block: str) -> List[Dict[str, Any]]:
        """
        Parse PDDL3 constraints.
        Currently supports: sometime-before
        """
        constraints = []

        # Match sometime-before constraints
        # (sometime-before (pred1 args) (pred2 args))
        sb_pattern = re.compile(
            r'\(\s*sometime-before\s+\(([^)]+)\)\s+\(([^)]+)\)\s*\)',
            re.IGNORECASE
        )

        for match in sb_pattern.finditer(constraints_block):
            first_raw = match.group(1).strip()
            second_raw = match.group(2).strip()

            # Parse each predicate
            first_parts = first_raw.split()
            second_parts = second_raw.split()

            first_pred = (first_parts[0].lower(), first_parts[1:]) if first_parts else ("", [])
            second_pred = (second_parts[0].lower(), second_parts[1:]) if second_parts else ("", [])

            constraints.append({
                "type": "sometime-before",
                "first": first_pred,  # (predicate, [args])
                "second": second_pred  # (predicate, [args])
            })

        # Match always constraints
        always_pattern = re.compile(
            r'\(\s*always\s+\(([^)]+)\)\s*\)',
            re.IGNORECASE
        )
        for match in always_pattern.finditer(constraints_block):
            pred_raw = match.group(1).strip()
            parts = pred_raw.split()
            pred = (parts[0].lower(), parts[1:]) if parts else ("", [])
            constraints.append({
                "type": "always",
                "predicate": pred
            })

        # Match always-not constraints
        always_not_pattern = re.compile(
            r'\(\s*always\s+\(\s*not\s+\(([^)]+)\)\s*\)\s*\)',
            re.IGNORECASE
        )
        for match in always_not_pattern.finditer(constraints_block):
            pred_raw = match.group(1).strip()
            parts = pred_raw.split()
            pred = (parts[0].lower(), parts[1:]) if parts else ("", [])
            constraints.append({
                "type": "always-not",
                "predicate": pred
            })

        # Match at-most-once constraints
        amo_pattern = re.compile(
            r'\(\s*at-most-once\s+\(([^)]+)\)\s*\)',
            re.IGNORECASE
        )
        for match in amo_pattern.finditer(constraints_block):
            pred_raw = match.group(1).strip()
            parts = pred_raw.split()
            pred = (parts[0].lower(), parts[1:]) if parts else ("", [])
            constraints.append({
                "type": "at-most-once",
                "predicate": pred
            })

        return constraints

    def parse(self, content: str) -> PDDLProblem:
        """Parse PDDL problem content and return structured representation."""
        problem = PDDLProblem(raw_content=content)

        # Strip comments
        clean_content = self._strip_comments(content)

        # Extract problem name
        prob_match = self.problem_name_pattern.search(clean_content)
        if prob_match:
            problem.problem_name = prob_match.group(1)
        else:
            problem.parse_errors.append("Could not extract problem name")

        # Extract domain name
        dom_match = self.domain_name_pattern.search(clean_content)
        if dom_match:
            problem.domain_name = dom_match.group(1)
        else:
            problem.parse_errors.append("Could not extract domain name")

        # Extract objects
        objects_block = self._find_balanced_section(clean_content, "objects")
        if objects_block:
            problem.objects = self._parse_objects(objects_block)

        # Extract init
        init_block = self._find_balanced_section(clean_content, "init")
        if init_block:
            problem.init = self._parse_predicates(init_block)
        else:
            problem.parse_errors.append("Could not extract :init section")

        # Extract goal
        goal_block = self._find_balanced_section(clean_content, "goal")
        if goal_block:
            problem.goal = self._parse_goal_block(goal_block)
        else:
            problem.parse_errors.append("Could not extract :goal section")

        # Extract constraints
        constraints_block = self._find_balanced_section(clean_content, "constraints")
        if constraints_block:
            problem.constraints = self._parse_constraints(constraints_block)

        return problem


# ==============================================================================
# 3. NATURAL LANGUAGE TEMPLATES
# ==============================================================================

class NLTemplates:
    """Natural language templates for PDDL predicates by domain."""

    # Blocksworld predicate templates
    BLOCKSWORLD = {
        "on": "Block {0} is on block {1}.",
        "on-table": "Block {0} is on the table.",
        "clear": "Block {0} is clear (nothing on top).",
        "arm-empty": "The robot arm is empty.",
        "holding": "The robot is holding block {0}.",
    }

    # Ferry domain predicate templates
    FERRY = {
        "at-ferry": "The ferry is at location {0}.",
        "at": "{0} is at location {1}.",
        "on-ferry": "{0} is on the ferry.",
        "empty-ferry": "The ferry is empty.",
    }

    # Grippers domain predicate templates
    GRIPPERS = {
        "at-robby": "The robot is at room {0}.",
        "at": "Object {0} is at room {1}.",
        "free": "Gripper {0} is free.",
        "carry": "Gripper {0} is carrying object {1}.",
    }

    # Spanner domain predicate templates
    SPANNER = {
        "at": "{0} is at location {1}.",
        "carrying": "The man is carrying {0}.",
        "useable": "Spanner {0} is useable.",
        "link": "Location {0} is connected to location {1}.",
        "tightened": "Nut {0} is tightened.",
        "loose": "Nut {0} is loose.",
    }

    # Delivery domain predicate templates
    DELIVERY = {
        "at": "{0} is at location {1}.",
        "in": "Package {0} is in truck {1}.",
        "road": "There is a road from {0} to {1}.",
        "delivered": "Package {0} has been delivered.",
    }

    # Domain name to template mapping
    DOMAIN_TEMPLATES = {
        "blocksworld": BLOCKSWORLD,
        "ferry": FERRY,
        "grippers": GRIPPERS,
        "spanner": SPANNER,
        "delivery": DELIVERY,
    }

    @classmethod
    def get_templates(cls, domain_name: str) -> Dict[str, str]:
        """Get templates for a domain, with fallback to empty dict."""
        return cls.DOMAIN_TEMPLATES.get(domain_name.lower(), {})

    @classmethod
    def predicate_to_nl(cls, domain_name: str, predicate: str, args: List[str]) -> str:
        """
        Convert a predicate to natural language.
        Falls back to generic format if no template exists.
        """
        templates = cls.get_templates(domain_name)
        pred_lower = predicate.lower()

        if pred_lower in templates:
            template = templates[pred_lower]
            try:
                return template.format(*args)
            except (IndexError, KeyError):
                # Template mismatch, use generic
                pass

        # Generic fallback
        if args:
            return f"{predicate}({', '.join(args)}) is true."
        else:
            return f"{predicate} is true."


# ==============================================================================
# 4. CONSTRAINT TEMPLATES
# ==============================================================================

class ConstraintNL:
    """Natural language generation for PDDL3 constraints."""

    @staticmethod
    def predicate_to_quote(domain_name: str, predicate: Tuple[str, List[str]]) -> str:
        """Convert predicate tuple to quoted NL form."""
        pred_name, args = predicate
        nl = NLTemplates.predicate_to_nl(domain_name, pred_name, args)
        # Remove trailing period for use in constraint sentences
        if nl.endswith('.'):
            nl = nl[:-1]
        return f'"{nl}"'

    @classmethod
    def constraint_to_nl(cls, domain_name: str, constraint: Dict[str, Any]) -> str:
        """Convert a constraint to natural language."""
        ctype = constraint.get("type", "")

        if ctype == "sometime-before":
            first = constraint.get("first", ("", []))
            second = constraint.get("second", ("", []))
            first_nl = cls.predicate_to_quote(domain_name, first)
            second_nl = cls.predicate_to_quote(domain_name, second)
            return f'Before {second_nl} becomes true, {first_nl} must be true at some point.'

        elif ctype == "always":
            pred = constraint.get("predicate", ("", []))
            pred_nl = cls.predicate_to_quote(domain_name, pred)
            return f'{pred_nl} must always be true throughout the plan.'

        elif ctype == "always-not":
            pred = constraint.get("predicate", ("", []))
            pred_nl = cls.predicate_to_quote(domain_name, pred)
            return f'{pred_nl} must never become true during the plan.'

        elif ctype == "at-most-once":
            pred = constraint.get("predicate", ("", []))
            pred_nl = cls.predicate_to_quote(domain_name, pred)
            return f'{pred_nl} can become true at most once during the plan.'

        else:
            # Unknown constraint type - preserve raw
            return f"Unknown constraint: {constraint}"


# ==============================================================================
# 5. NL DOCUMENT GENERATOR
# ==============================================================================

class NLDocumentGenerator:
    """Generates structured natural language document from parsed PDDL."""

    def __init__(self, domain_name: str = ""):
        self.domain_name = domain_name.lower() if domain_name else ""

    def _format_objects(self, objects: List[str]) -> str:
        """Format objects section."""
        if not objects:
            return "None"

        # For blocksworld, label as blocks
        if self.domain_name == "blocksworld":
            return f"Blocks: {', '.join(objects)}"

        return ', '.join(objects)

    def _format_init(self, init: List[Tuple[str, List[str]]]) -> str:
        """Format initial state as bullet list."""
        if not init:
            return "- (empty initial state)"

        lines = []
        for pred_name, args in init:
            nl = NLTemplates.predicate_to_nl(self.domain_name, pred_name, args)
            lines.append(f"- {nl}")
        return '\n'.join(lines)

    def _format_goal(self, goal: List[Tuple[str, List[str]]]) -> str:
        """Format goal section."""
        if not goal:
            return "No goals specified."

        lines = ["All of the following must be true:"]
        for pred_name, args in goal:
            nl = NLTemplates.predicate_to_nl(self.domain_name, pred_name, args)
            lines.append(f"  - {nl}")
        return '\n'.join(lines)

    def _format_constraints(self, constraints: List[Dict[str, Any]]) -> str:
        """Format constraints section."""
        if not constraints:
            return "None"

        lines = []
        for constraint in constraints:
            nl = ConstraintNL.constraint_to_nl(self.domain_name, constraint)
            lines.append(f"- {nl}")
        return '\n'.join(lines)

    def _format_notes(self, problem: PDDLProblem) -> str:
        """Format notes section with any parse errors or warnings."""
        notes = []

        if problem.parse_errors:
            notes.append("Parse warnings:")
            for err in problem.parse_errors:
                notes.append(f"  - {err}")

        return '\n'.join(notes) if notes else ""

    def generate(self, problem: PDDLProblem) -> str:
        """Generate the full NL document from a parsed PDDL problem."""
        self.domain_name = problem.domain_name.lower()

        sections = []

        # Title
        sections.append("## Title")
        sections.append(f"Problem: {problem.problem_name or 'Unknown'}")
        sections.append("")

        # Domain / Scenario
        sections.append("## Domain / Scenario")
        sections.append(f"Domain: {problem.domain_name or 'Unknown'}")
        sections.append("")

        # Objects
        sections.append("## Objects")
        sections.append(self._format_objects(problem.objects))
        sections.append("")

        # Initial State
        sections.append("## Initial State")
        sections.append(self._format_init(problem.init))
        sections.append("")

        # Goal
        sections.append("## Goal")
        sections.append(self._format_goal(problem.goal))
        sections.append("")

        # Constraints
        sections.append("## Constraints (PDDL3)")
        sections.append(self._format_constraints(problem.constraints))

        # Notes (only if there's content)
        notes = self._format_notes(problem)
        if notes:
            sections.append("")
            sections.append("## Notes")
            sections.append(notes)

        return '\n'.join(sections)


# ==============================================================================
# 6. FILE PROCESSOR
# ==============================================================================

class PDDLToNLConverter:
    """Main converter class that handles file I/O and batch processing."""

    def __init__(self, verbose: bool = False):
        self.parser = PDDLProblemParser()
        self.verbose = verbose

    def _log(self, message: str):
        """Print message if verbose mode is enabled."""
        if self.verbose:
            print(message)

    def convert_file(self, input_path: Path, output_path: Path, dry_run: bool = False) -> bool:
        """
        Convert a single PDDL file to natural language.

        Args:
            input_path: Path to input PDDL file
            output_path: Path for output .txt file
            dry_run: If True, parse but don't write files

        Returns:
            True if successful, False otherwise
        """
        try:
            # Read input file
            try:
                content = input_path.read_text(encoding='utf-8')
            except UnicodeDecodeError:
                content = input_path.read_text(encoding='latin-1')

            # Parse PDDL
            problem = self.parser.parse(content)

            # Generate NL document
            generator = NLDocumentGenerator(problem.domain_name)
            nl_document = generator.generate(problem)

            # Write output (unless dry run)
            if not dry_run:
                output_path.parent.mkdir(parents=True, exist_ok=True)
                output_path.write_text(nl_document, encoding='utf-8')

            self._log(f"  Converted: {input_path.name} -> {output_path.name}")
            return True

        except Exception as e:
            self._log(f"  ERROR converting {input_path.name}: {e}")
            return False

    def convert_directory(
        self,
        input_dir: Path,
        output_dir: Optional[Path] = None,
        recursive: bool = True,
        dry_run: bool = False
    ) -> Dict[str, int]:
        """
        Convert all PDDL files in a directory.

        Args:
            input_dir: Input directory containing PDDL files
            output_dir: Output directory (default: testing_problems_nl/ under input_dir)
            recursive: Whether to process subdirectories
            dry_run: If True, parse but don't write files

        Returns:
            Dict with counts: {"success": N, "failed": M, "total": N+M}
        """
        if output_dir is None:
            output_dir = input_dir / "testing_problems_nl"

        # Find all PDDL files
        if recursive:
            pddl_files = list(input_dir.rglob("*.pddl"))
        else:
            pddl_files = list(input_dir.glob("*.pddl"))

        # Filter out domain files
        pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

        if not pddl_files:
            print(f"No PDDL problem files found in {input_dir}")
            return {"success": 0, "failed": 0, "total": 0}

        print(f"Found {len(pddl_files)} PDDL problem files")
        print(f"Output directory: {output_dir}")
        if dry_run:
            print("(Dry run - no files will be written)")
        print("-" * 50)

        success = 0
        failed = 0

        for pddl_file in sorted(pddl_files):
            # Compute output path
            # input/file.pddl -> output_dir/file.txt
            output_file = output_dir / f"{pddl_file.stem}.txt"

            if self.convert_file(pddl_file, output_file, dry_run):
                success += 1
            else:
                failed += 1

        print("-" * 50)
        print(f"Conversion complete!")
        print(f"  Success: {success}")
        print(f"  Failed: {failed}")
        print(f"  Total: {success + failed}")

        return {"success": success, "failed": failed, "total": success + failed}

    def convert(
        self,
        input_path: Path,
        output_path: Optional[Path] = None,
        recursive: bool = True,
        dry_run: bool = False
    ) -> Dict[str, int]:
        """
        Main entry point for conversion.
        Handles both single files and directories.
        """
        if input_path.is_file():
            # Single file conversion
            if output_path is None:
                output_path = input_path.parent / "testing_problems_nl" / f"{input_path.stem}.txt"

            success = self.convert_file(input_path, output_path, dry_run)
            return {"success": 1 if success else 0, "failed": 0 if success else 1, "total": 1}

        elif input_path.is_dir():
            return self.convert_directory(input_path, output_path, recursive, dry_run)

        else:
            print(f"Error: {input_path} is not a valid file or directory")
            return {"success": 0, "failed": 0, "total": 0}


# ==============================================================================
# 7. CLI INTERFACE
# ==============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="Convert PDDL3 problem files to structured natural language descriptions.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/
  python script/pddl_to_nl.py --input path/to/single_file.pddl
  python script/pddl_to_nl.py --input pddl3/ --recursive --verbose
  python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/ --dry-run
        """
    )

    parser.add_argument(
        '--input', '-i',
        type=str,
        required=True,
        help='Input file or directory containing PDDL files'
    )

    parser.add_argument(
        '--output-dir', '-o',
        type=str,
        default=None,
        help='Output directory (default: testing_problems_nl/ in input dir)'
    )

    parser.add_argument(
        '--recursive', '-r',
        action='store_true',
        default=True,
        help='Traverse subdirectories (default: True)'
    )

    parser.add_argument(
        '--no-recursive',
        action='store_false',
        dest='recursive',
        help='Do not traverse subdirectories'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose logging'
    )

    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Parse files but do not write output'
    )

    args = parser.parse_args()

    input_path = Path(args.input)
    output_path = Path(args.output_dir) if args.output_dir else None

    if not input_path.exists():
        print(f"Error: Input path does not exist: {input_path}")
        return 1

    converter = PDDLToNLConverter(verbose=args.verbose)
    results = converter.convert(
        input_path=input_path,
        output_path=output_path,
        recursive=args.recursive,
        dry_run=args.dry_run
    )

    return 0 if results["failed"] == 0 else 1


if __name__ == '__main__':
    exit(main())
