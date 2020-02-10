#include <cstdio>
#include <cstdlib>
#include "omp.h"

int main(int argc, char *argv[])
{
    if (argc <= 1)
    {
        printf("Usage: snakemake-slurm-demo <expected_omp_threads>\n");
        return EXIT_FAILURE;
    }

    printf("snakemake-slurm-demo-cpp\n");
    printf("expected omp_threads %s\n", argv[1]);
    printf("actual omp_threads %i\n", omp_get_max_threads());
    return EXIT_SUCCESS;
}
