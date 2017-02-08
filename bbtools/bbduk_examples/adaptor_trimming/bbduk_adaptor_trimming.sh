#!/bin/bash
# bbduk_adaptor_trimming.sh - A script that trims adapters from a fastq file
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbmap

# Trim the adapters using the reference file adaptors.fa (provided by bbduk)
bbduk.sh in="$bbtoolsExamplesDir"/data/reads.fq \
out="$bbtoolsExamplesDir"/bbduk_examples/adaptor_trimming/results/clean.fq \
ref="$bbtoolsExamplesDir"/data/adapters.fa \
ktrim=r k=23 mink=11 hdist=1 tbo=t
