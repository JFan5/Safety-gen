#!/usr/bin/env python3
"""
PDDL Data Augmentation Script for LLM Fine-Tuning (v5.0 - PER-INSTANCE RANDOMIZATION)

Changes in v5.0:
1. Implements PER-INSTANCE RANDOMIZATION: Every single problem gets a unique mapping 
   for predicates, actions, and types. This forces the model to read the domain definition 
   contextually rather than memorizing a static mapping.
2. Saves unique domain files for each problem (e.g., domain_problem_1.pddl).
3. Maintains HF Dataset support and Robust Regex.

Usage:
    python pddl_augment.py --input_dir pddl3/ --output_dir output_data/ --save_hf
"""

import argparse
import json
import re
import random
import os
import shutil
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass, asdict, field

# Try importing datasets
try:
    import datasets
    HF_AVAILABLE = True
except ImportError:
    HF_AVAILABLE = False
    print("Warning: 'datasets' library not found. HF output will be disabled. Run `pip install datasets`.")

# ==============================================================================
# 1. CONSTANTS & CONFIG
# ==============================================================================

PDDL_KEYWORDS = frozenset([
    'define', 'domain', 'problem', ':requirements', ':strips', ':typing', ':equality',
    ':negative-preconditions', ':disjunctive-preconditions', ':existential-preconditions',
    ':universal-preconditions', ':quantified-preconditions', ':conditional-effects',
    ':fluents', ':numeric-fluents', ':adl', ':durative-actions', ':derived-predicates',
    ':timed-initial-literals', ':preferences', ':constraints', ':action-costs',
    ':types', ':constants', ':predicates', ':functions', ':action', ':parameters',
    ':precondition', ':effect', ':vars', ':durative-action', ':duration', ':condition',
    ':domain', ':objects', ':init', ':goal', ':metric', 'and', 'or', 'not', 'imply',
    'exists', 'forall', 'when', 'start', 'end', 'over', 'all', 'sometime', 'always',
    'within', 'at-most-once', 'sometime-after', 'sometime-before', 'always-within',
    'hold-during', 'hold-after', 'increase', 'decrease', 'assign', 'scale-up',
    'scale-down', 'minimize', 'maximize', 'total-cost', 'total-time', 'either', 'object'
])

PDDL_BUILTIN_PREDICATES = frozenset(['=', 'eq', 'not-eq', '!=', '<', '>', '<=', '>=', 'true', 'false'])


# ==============================================================================
# 2. DATA STRUCTURES
# ==============================================================================

@dataclass
class SymbolizationMapping:
    predicates: Dict[str, str] = field(default_factory=dict)
    actions: Dict[str, str] = field(default_factory=dict)
    objects: Dict[str, str] = field(default_factory=dict)
    types: Dict[str, str] = field(default_factory=dict)
    variables: Dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> Dict:
        return asdict(self)


# ==============================================================================
# 3. PARSER & SYMBOLIZER
# ==============================================================================

class PDDLParser:
    @staticmethod
    def extract_predicates(domain_content: str) -> List[str]:
        predicates = []
        start_pattern = r'\(:predicates\s+'
        start_match = re.search(start_pattern, domain_content, re.IGNORECASE)
        if start_match:
            start_pos = start_match.end()
            depth = 1
            i = start_pos
            while i < len(domain_content) and depth > 0:
                if domain_content[i] == '(': depth += 1
                elif domain_content[i] == ')': depth -= 1
                i += 1
            if depth == 0:
                pred_block = domain_content[start_pos:i-1]
                pred_defs = re.findall(r'\(([\w-]+)(?:\s+[^)]*)?', pred_block)
                predicates = [p for p in pred_defs if p.lower() not in PDDL_KEYWORDS and p.lower() not in PDDL_BUILTIN_PREDICATES]
        return list(set(predicates))

    @staticmethod
    def extract_actions(domain_content: str) -> List[str]:
        pattern = r'\(:(?:durative-)?action\s+([\w-]+)'
        matches = re.findall(pattern, domain_content, re.IGNORECASE)
        return list(set(matches))

    @staticmethod
    def extract_objects(problem_content: str) -> List[str]:
        objects = []
        obj_pattern = r'\(:objects\s+(.*?)\)'
        match = re.search(obj_pattern, problem_content, re.DOTALL | re.IGNORECASE)
        if match:
            obj_block = match.group(1)
            tokens = obj_block.split()
            skip_next = False
            for token in tokens:
                token = token.strip()
                if skip_next: skip_next = False; continue
                if token == '-': skip_next = True; continue
                if token and not token.startswith(';') and re.match(r'^[a-zA-Z0-9_-]+$', token):
                    if token.lower() not in PDDL_KEYWORDS: objects.append(token)
        return list(set(objects))

    @staticmethod
    def extract_types(domain_content: str) -> List[str]:
        types = []
        type_pattern = r'\(:types\s+(.*?)\)'
        match = re.search(type_pattern, domain_content, re.DOTALL | re.IGNORECASE)
        if match:
            type_block = match.group(1)
            tokens = type_block.split()
            skip_next = False
            for token in tokens:
                token = token.strip()
                if skip_next: skip_next = False; continue
                if token == '-': skip_next = True; continue
                if token and not token.startswith(';') and re.match(r'^[a-zA-Z0-9_-]+$', token):
                    if token.lower() not in PDDL_KEYWORDS: types.append(token)
        return list(set(types))

    @staticmethod
    def extract_variables(domain_content: str) -> List[str]:
        pattern = r'\?([a-zA-Z][a-zA-Z0-9_-]*)'
        matches = re.findall(pattern, domain_content)
        return list(set(matches))


class PDDLSymbolizer:
    def __init__(self, seed: Optional[int] = None):
        self.seed = seed
        self.pred_prefix = "pred_"
        self.action_prefix = "op_"
        self.object_prefix = "obj_"
        self.type_prefix = "type_"
        self.var_prefix = "v"
        if seed is not None: random.seed(seed)

    def generate_domain_mapping(self, predicates: List[str], actions: List[str], 
                              types: List[str], variables: List[str]) -> SymbolizationMapping:
        """Generate mapping for Domain-level entities (Consistent per domain)"""
        pred_list = [p for p in predicates if p.lower() not in PDDL_BUILTIN_PREDICATES and p.lower() not in PDDL_KEYWORDS]
        action_list = list(actions)
        type_list = [t for t in types if t.lower() not in PDDL_KEYWORDS]
        var_list = list(variables)

        random.shuffle(pred_list)
        random.shuffle(action_list)
        random.shuffle(type_list)
        random.shuffle(var_list)

        mapping = SymbolizationMapping()
        mapping.predicates = {p: f"{self.pred_prefix}{i+1}" for i, p in enumerate(pred_list)}
        mapping.actions = {a: f"{self.action_prefix}{i+1}" for i, a in enumerate(action_list)}
        mapping.types = {t: f"{self.type_prefix}{i+1}" for i, t in enumerate(type_list)}
        mapping.variables = {v: f"{self.var_prefix}{i+1}" for i, v in enumerate(var_list)}
        return mapping

    def generate_object_mapping(self, objects: List[str]) -> Dict[str, str]:
        obj_list = list(objects)
        random.shuffle(obj_list)
        width = max(2, len(str(len(obj_list))))
        return {o: f"{self.object_prefix}{str(i+1).zfill(width)}" for i, o in enumerate(obj_list)}

    def _replace_tokens(self, text: str, token_map: Dict[str, str]) -> str:
        if not token_map: return text
        sorted_tokens = sorted(token_map.items(), key=lambda x: len(x[0]), reverse=True)
        for old_token, new_token in sorted_tokens:
            pddl_id_char = r'[a-zA-Z0-9_\-]'
            pattern = r'(?<!\?)(?<!' + pddl_id_char + r')' + re.escape(old_token) + r'(?!' + pddl_id_char + r')'
            text = re.sub(pattern, new_token, text, flags=re.IGNORECASE)
        return text

    def _replace_variables(self, text: str, var_map: Dict[str, str]) -> str:
        if not var_map: return text
        sorted_vars = sorted(var_map.items(), key=lambda x: len(x[0]), reverse=True)
        for old_var, new_var in sorted_vars:
            pddl_id_char = r'[a-zA-Z0-9_\-]'
            pattern = r'\?' + re.escape(old_var) + r'(?!' + pddl_id_char + r')'
            text = re.sub(pattern, '?' + new_var, text, flags=re.IGNORECASE)
        return text

    def symbolize_domain(self, domain_content: str, mapping: SymbolizationMapping) -> str:
        result = domain_content
        domain_name_match = re.search(r'\(define\s+\(domain\s+([\w-]+)\)', result, re.IGNORECASE | re.DOTALL)
        original_domain_name = domain_name_match.group(1) if domain_name_match else None

        result = self._replace_tokens(result, mapping.predicates)
        result = self._replace_tokens(result, mapping.actions)
        result = self._replace_tokens(result, mapping.types)
        result = self._replace_variables(result, mapping.variables)

        if original_domain_name:
            result = re.sub(r'\(define\s+\(domain\s+([\w-]+)\)', f'(define (domain {original_domain_name})', result, count=1, flags=re.IGNORECASE | re.DOTALL)
        return result

    def symbolize_problem(self, problem_content: str, mapping: SymbolizationMapping) -> str:
        result = problem_content
        problem_name_match = re.search(r'\(define\s+\(problem\s+([\w-]+)\)', result, re.IGNORECASE | re.DOTALL)
        original_problem_name = problem_name_match.group(1) if problem_name_match else None
        domain_ref_match = re.search(r'\(:domain\s+([\w-]+)\)', result, re.IGNORECASE | re.DOTALL)
        original_domain_ref = domain_ref_match.group(1) if domain_ref_match else None

        lines = result.split('\n')
        non_comment_lines = []
        comment_lines_info = []
        for i, line in enumerate(lines):
            stripped = line.lstrip()
            if stripped.startswith(';'):
                comment_lines_info.append((i, line))
                non_comment_lines.append('') 
            else:
                non_comment_lines.append(line)
        result = '\n'.join(non_comment_lines)

        result = self._replace_tokens(result, mapping.predicates)
        result = self._replace_tokens(result, mapping.objects)
        result = self._replace_tokens(result, mapping.types)

        result_lines = result.split('\n')
        for i, original_line in comment_lines_info:
            if i < len(result_lines): result_lines[i] = original_line
        result = '\n'.join(result_lines)

        if original_problem_name:
            result = re.sub(r'\(define\s+\(problem\s+([\w-]+)\)', f'(define (problem {original_problem_name})', result, count=1, flags=re.IGNORECASE | re.DOTALL)
        if original_domain_ref:
            result = re.sub(r'\(:domain\s+([\w-]+)\)', f'(:domain {original_domain_ref})', result, count=1, flags=re.IGNORECASE | re.DOTALL)
        return result

    def symbolize_plan(self, plan_content: str, mapping: SymbolizationMapping) -> str:
        lines = plan_content.strip().split('\n')
        new_lines = []
        for line in lines:
            line = line.strip()
            if not line or line.startswith(';'):
                new_lines.append(line)
                continue
            prefix_match = re.match(r'^(\d+:\s*)', line)
            prefix = prefix_match.group(1) if prefix_match else ''
            action_part = line[len(prefix):] if prefix else line
            
            action_part = self._replace_tokens(action_part, mapping.actions)
            action_part = self._replace_tokens(action_part, mapping.objects)
            new_lines.append(prefix + action_part)
        return '\n'.join(new_lines) + '\n' # Ensure trailing newline


# ==============================================================================
# 4. MAIN AUGMENTER LOGIC
# ==============================================================================

class PDDLAugmenter:
    DEFAULT_PROMPT_TEMPLATE_PATH = Path(__file__).parent.parent / "prompt.txt"

    def __init__(self, seed: Optional[int] = None, prompt_template_path: Optional[Path] = None, mix_original: bool = True):
        self.parser = PDDLParser()
        self.symbolizer = PDDLSymbolizer(seed=seed)
        self.mix_original = mix_original

        # Load prompt template from file
        template_path = prompt_template_path or self.DEFAULT_PROMPT_TEMPLATE_PATH
        self.prompt_template = self._load_prompt_template(template_path)

    def _load_prompt_template(self, template_path: Path) -> str:
        """Load the prompt template from file and extract the template string."""
        template_path = Path(template_path)
        if not template_path.exists():
            raise FileNotFoundError(f"Prompt template file not found: {template_path}")

        content = template_path.read_text(encoding='utf-8')

        # The file contains: prompt = f"""..."""
        # Extract the template string between triple quotes
        match = re.search(r'f?"""(.*?)"""', content, re.DOTALL)
        if match:
            return match.group(1).strip()

        # Fallback: use the entire content as template
        return content.strip()

    def _fill_prompt_template(self, domain_content: str, problem_content: str) -> str:
        """Fill the prompt template with domain and problem content."""
        return self.prompt_template.format(
            domain_content=domain_content,
            problem_content=problem_content
        )

    def process(self, input_dir: Path, output_dir: Path,
                domains: Optional[List[str]] = None,
                domain_filename: str = "domain3.pddl",
                problems_subdir: str = "sft_500",
                plan_extension: str = ".soln",
                write_symbolized_files: bool = True,
                save_hf: bool = False) -> Dict[str, int]:
        
        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
        results = {}
        all_entries = []

        if domains: domain_dirs = [input_dir / d for d in domains if (input_dir / d).is_dir()]
        else: domain_dirs = [d for d in sorted(input_dir.iterdir()) if d.is_dir()]

        for domain_dir in domain_dirs:
            domain_name = domain_dir.name
            domain_file = domain_dir / domain_filename
            if not domain_file.exists(): continue
            problems_dir = domain_dir / problems_subdir
            if not problems_dir.exists(): continue

            print(f"Processing domain: {domain_name} (Per-Instance Randomization Mode)")
            domain_pddl = domain_file.read_text(encoding='utf-8')
            
            # --- EXTRACT RAW DOMAIN ELEMENTS (Do this once) ---
            raw_predicates = self.parser.extract_predicates(domain_pddl)
            raw_actions = self.parser.extract_actions(domain_pddl)
            raw_types = self.parser.extract_types(domain_pddl)
            raw_variables = self.parser.extract_variables(domain_pddl)
            
            # Prepare output directory for symbolized files
            symbolized_subdir_name = f"{problems_subdir}_symbolized"
            symbolized_dir = domain_dir / symbolized_subdir_name
            if write_symbolized_files:
                symbolized_dir.mkdir(parents=True, exist_ok=True)

            domain_entries = []
            problem_files = sorted(problems_dir.glob("*.pddl"))
            
            # === PER-PROBLEM LOOP ===
            for problem_file in problem_files:
                plan_file = problem_file.with_suffix(plan_extension)
                if not plan_file.exists(): continue

                problem_pddl = problem_file.read_text(encoding='utf-8')
                plan = plan_file.read_text(encoding='utf-8')

                # 1. Generate NEW DOMAIN MAPPING for THIS specific problem
                # This ensures every problem sees a "different" domain logic structure
                domain_mapping = self.symbolizer.generate_domain_mapping(
                    raw_predicates, raw_actions, raw_types, raw_variables
                )
                
                # 2. Symbolize Domain (Unique to this problem)
                sym_domain_pddl = self.symbolizer.symbolize_domain(domain_pddl, domain_mapping)

                # 3. Object mapping
                objects = self.parser.extract_objects(problem_pddl)
                object_mapping = self.symbolizer.generate_object_mapping(objects)
                
                # 4. Merge mappings
                full_mapping = SymbolizationMapping(
                    predicates=domain_mapping.predicates,
                    actions=domain_mapping.actions,
                    types=domain_mapping.types,
                    variables=domain_mapping.variables,
                    objects=object_mapping
                )

                # 5. Symbolize Problem & Plan
                sym_problem = self.symbolizer.symbolize_problem(problem_pddl, full_mapping)
                sym_plan = self.symbolizer.symbolize_plan(plan, full_mapping)

                # Metadata paths (Note: Domain file is now specific to the problem)
                domain_file_rel = f"pddl3/{domain_name}/{domain_filename}"
                problem_file_rel = f"pddl3/{domain_name}/{problems_subdir}/{problem_file.name}"
                
                # We name the unique domain file as "domain_<problem_name>.pddl"
                unique_domain_filename = f"domain_{problem_file.stem}.pddl"
                sym_domain_file_rel = f"pddl3/{domain_name}/{symbolized_subdir_name}/{unique_domain_filename}"
                sym_problem_file_rel = f"pddl3/{domain_name}/{symbolized_subdir_name}/{problem_file.name}"

                meta_symbolized = {
                    "scenario": domain_name,
                    "problem_id": problem_file.stem,
                    "domain_file": sym_domain_file_rel,
                    "problem_file": sym_problem_file_rel,
                }

                # JSONL Construction (Symbolized) - Uses the UNIQUE sym_domain_pddl
                prompt_sym = self._fill_prompt_template(sym_domain_pddl, sym_problem)
                entry_sym = {
                    "prompt": prompt_sym,
                    "path": sym_plan, 
                    "scenario": domain_name,
                    "problem_name": problem_file.stem,
                    "type": "symbolized",
                    "meta": meta_symbolized,
                }
                domain_entries.append(entry_sym)

                # JSONL Construction (Original) - Uses the ORIGINAL shared domain
                if self.mix_original:
                    meta_original = {
                        "scenario": domain_name,
                        "problem_id": problem_file.stem,
                        "domain_file": domain_file_rel,
                        "problem_file": problem_file_rel,
                    }
                    prompt_orig = self._fill_prompt_template(domain_pddl, problem_pddl)
                    entry_orig = {
                        "prompt": prompt_orig,
                        "path": plan,
                        "scenario": domain_name,
                        "problem_name": problem_file.stem,
                        "type": "original",
                        "meta": meta_original,
                    }
                    domain_entries.append(entry_orig)

                # Save physical files if requested
                if write_symbolized_files:
                    # Write Unique Domain File
                    (symbolized_dir / unique_domain_filename).write_text(sym_domain_pddl, encoding='utf-8')
                    # Write Symbolized Problem
                    (symbolized_dir / problem_file.name).write_text(sym_problem, encoding='utf-8')
                    # Write Symbolized Plan
                    (symbolized_dir / f"{problem_file.stem}{plan_extension}").write_text(sym_plan, encoding='utf-8')

            # Write JSONL for this domain
            if domain_entries:
                with open(output_dir / f"{domain_name}.jsonl", 'w', encoding='utf-8') as f:
                    for entry in domain_entries:
                        f.write(json.dumps(entry, ensure_ascii=False) + '\n')
                results[domain_name] = len(domain_entries)
                all_entries.extend(domain_entries)

                # Save per-domain HF dataset
                if save_hf and HF_AVAILABLE:
                    per_domain_hf_path = output_dir / f"{domain_name}.hf"
                    if per_domain_hf_path.exists():
                        shutil.rmtree(per_domain_hf_path)
                    print(f"Saving HF Dataset for {domain_name} to: {per_domain_hf_path}")
                    ds_domain = datasets.Dataset.from_list(domain_entries)
                    ds_domain.save_to_disk(per_domain_hf_path)

        # Write Combined JSONL
        if all_entries:
            jsonl_path = output_dir / "train_combined.jsonl"
            with open(jsonl_path, 'w', encoding='utf-8') as f:
                for entry in all_entries:
                    f.write(json.dumps(entry, ensure_ascii=False) + '\n')
            print(f"JSONL saved to: {jsonl_path}")

            # Save combined HF dataset
            if save_hf and HF_AVAILABLE:
                combined_hf_path = output_dir / "combined.hf"
                if combined_hf_path.exists():
                    shutil.rmtree(combined_hf_path)
                print(f"Saving combined HF Dataset to: {combined_hf_path}")
                ds_all = datasets.Dataset.from_list(all_entries)
                ds_all.save_to_disk(combined_hf_path)
                print("✅ Combined HF Dataset saved successfully!")

        return results

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input_dir', type=str, required=True, help="Root directory of PDDL domains")
    parser.add_argument('--output_dir', type=str, required=True, help="Directory to save JSONL and HF dataset")
    parser.add_argument('--domains', nargs='+', help="Specific domains to process")
    parser.add_argument('--problems_subdir', type=str, default="sft_500",
                        help="Subdirectory under each domain containing problems/plans (e.g., sft_500 or grpo_500)")
    parser.add_argument('--seed', type=int, help="Random seed")
    parser.add_argument('--no-mix-original', action='store_false', dest='mix_original', help="Do not include original PDDL")
    parser.add_argument('--save_hf', action='store_true', help="Also save as Hugging Face Dataset (.arrow/disk format)")
    parser.add_argument('--prompt_template', type=str, default=None,
                        help="Path to prompt template file (default: prompt.txt in project root)")
    parser.set_defaults(mix_original=True)
    args = parser.parse_args()

    prompt_template_path = Path(args.prompt_template) if args.prompt_template else None
    augmenter = PDDLAugmenter(seed=args.seed, prompt_template_path=prompt_template_path, mix_original=args.mix_original)
    augmenter.process(Path(args.input_dir), Path(args.output_dir),
                     domains=args.domains,
                     problems_subdir=args.problems_subdir,
                     save_hf=args.save_hf)

if __name__ == '__main__':
    main()