rule all:
	input: expand("build/cpp_output.threads{omp_threads}.txt", omp_threads=[1, 2, 4])

rule cpp:
	output: "build/cpp_output.threads{omp_threads}.txt"
	shell: "./snakemake-slurm-demo-cpp {wildcards.omp_threads} > {output}"
