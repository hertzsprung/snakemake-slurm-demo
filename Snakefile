# any rules listed under localrules will be run on the local node,
# not submitted as slurm batch jobs
localrules: cpp_local

rule all:
	input: expand("build/cpp_output.threads{omp_threads}.txt", omp_threads=[1, 2, 4])

rule clean:
	shell: "rm -rf build"

rule cpp:
	output: "build/cpp_output.threads{omp_threads}.txt"
	resources:
		runtime=1 # will request one minute from slurm
	# problem 1: 'threads' maps to slurm's ntasks parameter, not ntasks-per-node
	#            I'm not clear on slurm's --nodes, --ntasks & --ntasks-per-node
	# problem 2: this should be wildcards.omp_thread, but I don't think
	#            snakemake supports that notation
	threads: 2 # so I've just hardwired to 2 'threads' for the time being
	shell: "{config[snakemake_slurm_demo_cpp]} {wildcards.omp_threads} > {output}"

# this rule will run locally, not via slurm
rule cpp_local:
	output: "build/cpp_output.local.txt"
	shell: "{config[snakemake_slurm_demo_cpp]} 1 > {output}"
	# no resources section is required for local rules
