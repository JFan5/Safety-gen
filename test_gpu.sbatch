#!/bin/bash
#SBATCH --job-name=test-gpu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=0:05:00
#SBATCH --output=slurm-%j.out

echo "Starting GPU test job on $(hostname)"
echo "CUDA visible devices: ${CUDA_VISIBLE_DEVICES}"
nvidia-smi
