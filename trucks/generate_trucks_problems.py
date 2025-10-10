#!/usr/bin/env python3
"""
Generate trucks problems with simple parameters
"""

import os
import subprocess
import random
import hashlib
from pathlib import Path

def generate_problem(trucks, locations, packages, areas, seed, problem_num, output_dir):
    """Generate a single trucks problem"""
    filename = f"t{trucks}_l{locations}_p{packages}_a{areas}_s{seed}_n{problem_num}.pddl"
    output_path = os.path.join(output_dir, filename)
    
    # Get absolute path to trucks executable
    trucks_path = os.path.abspath("./trucks")
    
    cmd = [
        trucks_path,
        "-t", str(trucks),
        "-l", str(locations), 
        "-p", str(packages),
        "-a", str(areas),
        "-n", str(problem_num),
        "-seed", str(seed),
        filename  # Use relative filename, not full path
    ]
    
    try:
        # Change to output directory before running command
        original_cwd = os.getcwd()
        os.chdir(output_dir)
        
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        
        # Change back to original directory
        os.chdir(original_cwd)
        
        if result.returncode == 0 and os.path.exists(output_path):
            return output_path
        else:
            print(f"Error generating {filename}: {result.stderr}")
            return None
    except subprocess.TimeoutExpired:
        print(f"Timeout generating {filename}")
        return None
    except Exception as e:
        print(f"Exception generating {filename}: {e}")
        return None

def get_file_hash(filepath):
    """Get hash of file content to detect duplicates"""
    try:
        with open(filepath, 'r') as f:
            content = f.read()
        return hashlib.md5(content.encode()).hexdigest()
    except:
        return None

def generate_simple_problems(num_problems, output_dir, is_training=True):
    """Generate simple trucks problems"""
    print(f"Generating {num_problems} {'training' if is_training else 'testing'} problems...")
    
    # Simple parameter ranges for easy problems
    if is_training:
        # Training problems: more variety but still simple
        truck_range = [1, 2]
        location_range = [2, 3, 4]
        package_range = [1, 2, 3, 4, 5]
        area_range = [1, 2, 3]
    else:
        # Testing problems: even simpler
        truck_range = [1]
        location_range = [2, 3]
        package_range = [1, 2, 3]
        area_range = [1, 2]
    
    generated_files = []
    seen_hashes = set()
    problem_num = 1
    
    while len(generated_files) < num_problems:
        # Random parameters within simple ranges
        trucks = random.choice(truck_range)
        locations = random.choice(location_range)
        packages = random.choice(package_range)
        areas = random.choice(area_range)
        seed = random.randint(1, 1000000)
        
        # Generate problem
        filepath = generate_problem(trucks, locations, packages, areas, seed, problem_num, output_dir)
        
        if filepath and os.path.exists(filepath):
            # Check for duplicates
            file_hash = get_file_hash(filepath)
            if file_hash and file_hash not in seen_hashes:
                seen_hashes.add(file_hash)
                generated_files.append(filepath)
                print(f"Generated: {os.path.basename(filepath)} (unique)")
            else:
                # Remove duplicate
                os.remove(filepath)
                print(f"Skipped duplicate: t{trucks}_l{locations}_p{packages}_a{areas}_s{seed}_n{problem_num}")
        
        problem_num += 1
        
        # Safety check to avoid infinite loop
        if problem_num > num_problems * 10:
            print(f"Warning: Generated {len(generated_files)} unique problems out of {num_problems} requested")
            break
    
    print(f"Successfully generated {len(generated_files)} unique problems")
    return generated_files

def main():
    # Change to trucks directory
    os.chdir("/home/fjl2401/pddl_files/PDDL2/scenarios/trucks")
    
    # Generate training problems
    training_files = generate_simple_problems(1000, "training_problems", is_training=True)
    
    # Generate testing problems  
    testing_files = generate_simple_problems(100, "testing_problems", is_training=False)
    
    print(f"\nSummary:")
    print(f"Training problems: {len(training_files)}")
    print(f"Testing problems: {len(testing_files)}")
    print(f"Total: {len(training_files) + len(testing_files)}")

if __name__ == "__main__":
    main()
