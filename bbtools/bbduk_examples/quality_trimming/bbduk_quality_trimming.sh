#!/bin/bash
# bbduk_quality_trimming.sh - A script that trims low quality reads from the ends of a fastq read
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbtools

#Trim reads with a quality score of less than 10 from the right side of reads
bbduk.sh in=$bbtoolsExamplesDir/data/reads.fq \
out=$bbtoolsExamplesDir/bbduk_examples/quality_trimming/results/clean.fq \
qtrim=r trimq=10
