#!/bin/bash
# bbmerge_error_correction.sh - A script that uses overlapping reads to \
# correct sequencing errors
# Adam Rivers 2017-02-03


# Load the bbtools module
module load bbmap

# Merge reads and write merged and unmerged reads to files along with an insert size histogram

bbmerge.sh in=../../data/reads.fq out=results/corrected.fq ecco mix usejni
