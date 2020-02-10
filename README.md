This toy snakemake workflow is designed to run on The University of Sheffield bessemer HPC cluster using slurm.

# Running on bessemer HPC cluster

    srun --pty bash -i
    module load Anaconda3/2019.07
    conda create -c bioconda -c conda-forge -n snakemake python=3.7 snakemake
    conda activate snakemake
    snakemake --profile profiles/bessemer

# Related links
* My stackoverflow question: [Setting PATH when invoking sbatch](https://stackoverflow.com/questions/60100550/setting-path-when-invoking-sbatch), currently unanswered
