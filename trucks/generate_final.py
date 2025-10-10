#!/usr/bin/env python3
"""
Final trucks problem generator
"""

import os
import subprocess
import random
import hashlib

def generate_single_problem(trucks, locations, packages, areas, seed, problem_num, output_dir):
    """Generate a single problem and return the file path"""
    filename = f"t{trucks}_l{locations}_p{packages}_a{areas}_s{seed}_n{problem_num}.pddl"
    output_path = os.path.join(output_dir, filename)
    
    # Use the trucks executable with output redirection
    cmd = [
        "/home/fjl2401/pddl_files/PDDL2/scenarios/trucks/trucks",
        "-t", str(trucks),
        "-l", str(locations),
        "-p", str(packages),
        "-a", str(areas),
        "-n", str(problem_num),
        "-seed", str(seed)
    ]
    
    try:
        with open(output_path, 'w') as f:
            result = subprocess.run(cmd, stdout=f, stderr=subprocess.PIPE, text=True, timeout=10)
        
        if result.returncode == 0 and os.path.exists(output_path) and os.path.getsize(output_path) > 0:
            return output_path
        else:
            if os.path.exists(output_path):
                os.remove(output_path)
            return None
    except Exception as e:
        if os.path.exists(output_path):
            os.remove(output_path)
        return None

def get_content_hash(filepath):
    """Get hash of file content"""
    try:
        with open(filepath, 'r') as f:
            return hashlib.md5(f.read().encode()).hexdigest()
    except:
        return None

def generate_problems(num_problems, output_dir, is_training=True):
    """Generate problems with simple parameters"""
    print(f"Generating {num_problems} {'training' if is_training else 'testing'} problems...")
    
    # Simple parameter ranges
    if is_training:
        truck_range = [1, 2]
        location_range = [2, 3, 4]
        package_range = [1, 2, 3, 4, 5]
        area_range = [1, 2, 3]
    else:
        truck_range = [1]
        location_range = [2, 3]
        package_range = [1, 2, 3]
        area_range = [1, 2]
    
    generated = []
    seen_hashes = set()
    attempts = 0
    max_attempts = num_problems * 5
    
    while len(generated) < num_problems and attempts < max_attempts:
        trucks = random.choice(truck_range)
        locations = random.choice(location_range)
        packages = random.choice(package_range)
        areas = random.choice(area_range)
        seed = random.randint(1, 1000000)
        problem_num = len(generated) + 1
        
        filepath = generate_single_problem(trucks, locations, packages, areas, seed, problem_num, output_dir)
        
        if filepath:
            content_hash = get_content_hash(filepath)
            if content_hash and content_hash not in seen_hashes:
                seen_hashes.add(content_hash)
                generated.append(filepath)
                if len(generated) % 100 == 0:
                    print(f"Generated {len(generated)} problems...")
            else:
                # Remove duplicate
                os.remove(filepath)
        
        attempts += 1
    
    print(f"Successfully generated {len(generated)} unique problems")
    return generated

def main():
    # Create directories
    training_dir = "/home/fjl2401/pddl_files/PDDL2/scenarios/trucks/training_problems"
    testing_dir = "/home/fjl2401/pddl_files/PDDL2/scenarios/trucks/testing_problems"
    
    os.makedirs(training_dir, exist_ok=True)
    os.makedirs(testing_dir, exist_ok=True)
    
    # Generate training problems
    training_files = generate_problems(1000, training_dir, is_training=True)
    
    # Generate testing problems
    testing_files = generate_problems(100, testing_dir, is_training=False)
    
    print(f"\nFinal Summary:")
    print(f"Training problems: {len(training_files)}")
    print(f"Testing problems: {len(testing_files)}")
    print(f"Total: {len(training_files) + len(testing_files)}")

if __name__ == "__main__":
    main()
