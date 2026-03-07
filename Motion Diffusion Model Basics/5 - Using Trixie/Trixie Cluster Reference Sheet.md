> [!abstract] Introduction
> 
> ## About Trixie

Trixie is the NRC's AI GPU cluster—a powerful resource with **36 compute nodes** and **144 NVIDIA V100 GPUs** (4 GPUs per node).

**Key Hardware Specifications:**

- **Total GPUs:** 144 × NVIDIA V100 (32GB each)
- **Compute nodes:** 36 nodes
- **Per-node resources:**
    - 4 V100 GPUs
    - 32 CPU cores
    - 192 GB RAM
- **Interconnect:** Fast InfiniBand network for low-latency multi-node communication
- **Storage:** 1 PB GPFS filesystem (accessible from all nodes)
- **Scheduler:** SLURM 22.05.9
- **Operating system:** RHEL 9
- **Max job time:** 12 hours on TrixieMain partition

**Trixie is organized in layers:**
![[System Diagram|100%]]

1. **Top layer:** 2 Login/Headnodes
    - Used for SSH and job submission only
    - **Never run computations here**
2. **Middle layer:** 36 Compute Nodes
    - Each with 4 V100 GPUs, 32 CPU cores, 192GB RAM
    - Where actual jobs execute
3. **Interconnect:** InfiniBand
    - Low-latency communication for multi-node jobs
4. **Scheduler:** SLURM
    - Manages job allocation and fairness
5. **Storage:** 1 PB GPFS
    - Shared across all nodes

---

> [!info] Info
> 
> ## Storage: Quotas and Locations

Trixie has strict storage quotas across multiple locations:

|Location|Size|Purpose|Backup|
|---|---|---|---|
|`/home/liuyir/`|**50 GB**|Conda environments, package dependencies, small config files|No|
|`/gpfs/projects/AIP/jpn-302/`|**1 TB**|Project code, datasets, model checkpoints, training data|No|
|`/gpfs/scratch/`|User-controlled|Temporary job files, intermediate results|No (purged periodically)|

> [!warning] Important Storage Rule **Large files (model checkpoints, datasets) belong in `/gpfs/projects/`.** Home directory is conserved for conda environments and small files only.

---

> [!abstract] Getting Started
> 
> ## Connecting & Setting Up

### Step 1: SSH into Trixie

Connect using RES (orange) account credentials:

```bash
ssh liuyir@trixie.res.nrc.gc.ca
```

Lands on a **headnode** — **never run long computations here**. Always use `sbatch` to submit jobs to compute nodes.

### Step 2: Verify My Account Access

Check my billing account:

```bash
sacctmgr show assoc user=$USER
```

Expected output:

```
Account    User
-------   ------
jpn-302   liuyir
```

### Step 3: Test with Interactive Shell (srun)

For quick testing during development, request an interactive shell on a compute node:

```bash
srun --nodes=1 --gpus-per-node=2 --cpus-per-task=16 --mem=32G --time=04:00:00 --pty bash
```

This gives me a live shell for testing before submitting batch jobs.

### Step 4: Create a Job Script

Template for `hello.sh`:

```bash
#!/bin/bash
#SBATCH --job-name=hello
#SBATCH --partition=TrixieMain
#SBATCH --account=jpn-302
#SBATCH --time=00:10:00
#SBATCH --gres=gpu:1

module load conda/3-24.9.0
echo "Hello from compute node $(hostname)"
nvidia-smi
```

**Key directives:**

- `--job-name`: Human-readable identifier
- `--account`: Billing code (**required**)
- `--partition`: Queue to use
- `--time`: Wall-clock time limit (HH:MM:SS)
- `--gres=gpu:1`: Request 1 GPU

### Step 5: Submit to SLURM

```bash
sbatch hello.sh
# Output: Submitted batch job 12345
```

### Step 6: Monitor My Job

Check status:

```bash
squeue -u $USER
```

Watch output in real-time:

```bash
tail -f slurm-12345.out
```

View full output after completion:

```bash
cat slurm-12345.out
```

---

> [!info] Info
> 
> ## Job Lifecycle

After submitting a job with `sbatch`, here's what happens:

![[SRUN State Flow|100%]]

1. **SUBMIT** — SLURM receives job script and logs it
2. **PENDING** — Job enters queue, waiting for resources (SLURM checks my account, verifies permissions, calculates priority)
3. **ALLOCATE** — Resources become available; SLURM assigns GPUs and compute nodes
4. **RUNNING** — Script executes on a compute node; output streams to `slurm-JOBID.out`
5. **MONITORING** — GPU is active, CPU running, job can be monitored in real-time with `squeue` and `nvidia-smi`
6. **COMPLETED** — Job finishes (successfully or with error); results available for download

---

> [!hint] Reference
> 
> ## SLURM Directives

The `#SBATCH` directives control job allocation:

|Directive|What It Does|Example|
|---|---|---|
|`--job-name`|Human-readable job name|`--job-name=pytorch_train`|
|`--account`|**REQUIRED** – Billing code|`--account=jpn-302`|
|`--partition`|Which queue to use|`--partition=TrixieMain`|
|`--time`|Maximum wall-clock time|`--time=02:00:00` (2 hours)|
|`--gres`|GPUs (generic resources)|`--gres=gpu:1` (1 GPU)|
|`--cpus-per-task`|CPU cores per task|`--cpus-per-task=8`|
|`--mem`|RAM per node|`--mem=64GB`|
|`--array`|Job array indices|`--array=0-9` (10 jobs)|

> [!warning] Critical: The --account flag is MANDATORY Every job must specify a valid account code. If you forget it, the job won't start.

---

> [!example] Example
> 
> ## Job Running Examples

### Single GPU PyTorch Training Job:

```bash
#!/bin/bash
#SBATCH --job-name=pytorch_train
#SBATCH --account=jpn-302
#SBATCH --partition=TrixieMain
#SBATCH --time=04:00:00
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB

module load conda/3-24.9.0
source activate pytorch
python train.py --epochs 100
```

### CPU-Only Job (No GPU):

```bash
#!/bin/bash
#SBATCH --job-name=cpu_job
#SBATCH --account=jpn-302
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=64GB

python data_preprocessing.py
```

Useful for data preprocessing, postprocessing, or analysis tasks that don't require GPU acceleration.
### Parameter Sweep (Job Array)

Run the same script with different parameters across multiple jobs:

```bash
#!/bin/bash
#SBATCH --job-name=sweep
#SBATCH --account=jpn-302
#SBATCH --array=0-9
#SBATCH --time=01:00:00
#SBATCH --gres=gpu:1

# Calculate learning rate based on job index
LR=$(echo "scale=4; 0.001 + $SLURM_ARRAY_TASK_ID * 0.0001" | bc)
python train.py --lr $LR
```

**What this does:**

- Creates $10$ independent jobs (indices $0$ to $9$)
- Each job gets a unique `$SLURM_ARRAY_TASK_ID` environment variable
- Learning rates range from $0.001$ to $0.001 + 9 \times 0.0001 = 0.002$
- All jobs enter the queue simultaneously
- Output files: `slurm-JOBID_0.out`, `slurm-JOBID_1.out`, etc.

Submit with:

```bash
sbatch param_sweep.sh
```

---

> [!info] Info
> 
> ## Monitor & Manage My Jobs

### Essential Commands

**View my jobs:**

```bash
squeue -u $USER
```

**Get detailed info about a specific job:**

```bash
scontrol show job 12345
```

**Cancel a job:**

```bash
scancel 12345
```

**Cancel all my jobs:**

```bash
scancel -u $USER
```

**View completed job accounting:**

```bash
sacct -j 12345
```

**Check cluster availability:**

```bash
sinfo
```

### Understanding squeue Output

|Column|Meaning|
|---|---|
|`JOBID`|Unique job identifier|
|`NAME`|Job name (from `#SBATCH --job-name`)|
|`USER`|My username|
|`ST`|State: `PD` (pending), `R` (running), `CA` (cancelled), `CD` (completed)|
|`TIME`|How long the job has been running|
|`NODELIST`|Which compute node(s) it's on|

---

> [!example] Example
> 
> ## File Transfer

### Upload Files to Trixie

Transfer my code/data to Trixie:

```bash
scp -r my_project/ liuyir@trixie.res.nrc.gc.ca:~/
```

### Download Results Back

Retrieve my results from Trixie:

```bash
scp -r liuyir@trixie.res.nrc.gc.ca:~/results/ ./local_results/
```

### For Large Datasets: Use rsync

For efficient, resumable transfers of large files:

```bash
rsync -avz liuyir@trixie.res.nrc.gc.ca:~/data/ ./local_data/
```

The `-z` flag compresses data; `-a` preserves permissions and timestamps; `-v` provides verbose output.

---

> [!hint] Hint
> 
> ## Cheat Sheet

**Spinning Up an Instance:**
```bash
srun --nodes=1 --gpus-per-node=2 --cpus-per-task=16 --mem=32G --time=04:00:00 --pty bash
```

**Job Submission:**

```bash
sbatch script.sh                    # Submit single job
sbatch --array=0-9 script.sh        # Submit 10 jobs with array
```

**Monitoring My Jobs:**

```bash
squeue -u $USER                     # View my jobs
sinfo                               # Cluster status
cat slurm-JOBID.out                 # View output
tail -f slurm-JOBID.out             # Watch live
```

**Management:**

```bash
scancel JOBID                       # Cancel job
scancel -u $USER                    # Cancel all my jobs
sacct -j JOBID                      # Job accounting
```

**Software & Hardware:**

```bash
module avail                        # Available software
module load conda/3-24.9.0          # Load conda
nvidia-smi                          # Check GPU status
```

**File Transfer:**

```bash
scp -r local_file/ user@trixie.res.nrc.gc.ca:~/  # Upload
rsync -avz user@trixie.res.nrc.gc.ca:~/data/ ./  # Download (large files)
```