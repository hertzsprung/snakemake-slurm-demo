This toy snakemake workflow is designed to run on The University of Sheffield bessemer HPC cluster using slurm.

# Running on bessemer HPC cluster

    srun --pty bash -i
    module load Anaconda3/2019.07
    conda create -c bioconda -c conda-forge -n snakemake python=3.7 snakemake
    conda activate snakemake
    snakemake --profile profiles/bessemer
    
# Shortcomings of snakemake slurm profile
Available in its own [GitHub repo](https://github.com/Snakemake-Profiles/slurm).  You use `cookiecutter` to make a customised copy of the python scripts, see `profiles/bessemer`.

As fas as I can tell, it doesn't support:
* `gres` option needed for GPU runs on Bessemer.  I know how to bodge this in, but I haven't done a good enough job for upstreaming my changes.
* output/error files are just plain strings and don't support snakemake wildcards, which would associate a logfile with its snakemake target

# Related resources
* My stackoverflow question: [Setting PATH when invoking sbatch](https://stackoverflow.com/questions/60100550/setting-path-when-invoking-sbatch), currently unanswered
