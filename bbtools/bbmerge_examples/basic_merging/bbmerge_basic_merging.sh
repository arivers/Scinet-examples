#!/bin/bash
# bbmerge_basic_merging.sh - A script that merges paired end reads
# Adam Rivers 2017-02-03


# Load the bbtools module
module load bbmap

# Merge reads and write merged and unmerged reads to files along with an insert size histogram
bbmerge.sh in=../../data/reads.fq out=results/merged.fq \
outu=results/unmerged.fq ihist=ihist.txt usejni
