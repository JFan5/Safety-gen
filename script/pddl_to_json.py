#!/usr/bin/env python3
"""
PDDL-to-JSON Conversion Tool

Converts PDDL3 domain and problem files to structured JSON format
for testing LLM generalization on planning tasks.

Usage:
    python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/
    python script/pddl_to_json.py --input path/to/single_file.pddl
    python script/pddl_to_json.py --domain-file pddl3/blocksworld/domain3.pddl
"""

import argparse
import json
import re
import shutil
from pathlib import Path
from typing import Dict, List, Optional, Any, Tuple

# Import parsers from pddl_to_nl.py
from pddl_to_nl import (
    PDDLExpr, ExprType, PDDLProblem, PDDLDomain,
    PDDLPredicate, PDDLAction,
    PDDLProblemParser, PDDLDomainParser,
    tokenize, parse_sexpr
)


# ==============================================================================
# 1. AST TO JSON CONVERTER
# ==============================================================================

class PDDLToJSONConverter:
    """
    Convert PDDL AST structures to JSON-serializable dictionaries.

    Handles:
    - Predicates: {"pred": "name", "args": [...], "negated": false}
    - Logical operators: {"and": [...]}, {"or": [...]}, {"not": {...}}
    - Quantifiers: {"forall": {"vars": [...], "body": {...}}}
    - PDDL3 constraints: {"always": {...}}, {"sometime_before": [{...}, {...}]}
    - Conditional effects: {"when": {"condition": {...}, "effect": {...}}}
    """

    def __init__(self):
        pass

    def expr_to_json(self, expr: PDDLExpr) -> Dict[str, Any]:
        """
        Recursively convert a PDDLExpr AST node to a JSON-serializable dictionary.

        Args:
            expr: The PDDL expression AST node

        Returns:
            A dictionary representing the expression in JSON format
        """
        if expr.expr_type == ExprType.PREDICATE:
            return {
                "pred": expr.predicate_name,
                "args": expr.args,
                "negated": False
            }

        elif expr.expr_type == ExprType.NOT:
            if expr.children:
                inner = expr.children[0]
                # Special case: (not (predicate ...)) -> predicate with negated=true
                if inner.expr_type == ExprType.PREDICATE:
                    return {
                        "pred": inner.predicate_name,
                        "args": inner.args,
                        "negated": True
                    }
                # Otherwise, wrap in "not" operator
                return {"not": self.expr_to_json(inner)}
            return {"not": None}

        elif expr.expr_type == ExprType.AND:
            return {"and": [self.expr_to_json(c) for c in expr.children]}

        elif expr.expr_type == ExprType.OR:
            return {"or": [self.expr_to_json(c) for c in expr.children]}

        elif expr.expr_type == ExprType.IMPLY:
            if len(expr.children) >= 2:
                return {
                    "imply": [
                        self.expr_to_json(expr.children[0]),
                        self.expr_to_json(expr.children[1])
                    ]
                }
            return {"imply": []}

        elif expr.expr_type == ExprType.FORALL:
            vars_list = [{"var": v[0], "type": v[1]} for v in expr.variables]
            body = self.expr_to_json(expr.children[0]) if expr.children else None
            return {
                "forall": {
                    "vars": vars_list,
                    "body": body
                }
            }

        elif expr.expr_type == ExprType.EXISTS:
            vars_list = [{"var": v[0], "type": v[1]} for v in expr.variables]
            body = self.expr_to_json(expr.children[0]) if expr.children else None
            return {
                "exists": {
                    "vars": vars_list,
                    "body": body
                }
            }

        elif expr.expr_type == ExprType.ALWAYS:
            if expr.children:
                return {"always": self.expr_to_json(expr.children[0])}
            return {"always": None}

        elif expr.expr_type == ExprType.SOMETIME:
            if expr.children:
                return {"sometime": self.expr_to_json(expr.children[0])}
            return {"sometime": None}

        elif expr.expr_type == ExprType.SOMETIME_BEFORE:
            if len(expr.children) >= 2:
                return {
                    "sometime_before": [
                        self.expr_to_json(expr.children[0]),
                        self.expr_to_json(expr.children[1])
                    ]
                }
            return {"sometime_before": []}

        elif expr.expr_type == ExprType.SOMETIME_AFTER:
            if len(expr.children) >= 2:
                return {
                    "sometime_after": [
                        self.expr_to_json(expr.children[0]),
                        self.expr_to_json(expr.children[1])
                    ]
                }
            return {"sometime_after": []}

        elif expr.expr_type == ExprType.AT_MOST_ONCE:
            if expr.children:
                return {"at_most_once": self.expr_to_json(expr.children[0])}
            return {"at_most_once": None}

        elif expr.expr_type == ExprType.AT_END:
            if expr.children:
                return {"at_end": self.expr_to_json(expr.children[0])}
            return {"at_end": None}

        elif expr.expr_type == ExprType.HOLD_DURING:
            # hold-during has time values and a body
            # Assuming format: (hold-during t1 t2 body)
            # children[0] and children[1] might be time values stored as predicates
            if len(expr.children) >= 3:
                t1 = self._extract_time_value(expr.children[0])
                t2 = self._extract_time_value(expr.children[1])
                body = self.expr_to_json(expr.children[2])
                return {"hold_during": [t1, t2, body]}
            return {"hold_during": []}

        elif expr.expr_type == ExprType.HOLD_AFTER:
            # hold-after has a time value and a body
            if len(expr.children) >= 2:
                t = self._extract_time_value(expr.children[0])
                body = self.expr_to_json(expr.children[1])
                return {"hold_after": [t, body]}
            return {"hold_after": []}

        else:
            # Unknown type - return as generic
            return {"unknown": str(expr.expr_type)}

    def _extract_time_value(self, expr: PDDLExpr) -> Any:
        """Extract a numeric time value from an expression."""
        if expr.expr_type == ExprType.PREDICATE:
            # Time value might be stored as predicate name
            try:
                return float(expr.predicate_name)
            except ValueError:
                return expr.predicate_name
        return 0

    def predicate_to_json(self, pred_name: str, args: List[str], negated: bool = False) -> Dict[str, Any]:
        """Convert a simple predicate tuple to JSON format."""
        return {
            "pred": pred_name,
            "args": args,
            "negated": negated
        }

    def init_to_json(self, init: List[Tuple[str, List[str]]]) -> List[Dict[str, Any]]:
        """Convert init state (list of predicate tuples) to JSON format."""
        return [self.predicate_to_json(pred, args) for pred, args in init]

    def goal_to_json(self, goal: List[Tuple[str, List[str]]]) -> Dict[str, Any]:
        """Convert goal state to JSON format as an AND of predicates."""
        predicates = [self.predicate_to_json(pred, args) for pred, args in goal]
        if len(predicates) == 1:
            return predicates[0]
        return {"and": predicates}

    def constraints_to_json(self, constraints: List[PDDLExpr]) -> Dict[str, Any]:
        """Convert constraints list to JSON format."""
        if not constraints:
            return {}

        if len(constraints) == 1:
            return self.expr_to_json(constraints[0])

        # Multiple constraints - wrap in AND
        return {"and": [self.expr_to_json(c) for c in constraints]}

    def problem_to_json(self, problem: PDDLProblem) -> Dict[str, Any]:
        """
        Convert a parsed PDDL problem to JSON format.

        Returns a dictionary with the problem JSON schema.
        """
        result = {
            "type": "problem",
            "name": problem.problem_name,
            "domain": problem.domain_name,
            "objects": problem.objects_by_type if problem.objects_by_type else {"object": problem.objects},
            "init": self.init_to_json(problem.init),
            "goal": self.goal_to_json(problem.goal)
        }

        # Add constraints if present
        constraints_json = self.constraints_to_json(problem.constraints)
        if constraints_json:
            result["constraints"] = constraints_json

        return result

    def predicate_def_to_json(self, predicate: PDDLPredicate) -> Dict[str, Any]:
        """Convert a predicate definition to JSON format."""
        return {
            "name": predicate.name,
            "parameters": [{"var": p[0], "type": p[1]} for p in predicate.parameters]
        }

    def action_to_json(self, action: PDDLAction) -> Dict[str, Any]:
        """
        Convert an action definition to JSON format.

        Includes parameters, preconditions, and effects.
        """
        result = {
            "name": action.name,
            "parameters": [{"var": p[0], "type": p[1]} for p in action.parameters]
        }

        # Parse precondition
        if action.raw_precondition:
            prec_expr = self._parse_formula(action.raw_precondition)
            if prec_expr:
                result["precondition"] = self.expr_to_json(prec_expr)

        # Parse effect
        if action.raw_effect:
            eff_expr = self._parse_effect(action.raw_effect)
            if eff_expr:
                result["effect"] = eff_expr

        return result

    def _parse_formula(self, formula_str: str) -> Optional[PDDLExpr]:
        """Parse a PDDL formula string into an AST."""
        try:
            tokens = tokenize(formula_str)
            if tokens:
                expr, _ = parse_sexpr(tokens, 0)
                return expr
        except (ValueError, IndexError):
            pass
        return None

    def _parse_effect(self, effect_str: str) -> Optional[Dict[str, Any]]:
        """
        Parse an effect string, handling conditional effects (when).

        Effects can contain:
        - Simple predicates: (pred a b)
        - Negated predicates: (not (pred a))
        - Conjunctions: (and ...)
        - Conditional effects: (when condition effect)
        """
        try:
            tokens = tokenize(effect_str)
            if not tokens:
                return None
            return self._parse_effect_tokens(tokens, 0)[0]
        except (ValueError, IndexError):
            return None

    def _parse_effect_tokens(self, tokens: List[str], pos: int) -> Tuple[Optional[Dict[str, Any]], int]:
        """Parse effect tokens recursively."""
        if pos >= len(tokens):
            return None, pos

        token = tokens[pos]

        if token != '(':
            # Bare atom - treat as predicate
            return {"pred": token.lower(), "args": [], "negated": False}, pos + 1

        # Skip '('
        pos += 1
        if pos >= len(tokens):
            return None, pos

        op = tokens[pos].lower()
        pos += 1

        if op == 'and':
            children = []
            while pos < len(tokens) and tokens[pos] != ')':
                child, pos = self._parse_effect_tokens(tokens, pos)
                if child:
                    children.append(child)
            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1
            return {"and": children}, pos

        elif op == 'not':
            inner, pos = self._parse_effect_tokens(tokens, pos)
            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1
            if inner and "pred" in inner:
                inner["negated"] = True
                return inner, pos
            return {"not": inner}, pos

        elif op == 'when':
            # Conditional effect: (when condition effect)
            condition, pos = self._parse_effect_tokens(tokens, pos)
            effect, pos = self._parse_effect_tokens(tokens, pos)
            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1
            return {"when": {"condition": condition, "effect": effect}}, pos

        elif op == 'forall':
            # Universal effect: (forall (?x - type) effect)
            variables = []
            if pos < len(tokens) and tokens[pos] == '(':
                pos += 1  # Skip '('
                var_names = []
                while pos < len(tokens) and tokens[pos] != ')':
                    tok = tokens[pos]
                    if tok == '-':
                        pos += 1
                        if pos < len(tokens) and tokens[pos] != ')':
                            var_type = tokens[pos]
                            pos += 1
                            for vn in var_names:
                                variables.append({"var": vn, "type": var_type})
                            var_names = []
                    elif tok.startswith('?'):
                        var_names.append(tok)
                        pos += 1
                    else:
                        pos += 1
                # Remaining untyped vars
                for vn in var_names:
                    variables.append({"var": vn, "type": "object"})
                if pos < len(tokens) and tokens[pos] == ')':
                    pos += 1

            body, pos = self._parse_effect_tokens(tokens, pos)
            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1
            return {"forall": {"vars": variables, "body": body}}, pos

        else:
            # Predicate
            args = []
            while pos < len(tokens) and tokens[pos] != ')':
                args.append(tokens[pos])
                pos += 1
            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1
            return {"pred": op, "args": args, "negated": False}, pos

    def domain_to_json(self, domain: PDDLDomain) -> Dict[str, Any]:
        """
        Convert a parsed PDDL domain to JSON format.

        Returns a dictionary with the domain JSON schema.
        """
        result = {
            "type": "domain",
            "name": domain.domain_name,
            "requirements": domain.requirements if domain.requirements else [],
            "types": domain.types if domain.types else {},
            "constants": {},  # Constants are not commonly used in our domains
            "predicates": [self.predicate_def_to_json(p) for p in domain.predicates],
            "actions": [self.action_to_json(a) for a in domain.actions]
        }

        return result


# ==============================================================================
# 2. ENHANCED DOMAIN PARSER (for requirements, types, and full action parsing)
# ==============================================================================

class EnhancedDomainParser(PDDLDomainParser):
    """
    Enhanced domain parser that also extracts requirements, types,
    and full action preconditions/effects.
    """

    def parse(self, content: str) -> PDDLDomain:
        """Parse PDDL domain content with full requirements and types."""
        domain = super().parse(content)

        # Remove comments
        clean_content = self._remove_comments(content)

        # Parse requirements
        req_match = re.search(r'\(:requirements\s+([^)]+)\)', clean_content, re.IGNORECASE)
        if req_match:
            req_str = req_match.group(1)
            # Split by whitespace and extract requirement keywords
            domain.requirements = [r.strip().lstrip(':').lower()
                                   for r in req_str.split() if r.strip()]

        # Parse types
        types_block = self._find_balanced_block(clean_content, 'types')
        if types_block:
            domain.types = self._parse_types(types_block)

        # Re-parse actions with full precondition/effect extraction
        domain.actions = self._parse_actions_full(clean_content)

        return domain

    def _parse_actions_full(self, content: str) -> List:
        """Parse all actions with full precondition and effect extraction."""
        from pddl_to_nl import PDDLAction

        actions = []

        # Find all action blocks
        action_pattern = re.compile(r'\(:action\s+([\w\-]+)', re.IGNORECASE)

        for match in action_pattern.finditer(content):
            action_name = match.group(1)
            action_start = match.start()

            # Find the balanced end of this action block
            action_content = self._extract_balanced_block_from_pos(content, action_start)
            if not action_content:
                continue

            action = PDDLAction(name=action_name)

            # Parse parameters
            param_match = re.search(r':parameters\s*\(([^)]*)\)', action_content, re.IGNORECASE)
            if param_match:
                action.parameters = self._parse_parameters(param_match.group(1))

            # Parse precondition - find :precondition followed by balanced expression
            prec_match = re.search(r':precondition\s*', action_content, re.IGNORECASE)
            if prec_match:
                prec_start = prec_match.end()
                # Find the start of the balanced expression
                while prec_start < len(action_content) and action_content[prec_start].isspace():
                    prec_start += 1
                if prec_start < len(action_content) and action_content[prec_start] == '(':
                    prec_expr = self._extract_balanced_expr(action_content, prec_start)
                    if prec_expr:
                        action.raw_precondition = prec_expr

            # Parse effect - find :effect followed by balanced expression
            eff_match = re.search(r':effect\s*', action_content, re.IGNORECASE)
            if eff_match:
                eff_start = eff_match.end()
                while eff_start < len(action_content) and action_content[eff_start].isspace():
                    eff_start += 1
                if eff_start < len(action_content) and action_content[eff_start] == '(':
                    eff_expr = self._extract_balanced_expr(action_content, eff_start)
                    if eff_expr:
                        action.raw_effect = eff_expr

            actions.append(action)

        return actions

    def _extract_balanced_block_from_pos(self, content: str, start: int) -> Optional[str]:
        """Extract a balanced parenthetical block starting from a position."""
        if start >= len(content) or content[start] != '(':
            return None

        depth = 0
        i = start
        while i < len(content):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
            i += 1
        return None

    def _extract_balanced_expr(self, content: str, start: int) -> Optional[str]:
        """Extract a balanced S-expression starting from a position."""
        if start >= len(content) or content[start] != '(':
            return None

        depth = 0
        i = start
        while i < len(content):
            if content[i] == '(':
                depth += 1
            elif content[i] == ')':
                depth -= 1
                if depth == 0:
                    return content[start:i+1]
            i += 1
        return None

    def _parse_types(self, types_block: str) -> Dict[str, str]:
        """
        Parse types block into a dictionary mapping type -> parent_type.

        Example: "location locatable - object" -> {"location": "object", "locatable": "object"}
        """
        types_dict = {}

        # Remove outer (:types ...)
        inner = types_block.strip()
        if inner.startswith('(:types'):
            inner = inner[7:]
        if inner.endswith(')'):
            inner = inner[:-1]

        # Clean up whitespace
        inner = ' '.join(inner.split())

        if ' - ' in inner:
            # Typed declarations
            parts = inner.split(' - ')
            pending_types = []

            for i, part in enumerate(parts):
                tokens = [t for t in part.split() if t]
                if i == 0:
                    pending_types = tokens
                else:
                    if tokens:
                        parent_type = tokens[0]
                        for t in pending_types:
                            types_dict[t] = parent_type
                        pending_types = tokens[1:]

            # Remaining types default to object
            for t in pending_types:
                types_dict[t] = "object"
        else:
            # Untyped - all types are children of object
            tokens = [t for t in inner.split() if t]
            for t in tokens:
                types_dict[t] = "object"

        return types_dict


# ==============================================================================
# 3. JSON WRITER (File I/O and Batch Processing)
# ==============================================================================

class PDDLJSONWriter:
    """
    File I/O and batch processing for PDDL to JSON conversion.
    Mirrors the structure of PDDLToNLConverter.
    """

    def __init__(self, verbose: bool = False, indent: int = 2, compact: bool = False):
        self.problem_parser = PDDLProblemParser()
        self.domain_parser = EnhancedDomainParser()
        self.converter = PDDLToJSONConverter()
        self.verbose = verbose
        self.indent = None if compact else indent

    def _log(self, message: str):
        """Print message if verbose mode is enabled."""
        if self.verbose:
            print(message)

    def convert_file(self, input_path: Path, output_path: Path, dry_run: bool = False,
                     copy_soln: bool = True, copy_pddl: bool = True) -> bool:
        """
        Convert a single PDDL problem file to JSON.

        Args:
            input_path: Path to input PDDL file
            output_path: Path for output .json file
            dry_run: If True, parse but don't write files
            copy_soln: If True, copy corresponding .soln file to output directory
            copy_pddl: If True, copy original .pddl file to output directory

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
            problem = self.problem_parser.parse(content)

            # Convert to JSON
            json_data = self.converter.problem_to_json(problem)

            # Write output (unless dry run)
            if not dry_run:
                output_path.parent.mkdir(parents=True, exist_ok=True)
                with open(output_path, 'w', encoding='utf-8') as f:
                    json.dump(json_data, f, indent=self.indent, ensure_ascii=False)

                # Copy original .pddl file (needed for validation)
                if copy_pddl:
                    pddl_dest = output_path.parent / input_path.name
                    if not pddl_dest.exists():
                        shutil.copy2(input_path, pddl_dest)
                        self._log(f"  Copied: {input_path.name}")

                # Copy corresponding .soln file if it exists
                if copy_soln:
                    soln_source = input_path.with_suffix('.soln')
                    if soln_source.exists():
                        soln_dest = output_path.parent / soln_source.name
                        shutil.copy2(soln_source, soln_dest)
                        self._log(f"  Copied: {soln_source.name}")

            self._log(f"  Converted: {input_path.name} -> {output_path.name}")
            return True

        except Exception as e:
            self._log(f"  ERROR converting {input_path.name}: {e}")
            return False

    def convert_domain_file(self, domain_path: Path, output_path: Path = None,
                            dry_run: bool = False) -> bool:
        """
        Convert a PDDL domain file to JSON format.

        Args:
            domain_path: Path to input domain PDDL file
            output_path: Path for output file (default: domain3.json in same directory)
            dry_run: If True, parse but don't write file

        Returns:
            True if successful, False otherwise
        """
        try:
            # Read input file
            try:
                content = domain_path.read_text(encoding='utf-8')
            except UnicodeDecodeError:
                content = domain_path.read_text(encoding='latin-1')

            # Parse domain
            domain = self.domain_parser.parse(content)

            # Convert to JSON
            json_data = self.converter.domain_to_json(domain)

            # Determine output path
            if output_path is None:
                output_path = domain_path.parent / f"{domain_path.stem}.json"

            # Write output (unless dry run)
            if not dry_run:
                output_path.parent.mkdir(parents=True, exist_ok=True)
                with open(output_path, 'w', encoding='utf-8') as f:
                    json.dump(json_data, f, indent=self.indent, ensure_ascii=False)

            print(f"  Converted domain: {domain_path.name} -> {output_path.name}")
            return True

        except Exception as e:
            print(f"  ERROR converting domain {domain_path.name}: {e}")
            import traceback
            traceback.print_exc()
            return False

    def convert_directory(
        self,
        input_dir: Path,
        output_dir: Optional[Path] = None,
        recursive: bool = True,
        dry_run: bool = False,
        copy_soln: bool = True,
        copy_pddl: bool = True
    ) -> Dict[str, int]:
        """
        Convert all PDDL files in a directory to JSON.

        Args:
            input_dir: Input directory containing PDDL files
            output_dir: Output directory (default: testing_problems_json/ under input_dir)
            recursive: Whether to process subdirectories
            dry_run: If True, parse but don't write files
            copy_soln: If True, copy corresponding .soln files to output directory
            copy_pddl: If True, copy original .pddl files to output directory

        Returns:
            Dict with counts: {"success": N, "failed": M, "total": N+M}
        """
        if output_dir is None:
            output_dir = input_dir / "testing_problems_json"

        # Resolve output_dir to absolute path for comparison
        output_dir_resolved = output_dir.resolve()

        # Find all PDDL files
        if recursive:
            pddl_files = list(input_dir.rglob("*.pddl"))
        else:
            pddl_files = list(input_dir.glob("*.pddl"))

        # Filter out domain files
        pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

        # Filter out files already in the output directory
        pddl_files = [f for f in pddl_files if not str(f.resolve()).startswith(str(output_dir_resolved))]

        # Filter out files in testing_problems_nl directory
        pddl_files = [f for f in pddl_files if 'testing_problems_nl' not in str(f)]

        if not pddl_files:
            print(f"No PDDL problem files found in {input_dir}")
            return {"success": 0, "failed": 0, "total": 0}

        print(f"Found {len(pddl_files)} PDDL problem files")
        print(f"Output directory: {output_dir}")
        print(f"Copy PDDL files: {copy_pddl}")
        print(f"Copy SOLN files: {copy_soln}")
        if dry_run:
            print("(Dry run - no files will be written)")
        print("-" * 50)

        success = 0
        failed = 0

        for pddl_file in sorted(pddl_files):
            # Compute output path
            output_file = output_dir / f"{pddl_file.stem}.json"

            if self.convert_file(pddl_file, output_file, dry_run, copy_soln, copy_pddl):
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
        dry_run: bool = False,
        copy_soln: bool = True,
        copy_pddl: bool = True
    ) -> Dict[str, int]:
        """
        Main entry point for conversion.
        Handles both single files and directories.
        """
        if input_path.is_file():
            # Single file conversion
            if output_path is None:
                output_path = input_path.parent / "testing_problems_json" / f"{input_path.stem}.json"

            success = self.convert_file(input_path, output_path, dry_run, copy_soln, copy_pddl)
            return {"success": 1 if success else 0, "failed": 0 if success else 1, "total": 1}

        elif input_path.is_dir():
            return self.convert_directory(input_path, output_path, recursive, dry_run, copy_soln, copy_pddl)

        else:
            print(f"Error: {input_path} is not a valid file or directory")
            return {"success": 0, "failed": 0, "total": 0}


# ==============================================================================
# 4. CLI INTERFACE
# ==============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="Convert PDDL3 problem/domain files to JSON format.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Convert problem files to JSON
  python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/
  python script/pddl_to_json.py --input path/to/single_file.pddl

  # Convert domain file to JSON
  python script/pddl_to_json.py --domain-file pddl3/blocksworld/domain3.pddl

  # Convert both problems and domain
  python script/pddl_to_json.py --input pddl3/blocksworld/testing_problem50/ --convert-domain

  # Compact output (no indentation)
  python script/pddl_to_json.py --input file.pddl --compact
        """
    )

    parser.add_argument(
        '--input', '-i',
        type=str,
        default=None,
        help='Input file or directory containing PDDL problem files'
    )

    parser.add_argument(
        '--domain-file', '-d',
        type=str,
        default=None,
        help='Convert a domain PDDL file to JSON format'
    )

    parser.add_argument(
        '--convert-domain',
        action='store_true',
        help='When processing a directory, also convert domain3.pddl to JSON'
    )

    parser.add_argument(
        '--output-dir', '-o',
        type=str,
        default=None,
        help='Output directory (default: testing_problems_json/ in input dir)'
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

    parser.add_argument(
        '--copy-soln',
        action='store_true',
        dest='copy_soln',
        default=True,
        help='Copy corresponding .soln files to output directory (default: True)'
    )

    parser.add_argument(
        '--no-copy-soln',
        action='store_false',
        dest='copy_soln',
        help='Do not copy .soln files'
    )

    parser.add_argument(
        '--copy-pddl',
        action='store_true',
        dest='copy_pddl',
        default=True,
        help='Copy original .pddl files to output directory (default: True)'
    )

    parser.add_argument(
        '--no-copy-pddl',
        action='store_false',
        dest='copy_pddl',
        help='Do not copy .pddl files'
    )

    parser.add_argument(
        '--indent',
        type=int,
        default=2,
        help='JSON indentation level (default: 2)'
    )

    parser.add_argument(
        '--compact',
        action='store_true',
        help='Output compact JSON without indentation'
    )

    args = parser.parse_args()

    # Validate arguments
    if not args.input and not args.domain_file:
        print("Error: Must specify either --input or --domain-file")
        return 1

    writer = PDDLJSONWriter(
        verbose=args.verbose,
        indent=args.indent,
        compact=args.compact
    )

    # Handle domain file conversion
    if args.domain_file:
        domain_path = Path(args.domain_file)
        if not domain_path.exists():
            print(f"Error: Domain file does not exist: {domain_path}")
            return 1

        print(f"Converting domain file: {domain_path}")
        success = writer.convert_domain_file(domain_path, dry_run=args.dry_run)

        if not args.input:
            # Only domain conversion requested
            return 0 if success else 1

    # Handle problem file conversion
    if args.input:
        input_path = Path(args.input)
        output_path = Path(args.output_dir) if args.output_dir else None

        if not input_path.exists():
            print(f"Error: Input path does not exist: {input_path}")
            return 1

        # Convert domain if --convert-domain is specified
        if args.convert_domain and input_path.is_dir():
            # Look for domain3.pddl in parent or current directory
            domain_file = input_path.parent / "domain3.pddl"
            if not domain_file.exists():
                domain_file = input_path / "domain3.pddl"
            if domain_file.exists():
                print(f"Converting domain file: {domain_file}")
                writer.convert_domain_file(domain_file, dry_run=args.dry_run)

        results = writer.convert(
            input_path=input_path,
            output_path=output_path,
            recursive=args.recursive,
            dry_run=args.dry_run,
            copy_soln=args.copy_soln,
            copy_pddl=args.copy_pddl
        )

        return 0 if results["failed"] == 0 else 1

    return 0


if __name__ == '__main__':
    exit(main())
