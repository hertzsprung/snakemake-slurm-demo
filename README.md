This toy snakemake workflow is designed to run on The University of Sheffield bessemer HPC cluster using slurm.  Currently, it contains an OpenMP C++ app, `snakemake-slurm-demo-cpp`.  The aim is to run the app with 1, 2 or 4 cores, configured by slurm's `--ntasks-per-node` parameter.

# Running on bessemer HPC cluster

```bash
    srun --pty bash -i
    module load Anaconda3/2019.07
    
    conda create -c bioconda -c conda-forge -n snakemake python=3.7 snakemake
    conda activate snakemake
    
    make # will build snakemake-slurm-demo-cpp
    # -p flag prints out shell commands that are called
    snakemake --profile profiles/bessemer -p
```
    
# Shortcomings of snakemake slurm profile
Available in its own [GitHub repo](https://github.com/Snakemake-Profiles/slurm).  You use `cookiecutter` to make a customised copy of the python scripts, see `profiles/bessemer`.

As fas as I can tell, it doesn't support:
* `gres` option needed for GPU runs on Bessemer.  I know how to bodge this in, but I haven't done a good enough job for upstreaming my changes.
* output/error files are just plain strings and don't support snakemake wildcards, which would associate a logfile with its snakemake target

# Configuring OpenMP in slurm job script

From [OpenMP examples](https://www.hpc2n.umu.se/documentation/batchsystem/openmp-examples):

```bash
    if [ -n "$SLURM_CPUS_PER_TASK" ]; then
      omp_threads=$SLURM_CPUS_PER_TASK
    else
      omp_threads=1
    fi
    export OMP_NUM_THREADS=$omp_threads
```

# Related resources
* My stackoverflow question: [Setting PATH when invoking sbatch](https://stackoverflow.com/questions/60100550/setting-path-when-invoking-sbatch), currently unanswered
