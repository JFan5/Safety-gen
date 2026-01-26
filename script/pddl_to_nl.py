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
import re
import shutil
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Union
from dataclasses import dataclass, field


# ==============================================================================
# 1. DATA STRUCTURES
# ==============================================================================

class ExprType(Enum):
    """Types of PDDL expressions for the AST."""
    PREDICATE = "predicate"
    NOT = "not"
    AND = "and"
    OR = "or"
    IMPLY = "imply"
    FORALL = "forall"
    EXISTS = "exists"
    ALWAYS = "always"
    SOMETIME = "sometime"
    SOMETIME_BEFORE = "sometime-before"
    SOMETIME_AFTER = "sometime-after"
    AT_MOST_ONCE = "at-most-once"
    AT_END = "at-end"
    HOLD_DURING = "hold-during"
    HOLD_AFTER = "hold-after"


@dataclass
class PDDLExpr:
    """Recursive PDDL expression representation (AST node)."""
    expr_type: ExprType
    predicate_name: Optional[str] = None  # For PREDICATE type
    args: List[str] = field(default_factory=list)  # For PREDICATE type
    children: List['PDDLExpr'] = field(default_factory=list)  # For compound expressions
    variables: List[Tuple[str, str]] = field(default_factory=list)  # [(var, type)] for forall/exists


@dataclass
class PDDLProblem:
    """Parsed PDDL problem representation."""
    problem_name: str = ""
    domain_name: str = ""
    objects: List[str] = field(default_factory=list)  # Flat list for backward compat
    objects_by_type: Dict[str, List[str]] = field(default_factory=dict)  # Type -> objects mapping
    init: List[Tuple[str, List[str]]] = field(default_factory=list)  # (predicate_name, [args])
    goal: List[Tuple[str, List[str]]] = field(default_factory=list)
    constraints: List[PDDLExpr] = field(default_factory=list)  # AST-based constraints
    raw_content: str = ""
    parse_errors: List[str] = field(default_factory=list)


@dataclass
class PDDLPredicate:
    """Parsed PDDL predicate definition."""
    name: str
    parameters: List[Tuple[str, str]] = field(default_factory=list)  # [(param_name, type)]


@dataclass
class PDDLAction:
    """Parsed PDDL action definition."""
    name: str
    parameters: List[Tuple[str, str]] = field(default_factory=list)  # [(param_name, type)]
    precondition: Optional[PDDLExpr] = None
    effect: Optional[PDDLExpr] = None
    raw_precondition: str = ""
    raw_effect: str = ""


@dataclass
class PDDLDomain:
    """Parsed PDDL domain representation."""
    domain_name: str = ""
    requirements: List[str] = field(default_factory=list)
    types: Dict[str, str] = field(default_factory=dict)  # type -> parent_type
    predicates: List[PDDLPredicate] = field(default_factory=list)
    actions: List[PDDLAction] = field(default_factory=list)
    raw_content: str = ""
    parse_errors: List[str] = field(default_factory=list)


# ==============================================================================
# 2. S-EXPRESSION TOKENIZER AND PARSER
# ==============================================================================

def tokenize(s: str) -> List[str]:
    """
    Split PDDL into tokens: '(', ')', and atoms.

    Examples:
        "(at bob shed)" -> ['(', 'at', 'bob', 'shed', ')']
        "(not (tightened nut1))" -> ['(', 'not', '(', 'tightened', 'nut1', ')', ')']
    """
    tokens = []
    i = 0
    while i < len(s):
        c = s[i]
        if c.isspace():
            i += 1
        elif c == '(':
            tokens.append('(')
            i += 1
        elif c == ')':
            tokens.append(')')
            i += 1
        elif c == ';':
            # Skip comment until end of line
            while i < len(s) and s[i] != '\n':
                i += 1
        else:
            # Read an atom (identifier, number, etc.)
            start = i
            while i < len(s) and not s[i].isspace() and s[i] not in '()':
                i += 1
            tokens.append(s[start:i])
    return tokens


def parse_sexpr(tokens: List[str], pos: int = 0) -> Tuple[PDDLExpr, int]:
    """
    Recursively parse tokens into PDDLExpr AST.

    Returns (expr, new_pos) where new_pos is the position after parsing.

    Handles:
    - (predicate arg1 arg2 ...)
    - (not X)
    - (and X Y ...)
    - (or X Y ...)
    - (imply A B)
    - (forall (?x - type) body)
    - (exists (?x - type) body)
    - (always X)
    - (sometime X)
    - (sometime-before A B)
    - (sometime-after A B)
    - (at-most-once X)
    """
    if pos >= len(tokens):
        raise ValueError("Unexpected end of tokens")

    token = tokens[pos]

    if token != '(':
        # It's an atom - treat as a predicate with no args (unusual but handle it)
        return PDDLExpr(expr_type=ExprType.PREDICATE, predicate_name=token.lower(), args=[]), pos + 1

    # Skip '('
    pos += 1
    if pos >= len(tokens):
        raise ValueError("Unexpected end after '('")

    # Get the operator/predicate name
    op = tokens[pos].lower()
    pos += 1

    # Map operators to expression types
    op_map = {
        'not': ExprType.NOT,
        'and': ExprType.AND,
        'or': ExprType.OR,
        'imply': ExprType.IMPLY,
        'forall': ExprType.FORALL,
        'exists': ExprType.EXISTS,
        'always': ExprType.ALWAYS,
        'sometime': ExprType.SOMETIME,
        'sometime-before': ExprType.SOMETIME_BEFORE,
        'sometime-after': ExprType.SOMETIME_AFTER,
        'at-most-once': ExprType.AT_MOST_ONCE,
        'at-end': ExprType.AT_END,
        'hold-during': ExprType.HOLD_DURING,
        'hold-after': ExprType.HOLD_AFTER,
    }

    if op in op_map:
        expr_type = op_map[op]

        if expr_type in (ExprType.FORALL, ExprType.EXISTS):
            # Parse variable list: (?x - type) or (?x ?y - type)
            variables = []
            if pos < len(tokens) and tokens[pos] == '(':
                pos += 1  # Skip '('
                var_names = []
                while pos < len(tokens) and tokens[pos] != ')':
                    tok = tokens[pos]
                    if tok == '-':
                        # Next token is the type
                        pos += 1
                        if pos < len(tokens) and tokens[pos] != ')':
                            var_type = tokens[pos]
                            pos += 1
                            for vn in var_names:
                                variables.append((vn, var_type))
                            var_names = []
                    elif tok.startswith('?'):
                        var_names.append(tok)
                        pos += 1
                    else:
                        pos += 1
                # If no type specified, use 'object' as default
                for vn in var_names:
                    variables.append((vn, 'object'))
                if pos < len(tokens) and tokens[pos] == ')':
                    pos += 1  # Skip ')'

            # Parse body
            children = []
            while pos < len(tokens) and tokens[pos] != ')':
                child, pos = parse_sexpr(tokens, pos)
                children.append(child)

            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1  # Skip closing ')'

            return PDDLExpr(expr_type=expr_type, variables=variables, children=children), pos

        else:
            # Parse children
            children = []
            while pos < len(tokens) and tokens[pos] != ')':
                child, pos = parse_sexpr(tokens, pos)
                children.append(child)

            if pos < len(tokens) and tokens[pos] == ')':
                pos += 1  # Skip closing ')'

            return PDDLExpr(expr_type=expr_type, children=children), pos

    else:
        # It's a predicate
        args = []
        while pos < len(tokens) and tokens[pos] != ')':
            args.append(tokens[pos])
            pos += 1

        if pos < len(tokens) and tokens[pos] == ')':
            pos += 1  # Skip closing ')'

        return PDDLExpr(expr_type=ExprType.PREDICATE, predicate_name=op, args=args), pos


def parse_constraint_block(constraint_text: str) -> List[PDDLExpr]:
    """
    Parse a constraints block and return list of constraint expressions.
    Handles outer (and ...) wrapper if present.
    """
    tokens = tokenize(constraint_text)
    if not tokens:
        return []

    try:
        expr, _ = parse_sexpr(tokens, 0)

        # If the outer expression is AND, return its children as individual constraints
        if expr.expr_type == ExprType.AND:
            return expr.children
        else:
            return [expr]
    except (ValueError, IndexError) as e:
        # Parsing failed, return empty
        return []


# ==============================================================================
# 3. PDDL PARSER
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

    def _parse_objects(self, objects_block: str) -> Tuple[Dict[str, List[str]], List[str]]:
        """
        Parse objects from block and return both typed dict and flat list.

        Handles:
        - Untyped: "b1 b2 b3" -> {'object': ['b1', 'b2', 'b3']}, ['b1', 'b2', 'b3']
        - Typed: "bob - man\n spanner1 spanner2 - spanner" ->
                 {'man': ['bob'], 'spanner': ['spanner1', 'spanner2']}, ['bob', 'spanner1', 'spanner2']
        """
        objects_by_type: Dict[str, List[str]] = {}
        all_objects: List[str] = []

        # Split by lines and process
        lines = objects_block.strip().split('\n')
        combined = ' '.join(lines)

        # Check if typed (contains ' - ')
        if ' - ' in combined:
            # Parse typed objects
            # Pattern: obj1 obj2 ... - type
            # Can have multiple groups
            parts = combined.split(' - ')
            pending_objects = []

            for i, part in enumerate(parts):
                tokens = part.split()
                if i == 0:
                    # First part is just objects
                    pending_objects = [t for t in tokens if t and re.match(r'^[a-zA-Z0-9_\-]+$', t)]
                else:
                    # First token is the type for pending objects, rest are new objects
                    if tokens:
                        obj_type = tokens[0].lower()
                        if obj_type not in objects_by_type:
                            objects_by_type[obj_type] = []
                        objects_by_type[obj_type].extend(pending_objects)
                        all_objects.extend(pending_objects)
                        # Remaining tokens are new pending objects
                        pending_objects = [t for t in tokens[1:] if t and re.match(r'^[a-zA-Z0-9_\-]+$', t)]

            # Handle any remaining pending objects (untyped)
            if pending_objects:
                if 'object' not in objects_by_type:
                    objects_by_type['object'] = []
                objects_by_type['object'].extend(pending_objects)
                all_objects.extend(pending_objects)
        else:
            # Untyped objects
            tokens = combined.split()
            for token in tokens:
                token = token.strip()
                if token and re.match(r'^[a-zA-Z0-9_\-]+$', token):
                    all_objects.append(token)
            if all_objects:
                objects_by_type['object'] = all_objects.copy()

        return objects_by_type, all_objects

    def _parse_constraints(self, constraints_block: str) -> List[PDDLExpr]:
        """Parse PDDL3 constraints using recursive S-expression parser."""
        return parse_constraint_block(constraints_block)

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
            problem.objects_by_type, problem.objects = self._parse_objects(objects_block)

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
# 4. NATURAL LANGUAGE TEMPLATES
# ==============================================================================

class NLTemplates:
    """Natural language templates for PDDL predicates by domain."""

    # Blocksworld predicate templates
    BLOCKSWORLD = {
        "on": "block {0} is on block {1}",
        "on-table": "block {0} is on the table",
        "clear": "block {0} is clear (nothing on top)",
        "arm-empty": "the robot arm is empty",
        "holding": "the robot is holding block {0}",
    }

    # Ferry domain predicate templates
    FERRY = {
        "at-ferry": "the ferry is at location {0}",
        "at": "{0} is at location {1}",
        "on": "{0} is on the ferry",
        "on-ferry": "{0} is on the ferry",
        "empty-ferry": "the ferry is empty",
        "location": "{0} is a valid location",
        "car": "{0} is a car",
        "not-eq": "{0} and {1} are different locations",
        "auto": "{0} is a car",
    }

    # Grippers domain predicate templates (updated for robot-specific predicates)
    GRIPPERS = {
        "at-robby": "robot {0} is at room {1}",
        "at": "object {0} is at room {1}",
        "free": "gripper {1} of robot {0} is free",
        "carry": "robot {0} is carrying object {1} with gripper {2}",
        "ball": "{0} is a ball",
        "gripper": "{0} is a gripper",
        "room": "{0} is a room",
    }

    # Spanner domain predicate templates
    SPANNER = {
        "at": "{0} is at location {1}",
        "carrying": "man {0} is carrying {1}",
        "useable": "spanner {0} is useable",
        "link": "location {0} is connected to location {1}",
        "tightened": "nut {0} is tightened",
        "loose": "nut {0} is loose",
        "man": "{0} is a man",
        "spanner": "{0} is a spanner",
        "nut": "{0} is a nut",
        "location": "{0} is a location",
    }

    # Delivery domain predicate templates
    DELIVERY = {
        "at": "{0} is at cell {1}",
        "carrying": "truck {0} is carrying package {1}",
        "in": "package {0} is in truck {1}",
        "empty": "truck {0} is empty",
        "adjacent": "cell {0} is adjacent to cell {1}",
        "last": "truck {0} was last at cell {1}",
        "road": "there is a road from {0} to {1}",
        "delivered": "package {0} has been delivered",
    }

    # Domain name to template mapping
    DOMAIN_TEMPLATES = {
        "blocksworld": BLOCKSWORLD,
        "ferry": FERRY,
        "grippers": GRIPPERS,
        "gripper-strips": GRIPPERS,
        "spanner": SPANNER,
        "delivery": DELIVERY,
    }

    # Domain overview descriptions (natural language)
    DOMAIN_DESCRIPTIONS = {
        "blocksworld": (
            "This domain involves a robot arm manipulating blocks on a table. "
            "The arm can hold one block at a time. Blocks can be stacked on top of each other, "
            "and the goal is typically to rearrange blocks into a desired configuration."
        ),
        "ferry": (
            "This domain involves a ferry that transports cars between locations. "
            "The ferry sails between locations and can carry cars from one place to another "
            "by boarding them at the origin and debarking them at the destination."
        ),
        "grippers": (
            "This domain features robots equipped with grippers that transport objects between rooms. "
            "Each robot can move between rooms and use its grippers to carry objects."
        ),
        "gripper-strips": (
            "This domain features robots equipped with grippers that transport objects between rooms. "
            "Each robot can move between rooms and use its grippers to carry objects."
        ),
        "spanner": (
            "This domain involves a worker who moves between connected locations, picks up spanners, "
            "and uses them to tighten nuts. Spanners are single-use tools: once a spanner tightens a nut, "
            "it can no longer be used."
        ),
        "delivery": (
            "This domain involves trucks delivering packages across a grid of cells. "
            "Trucks navigate between adjacent cells, pick up packages, and drop them off at destination cells."
        ),
    }

    # Action templates for hybrid NL+PDDL format
    # Each action has: description, when (preconditions in NL), result (effects in NL)
    ACTION_NL_TEMPLATES = {
        "blocksworld": {
            "pickup": {
                "desc": "Pick up a block from the table",
                "when": "the block is clear (nothing on top), it is on the table, and the arm is empty",
                "result": "the arm holds the block; the block is no longer on the table or clear; the arm is no longer empty",
            },
            "putdown": {
                "desc": "Put the held block down on the table",
                "when": "the arm is holding a block",
                "result": "the block is on the table and clear; the arm becomes empty",
            },
            "stack": {
                "desc": "Place the held block on top of another block",
                "when": "the arm is holding a block, and the target block is clear",
                "result": "the held block is on the target block and becomes clear; the target block is no longer clear; the arm becomes empty",
            },
            "unstack": {
                "desc": "Pick up a block from the top of another block",
                "when": "a block is on another block, the top block is clear, and the arm is empty",
                "result": "the arm holds the top block; the bottom block becomes clear; the top block is no longer on the bottom block",
            },
        },
        "ferry": {
            "sail": {
                "desc": "Sail the ferry from one location to another",
                "when": "the two locations are different, and the ferry is at the departure location",
                "result": "the ferry is at the destination; the ferry is no longer at the origin",
            },
            "board": {
                "desc": "Load a car onto the ferry",
                "when": "the car is at the same location as the ferry, and the ferry is empty",
                "result": "the car is on the ferry; the car is no longer at that location; the ferry is no longer empty",
            },
            "debark": {
                "desc": "Unload a car from the ferry",
                "when": "the car is on the ferry",
                "result": "the car is at the ferry's current location; the ferry becomes empty; the car is no longer on the ferry",
            },
        },
        "grippers": {
            "move": {
                "desc": "Move a robot from one room to another",
                "when": "the robot is in the departure room",
                "result": "the robot is in the destination room; the robot is no longer in the departure room",
            },
            "pick": {
                "desc": "Pick up an object using a gripper",
                "when": "the object is in the same room as the robot, and the gripper is free",
                "result": "the robot carries the object with that gripper; the object is no longer in the room; the gripper is no longer free",
            },
            "drop": {
                "desc": "Release an object from a gripper",
                "when": "the robot is carrying the object with a gripper",
                "result": "the object is in the robot's current room; the gripper becomes free; the robot no longer carries that object",
            },
        },
        "gripper-strips": {
            "move": {
                "desc": "Move a robot from one room to another",
                "when": "the robot is in the departure room",
                "result": "the robot is in the destination room; the robot is no longer in the departure room",
            },
            "pick": {
                "desc": "Pick up an object using a gripper",
                "when": "the object is in the same room as the robot, and the gripper is free",
                "result": "the robot carries the object with that gripper; the object is no longer in the room; the gripper is no longer free",
            },
            "drop": {
                "desc": "Release an object from a gripper",
                "when": "the robot is carrying the object with a gripper",
                "result": "the object is in the robot's current room; the gripper becomes free; the robot no longer carries that object",
            },
        },
        "spanner": {
            "walk": {
                "desc": "Walk from one location to an adjacent location",
                "when": "the worker is at the start location, and there is a link to the destination",
                "result": "the worker is at the destination; the worker is no longer at the origin",
            },
            "pickup_spanner": {
                "desc": "Pick up a spanner",
                "when": "the worker and the spanner are at the same location",
                "result": "the worker carries the spanner; the spanner is no longer at that location",
            },
            "tighten_nut": {
                "desc": "Tighten a nut using a spanner",
                "when": "the worker is at the nut's location, carrying a useable spanner, and the nut is loose",
                "result": "the nut is tightened and no longer loose; the spanner becomes unuseable",
            },
        },
        "delivery": {
            "pick-package": {
                "desc": "Pick up a package with the truck",
                "when": "the package and truck are at the same cell, and the truck is empty",
                "result": "the truck carries the package; the package is no longer at that cell; the truck is no longer empty",
            },
            "drop-package": {
                "desc": "Drop off the package",
                "when": "the truck is carrying a package",
                "result": "the truck becomes empty; the package is at the truck's current cell",
            },
            "move": {
                "desc": "Move the truck to an adjacent cell",
                "when": "the cells are adjacent and different, and the truck is at the origin cell",
                "result": "the truck is at the destination cell; the truck is no longer at the origin; the origin is recorded as last visited",
            },
        },
    }

    @classmethod
    def get_templates(cls, domain_name: str) -> Dict[str, str]:
        """Get templates for a domain, with fallback to empty dict."""
        return cls.DOMAIN_TEMPLATES.get(domain_name.lower(), {})

    @classmethod
    def get_domain_description(cls, domain_name: str) -> str:
        """Get domain overview description."""
        return cls.DOMAIN_DESCRIPTIONS.get(
            domain_name.lower(),
            f"A planning domain called {domain_name}."
        )

    @classmethod
    def get_action_nl(cls, domain_name: str, action_name: str) -> Optional[Dict[str, str]]:
        """Get action NL template (desc, when, result)."""
        domain_actions = cls.ACTION_NL_TEMPLATES.get(domain_name.lower(), {})
        return domain_actions.get(action_name.lower())

    @classmethod
    def predicate_to_nl(cls, domain_name: str, predicate: str, args: List[str],
                        with_period: bool = True) -> str:
        """
        Convert a predicate to natural language.
        Falls back to generic format if no template exists.
        """
        templates = cls.get_templates(domain_name)
        pred_lower = predicate.lower()

        if pred_lower in templates:
            template = templates[pred_lower]
            try:
                result = template.format(*args)
                if with_period:
                    # Capitalize first letter and add period
                    result = result[0].upper() + result[1:] + "."
                return result
            except (IndexError, KeyError):
                # Template mismatch, use generic
                pass

        # Generic fallback
        if args:
            result = f"{predicate}({', '.join(args)}) is true"
        else:
            result = f"{predicate} is true"

        if with_period:
            result = result[0].upper() + result[1:] + "."
        return result


# ==============================================================================
# 5. DOMAIN PARSER AND HYBRID NL GENERATOR
# ==============================================================================

class PDDLDomainParser:
    """Parser for PDDL domain files."""

    def __init__(self):
        self.domain_pattern = re.compile(
            r'\(define\s+\(domain\s+([\w\-]+)\)', re.IGNORECASE | re.DOTALL
        )
        self.action_pattern = re.compile(
            r'\(:action\s+([\w\-]+)(.*?)(?=\(:action|\Z)',
            re.IGNORECASE | re.DOTALL
        )

    def _remove_comments(self, content: str) -> str:
        """Remove PDDL comments (lines starting with ;)."""
        lines = content.split('\n')
        cleaned = []
        for line in lines:
            # Remove inline comments
            if ';' in line:
                line = line[:line.index(';')]
            cleaned.append(line)
        return '\n'.join(cleaned)

    def _find_balanced_block(self, content: str, start_keyword: str) -> Optional[str]:
        """Find a balanced parenthetical block starting with keyword."""
        pattern = re.compile(rf'\(:{start_keyword}\b', re.IGNORECASE)
        match = pattern.search(content)
        if not match:
            return None

        start = match.start()
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

    def _parse_parameters(self, param_str: str) -> List[Tuple[str, str]]:
        """Parse action parameters like '?x - type ?y - type2'."""
        params = []
        if not param_str:
            return params

        # Clean up whitespace
        param_str = ' '.join(param_str.split())

        # Handle typed parameters: ?x - type ?y - type
        # Also handle untyped: ?x ?y ?z
        parts = param_str.split()
        i = 0
        current_vars = []

        while i < len(parts):
            part = parts[i]
            if part.startswith('?'):
                current_vars.append(part)
                i += 1
            elif part == '-':
                # Next part is the type
                if i + 1 < len(parts):
                    param_type = parts[i + 1]
                    for var in current_vars:
                        params.append((var, param_type))
                    current_vars = []
                    i += 2
                else:
                    i += 1
            else:
                # Untyped or type name
                i += 1

        # Handle remaining untyped variables
        for var in current_vars:
            params.append((var, 'object'))

        return params

    def _parse_predicates(self, pred_block: str) -> List[PDDLPredicate]:
        """Parse predicates block."""
        predicates = []

        # Remove outer (:predicates ...)
        inner = pred_block.strip()
        if inner.startswith('(:predicates'):
            inner = inner[12:]
        if inner.endswith(')'):
            inner = inner[:-1]

        # Find each predicate definition (name params)
        # Use tokenizer approach
        tokens = tokenize(inner)
        i = 0
        while i < len(tokens):
            if tokens[i] == '(':
                # Start of predicate definition
                depth = 1
                pred_tokens = []
                i += 1
                while i < len(tokens) and depth > 0:
                    if tokens[i] == '(':
                        depth += 1
                    elif tokens[i] == ')':
                        depth -= 1
                        if depth == 0:
                            break
                    pred_tokens.append(tokens[i])
                    i += 1

                if pred_tokens:
                    pred_name = pred_tokens[0]
                    param_str = ' '.join(pred_tokens[1:])
                    params = self._parse_parameters(param_str)
                    predicates.append(PDDLPredicate(name=pred_name, parameters=params))
            i += 1

        return predicates

    def _parse_action(self, action_match: re.Match) -> PDDLAction:
        """Parse a single action definition."""
        action_name = action_match.group(1)
        action_body = action_match.group(2)

        action = PDDLAction(name=action_name)

        # Parse parameters
        param_match = re.search(r':parameters\s*\(([^)]*)\)', action_body, re.IGNORECASE)
        if param_match:
            action.parameters = self._parse_parameters(param_match.group(1))

        # Extract precondition block
        prec_block = self._find_balanced_block(action_body, 'precondition')
        if prec_block:
            # Remove :precondition wrapper
            inner = prec_block.strip()
            if inner.startswith('(:precondition'):
                inner = inner[14:].strip()
                if inner.endswith(')'):
                    inner = inner[:-1].strip()
            action.raw_precondition = inner

        # Extract effect block
        eff_block = self._find_balanced_block(action_body, 'effect')
        if eff_block:
            inner = eff_block.strip()
            if inner.startswith('(:effect'):
                inner = inner[8:].strip()
                if inner.endswith(')'):
                    inner = inner[:-1].strip()
            action.raw_effect = inner

        return action

    def parse(self, content: str) -> PDDLDomain:
        """Parse PDDL domain content."""
        domain = PDDLDomain(raw_content=content)

        # Remove comments
        clean_content = self._remove_comments(content)

        # Extract domain name
        dom_match = self.domain_pattern.search(clean_content)
        if dom_match:
            domain.domain_name = dom_match.group(1)
        else:
            domain.parse_errors.append("Could not extract domain name")

        # Parse predicates
        pred_block = self._find_balanced_block(clean_content, 'predicates')
        if pred_block:
            domain.predicates = self._parse_predicates(pred_block)

        # Parse actions
        for action_match in self.action_pattern.finditer(clean_content):
            action = self._parse_action(action_match)
            domain.actions.append(action)

        return domain


class DomainHybridNLGenerator:
    """
    Generates hybrid NL+PDDL domain description.

    The output format:
    - Domain overview in natural language
    - Actions with NL descriptions AND PDDL syntax
    """

    def __init__(self, domain_name: str = ""):
        self.domain_name = domain_name.lower() if domain_name else ""

    def _format_param_for_syntax(self, param: Tuple[str, str]) -> str:
        """Format parameter for PDDL syntax display with type hints."""
        name, ptype = param
        # Remove ? prefix for display
        clean_name = name[1:] if name.startswith('?') else name

        # Include type for clarity (except generic 'object')
        if ptype and ptype != 'object':
            # Use descriptive format: name:type or just type if name is single letter
            if len(clean_name) == 1:
                return f"<{ptype}>"
            else:
                return f"<{clean_name}:{ptype}>"
        return f"<{clean_name}>"

    def _format_action(self, action: PDDLAction) -> str:
        """Format a single action with NL description and PDDL syntax."""
        lines = []

        # Get NL template if available
        nl_template = NLTemplates.get_action_nl(self.domain_name, action.name)

        # Action header with description
        if nl_template:
            desc = nl_template['desc']
        else:
            desc = f"Perform the {action.name} action"

        lines.append(f"**{action.name}** - {desc}")

        # When (preconditions)
        if nl_template and 'when' in nl_template:
            lines.append(f"  When: {nl_template['when']}")
        elif action.raw_precondition:
            lines.append(f"  When: {action.raw_precondition}")

        # Result (effects)
        if nl_template and 'result' in nl_template:
            lines.append(f"  Result: {nl_template['result']}")
        elif action.raw_effect:
            lines.append(f"  Result: {action.raw_effect}")

        # PDDL syntax
        if action.parameters:
            param_strs = [self._format_param_for_syntax(p) for p in action.parameters]
            syntax = f"({action.name} {' '.join(param_strs)})"
        else:
            syntax = f"({action.name})"
        lines.append(f"  Syntax: {syntax}")

        return '\n'.join(lines)

    def generate(self, domain: PDDLDomain) -> str:
        """Generate hybrid NL+PDDL domain description."""
        self.domain_name = domain.domain_name.lower()

        sections = []

        # Domain overview
        sections.append("## Domain Overview")
        sections.append("")
        sections.append(NLTemplates.get_domain_description(domain.domain_name))
        sections.append("")

        # Actions section
        sections.append("## Actions")
        sections.append("")
        sections.append("The following actions are available. Use the exact syntax shown when creating plans.")
        sections.append("")

        for action in domain.actions:
            sections.append(self._format_action(action))
            sections.append("")

        return '\n'.join(sections).rstrip()


# ==============================================================================
# 6. CONSTRAINT NL GENERATOR
# ==============================================================================

class ConstraintNLGenerator:
    """Generate natural language from PDDLExpr AST."""

    def __init__(self, domain_name: str, objects_by_type: Dict[str, List[str]]):
        self.domain_name = domain_name.lower()
        self.objects_by_type = objects_by_type

    def _pred_to_nl(self, predicate_name: str, args: List[str], context: Dict[str, str] = None) -> str:
        """
        Convert a predicate to natural language, substituting variables from context.
        Returns without period and lowercase for embedding in sentences.
        """
        # Substitute variables from context if provided
        substituted_args = []
        for arg in args:
            if context and arg in context:
                substituted_args.append(context[arg])
            else:
                substituted_args.append(arg)

        templates = NLTemplates.get_templates(self.domain_name)
        pred_lower = predicate_name.lower()

        if pred_lower in templates:
            template = templates[pred_lower]
            try:
                return template.format(*substituted_args)
            except (IndexError, KeyError):
                pass

        # Generic fallback
        if substituted_args:
            return f"{predicate_name}({', '.join(substituted_args)}) holds"
        else:
            return f"{predicate_name} holds"

    def expr_to_nl(self, expr: PDDLExpr, context: Dict[str, str] = None) -> str:
        """
        Recursively convert PDDLExpr to natural language.

        Args:
            expr: The expression to convert
            context: Variable substitution context {?var: value}
        """
        if context is None:
            context = {}

        if expr.expr_type == ExprType.PREDICATE:
            return self._pred_to_nl(expr.predicate_name, expr.args, context)

        elif expr.expr_type == ExprType.NOT:
            if expr.children:
                inner = self.expr_to_nl(expr.children[0], context)
                return f"it is not the case that {inner}"
            return "not (empty)"

        elif expr.expr_type == ExprType.AND:
            if len(expr.children) == 0:
                return "true"
            elif len(expr.children) == 1:
                return self.expr_to_nl(expr.children[0], context)
            else:
                parts = [self.expr_to_nl(c, context) for c in expr.children]
                # Join with "and" for readability
                if len(parts) == 2:
                    return f"{parts[0]} and {parts[1]}"
                else:
                    return ", ".join(parts[:-1]) + f", and {parts[-1]}"

        elif expr.expr_type == ExprType.OR:
            if len(expr.children) == 0:
                return "false"
            elif len(expr.children) == 1:
                return self.expr_to_nl(expr.children[0], context)
            else:
                parts = [self.expr_to_nl(c, context) for c in expr.children]
                if len(parts) == 2:
                    return f"{parts[0]} or {parts[1]}"
                else:
                    return ", ".join(parts[:-1]) + f", or {parts[-1]}"

        elif expr.expr_type == ExprType.IMPLY:
            if len(expr.children) >= 2:
                antecedent = self.expr_to_nl(expr.children[0], context)
                consequent = self.expr_to_nl(expr.children[1], context)
                return f"if {antecedent}, then {consequent}"
            return "imply (malformed)"

        elif expr.expr_type == ExprType.FORALL:
            return self._handle_forall(expr, context)

        elif expr.expr_type == ExprType.EXISTS:
            return self._handle_exists(expr, context)

        elif expr.expr_type == ExprType.ALWAYS:
            if expr.children:
                inner = self.expr_to_nl(expr.children[0], context)
                return f"at all times during the plan, {inner} must hold"
            return "always (empty)"

        elif expr.expr_type == ExprType.SOMETIME:
            if expr.children:
                inner = self.expr_to_nl(expr.children[0], context)
                return f"{inner} must become true at some point during the plan"
            return "sometime (empty)"

        elif expr.expr_type == ExprType.SOMETIME_BEFORE:
            if len(expr.children) >= 2:
                first = self.expr_to_nl(expr.children[0], context)
                second = self.expr_to_nl(expr.children[1], context)
                return f"before \"{first}\" becomes true, \"{second}\" must be true at some point"
            return "sometime-before (malformed)"

        elif expr.expr_type == ExprType.SOMETIME_AFTER:
            if len(expr.children) >= 2:
                first = self.expr_to_nl(expr.children[0], context)
                second = self.expr_to_nl(expr.children[1], context)
                return f"after \"{first}\" becomes true, \"{second}\" must become true at some point"
            return "sometime-after (malformed)"

        elif expr.expr_type == ExprType.AT_MOST_ONCE:
            if expr.children:
                inner = self.expr_to_nl(expr.children[0], context)
                return f"\"{inner}\" is allowed to become true at most once during the entire plan"
            return "at-most-once (empty)"

        elif expr.expr_type == ExprType.AT_END:
            if expr.children:
                inner = self.expr_to_nl(expr.children[0], context)
                return f"at the end of the plan, {inner}"
            return "at-end (empty)"

        else:
            return f"(unknown expression type: {expr.expr_type})"

    def _handle_forall(self, expr: PDDLExpr, context: Dict[str, str]) -> str:
        """
        Handle forall quantifier.
        For small object sets, expand to conjunction.
        Otherwise, use "for every X" phrasing.
        """
        if not expr.variables or not expr.children:
            return "forall (malformed)"

        var_name, var_type = expr.variables[0]

        # Get objects of this type
        objects_of_type = self.objects_by_type.get(var_type, [])

        # If there's only one variable and small set of objects, expand
        if len(expr.variables) == 1 and 0 < len(objects_of_type) <= 4:
            expanded_parts = []
            for obj in objects_of_type:
                new_context = context.copy()
                new_context[var_name] = obj
                inner_nl = self.expr_to_nl(expr.children[0], new_context)
                expanded_parts.append(f"for {obj}: {inner_nl}")
            return "; ".join(expanded_parts)

        # Otherwise use generic phrasing
        type_label = var_type if var_type != 'object' else 'object'
        body_nl = self.expr_to_nl(expr.children[0], context)
        return f"for every {type_label} {var_name}: {body_nl}"

    def _handle_exists(self, expr: PDDLExpr, context: Dict[str, str]) -> str:
        """Handle exists quantifier."""
        if not expr.variables or not expr.children:
            return "exists (malformed)"

        var_name, var_type = expr.variables[0]
        type_label = var_type if var_type != 'object' else 'object'
        body_nl = self.expr_to_nl(expr.children[0], context)
        return f"there exists some {type_label} {var_name} such that {body_nl}"

    def constraint_to_nl(self, constraint: PDDLExpr) -> str:
        """
        Convert a top-level constraint expression to a complete NL sentence.
        """
        nl = self.expr_to_nl(constraint)
        # Capitalize first letter
        if nl:
            nl = nl[0].upper() + nl[1:]
        # Add period if not present
        if not nl.endswith('.'):
            nl += '.'
        return nl


# ==============================================================================
# 6. NL DOCUMENT GENERATOR
# ==============================================================================

class NLDocumentGenerator:
    """Generates structured natural language document from parsed PDDL."""

    def __init__(self, domain_name: str = ""):
        self.domain_name = domain_name.lower() if domain_name else ""

    def _format_objects(self, objects_by_type: Dict[str, List[str]], all_objects: List[str]) -> str:
        """Format objects section, grouping by type."""
        if not objects_by_type:
            if all_objects:
                return ', '.join(all_objects)
            return "None"

        # Special handling for blocksworld - use "Blocks:" label
        if self.domain_name == "blocksworld":
            if 'object' in objects_by_type:
                return f"Blocks: {', '.join(objects_by_type['object'])}"
            else:
                # Collect all objects
                all_objs = []
                for objs in objects_by_type.values():
                    all_objs.extend(objs)
                return f"Blocks: {', '.join(all_objs)}"

        # For other domains, group by type
        lines = []
        for obj_type, objs in objects_by_type.items():
            if objs:
                type_label = obj_type.capitalize() if obj_type != 'object' else 'Objects'
                lines.append(f"{type_label}: {', '.join(objs)}")

        if lines:
            return '\n'.join(lines)
        return ', '.join(all_objects) if all_objects else "None"

    def _format_init(self, init: List[Tuple[str, List[str]]]) -> str:
        """Format initial state as bullet list."""
        if not init:
            return "- (empty initial state)"

        lines = []
        for pred_name, args in init:
            nl = NLTemplates.predicate_to_nl(self.domain_name, pred_name, args, with_period=True)
            lines.append(f"- {nl}")
        return '\n'.join(lines)

    def _format_goal(self, goal: List[Tuple[str, List[str]]]) -> str:
        """Format goal section."""
        if not goal:
            return "No goals specified."

        lines = ["All of the following must be true:"]
        for pred_name, args in goal:
            nl = NLTemplates.predicate_to_nl(self.domain_name, pred_name, args, with_period=True)
            lines.append(f"  - {nl}")
        return '\n'.join(lines)

    def _format_constraints(self, constraints: List[PDDLExpr], objects_by_type: Dict[str, List[str]]) -> str:
        """Format constraints section using the recursive NL generator."""
        if not constraints:
            return "None"

        generator = ConstraintNLGenerator(self.domain_name, objects_by_type)
        lines = []
        for constraint in constraints:
            nl = generator.constraint_to_nl(constraint)
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

        # Domain / Scenario
        sections.append("## Domain / Scenario")
        sections.append(f"Domain: {problem.domain_name or 'Unknown'}")
        sections.append("")

        # Objects
        sections.append("## Objects")
        sections.append(self._format_objects(problem.objects_by_type, problem.objects))
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
        sections.append("## Constraints")
        sections.append(self._format_constraints(problem.constraints, problem.objects_by_type))

        # Notes (only if there's content)
        notes = self._format_notes(problem)
        if notes:
            sections.append("")
            sections.append("## Notes")
            sections.append(notes)

        return '\n'.join(sections)


# ==============================================================================
# 7. FILE PROCESSOR
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

    def convert_file(self, input_path: Path, output_path: Path, dry_run: bool = False,
                     copy_soln: bool = True, copy_pddl: bool = True) -> bool:
        """
        Convert a single PDDL file to natural language.

        Args:
            input_path: Path to input PDDL file
            output_path: Path for output .txt file
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
            problem = self.parser.parse(content)

            # Generate NL document
            generator = NLDocumentGenerator(problem.domain_name)
            nl_document = generator.generate(problem)

            # Write output (unless dry run)
            if not dry_run:
                output_path.parent.mkdir(parents=True, exist_ok=True)
                output_path.write_text(nl_document, encoding='utf-8')

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
        Convert a PDDL domain file to hybrid NL+PDDL format.

        Args:
            domain_path: Path to input domain PDDL file
            output_path: Path for output file (default: domain3_nl.txt in same directory)
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
            domain_parser = PDDLDomainParser()
            domain = domain_parser.parse(content)

            # Generate hybrid NL document
            generator = DomainHybridNLGenerator(domain.domain_name)
            nl_document = generator.generate(domain)

            # Determine output path
            if output_path is None:
                output_path = domain_path.parent / f"{domain_path.stem}_nl.txt"

            # Write output (unless dry run)
            if not dry_run:
                output_path.parent.mkdir(parents=True, exist_ok=True)
                output_path.write_text(nl_document, encoding='utf-8')

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
        Convert all PDDL files in a directory.

        Args:
            input_dir: Input directory containing PDDL files
            output_dir: Output directory (default: testing_problems_nl/ under input_dir)
            recursive: Whether to process subdirectories
            dry_run: If True, parse but don't write files
            copy_soln: If True, copy corresponding .soln files to output directory
            copy_pddl: If True, copy original .pddl files to output directory

        Returns:
            Dict with counts: {"success": N, "failed": M, "total": N+M}
        """
        if output_dir is None:
            output_dir = input_dir / "testing_problems_nl"

        # Resolve output_dir to absolute path for comparison
        output_dir_resolved = output_dir.resolve()

        # Find all PDDL files
        if recursive:
            pddl_files = list(input_dir.rglob("*.pddl"))
        else:
            pddl_files = list(input_dir.glob("*.pddl"))

        # Filter out domain files
        pddl_files = [f for f in pddl_files if 'domain' not in f.name.lower()]

        # Filter out files already in the output directory (to avoid copying same file to itself)
        pddl_files = [f for f in pddl_files if not str(f.resolve()).startswith(str(output_dir_resolved))]

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
            # input/file.pddl -> output_dir/file.txt
            output_file = output_dir / f"{pddl_file.stem}.txt"

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
                output_path = input_path.parent / "testing_problems_nl" / f"{input_path.stem}.txt"

            success = self.convert_file(input_path, output_path, dry_run, copy_soln, copy_pddl)
            return {"success": 1 if success else 0, "failed": 0 if success else 1, "total": 1}

        elif input_path.is_dir():
            return self.convert_directory(input_path, output_path, recursive, dry_run, copy_soln, copy_pddl)

        else:
            print(f"Error: {input_path} is not a valid file or directory")
            return {"success": 0, "failed": 0, "total": 0}


# ==============================================================================
# 8. CLI INTERFACE
# ==============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="Convert PDDL3 problem/domain files to natural language descriptions.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Convert problem files to NL
  python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/
  python script/pddl_to_nl.py --input path/to/single_file.pddl

  # Convert domain file to hybrid NL+PDDL format
  python script/pddl_to_nl.py --domain-file pddl3/blocksworld/domain3.pddl

  # Convert both problems and domain
  python script/pddl_to_nl.py --input pddl3/blocksworld/testing_problem50/ --convert-domain
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
        help='Convert a domain PDDL file to hybrid NL+PDDL format'
    )

    parser.add_argument(
        '--convert-domain',
        action='store_true',
        help='When processing a directory, also convert domain3.pddl to hybrid NL format'
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

    args = parser.parse_args()

    # Validate arguments
    if not args.input and not args.domain_file:
        print("Error: Must specify either --input or --domain-file")
        return 1

    converter = PDDLToNLConverter(verbose=args.verbose)

    # Handle domain file conversion
    if args.domain_file:
        domain_path = Path(args.domain_file)
        if not domain_path.exists():
            print(f"Error: Domain file does not exist: {domain_path}")
            return 1

        print(f"Converting domain file: {domain_path}")
        success = converter.convert_domain_file(domain_path, dry_run=args.dry_run)

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
                converter.convert_domain_file(domain_file, dry_run=args.dry_run)

        results = converter.convert(
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
