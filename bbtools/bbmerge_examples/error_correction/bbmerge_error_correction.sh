#!/bin/bash
# bbmerge_error_correction.sh - A script that uses overlapping reads to \
# correct sequencing errors
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbtools

# Merge reads and write merged and unmerged reads to files along with an insert size histogram

bbmerge.sh in="$bbtoolsExamplesDir"/data/reads.fq.gz \
out="$bbtoolsExamplesDir"/bbmerge_examples/error_correction/results/corrected.fq.gz \
ecco mix usejni
