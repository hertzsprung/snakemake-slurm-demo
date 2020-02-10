MAKEFLAGS += --no-builtin-rules
.DELETE_ON_ERROR:
.SUFFIXES:

CXXFLAGS := -Wall -Wextra -Werror -pedantic -std=c++14

snakemake-slurm-demo-cpp: src/cpp/snakemake-slurm-demo-cpp.cpp
	$(CXX) $(CXXFLAGS) -fopenmp -o $@ $<
