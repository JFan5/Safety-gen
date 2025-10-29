# Slurm Job Quick Reference

This guide lists the basic commands for working with the Slurm jobs in this project.

## Submit a job

Job scripts are grouped by model, job type, and domain. For example, Mistral fine-tune scripts live under `slurm_jobs/mistral/fine_tune/<domain>/`, while evaluation scripts live under `slurm_jobs/mistral/evaluate/<domain>/`.

```bash
sbatch slurm_jobs/<model>/<job-type>/<domain>/<script>.job
```

Example: submit the SFT logistics evaluation (no specific PDDL variant):

```bash
sbatch slurm_jobs/mistral/evaluate/logistics/sft_base.job
```

## Check job queue status

Show all running or pending jobs in the cluster:

```bash
squeue
```

Show only your jobs:

```bash
squeue -u $USER
```

## Inspect a specific job

```bash
squeue -j <job-id>
```

For detailed accounting information after completion:

```bash
sacct -j <job-id>
```

To display the full job record:

```bash
scontrol show job <job-id>
```

## Cancel a job

```bash
scancel <job-id>
```

Cancel every job you own:

```bash
scancel -u $USER
```
