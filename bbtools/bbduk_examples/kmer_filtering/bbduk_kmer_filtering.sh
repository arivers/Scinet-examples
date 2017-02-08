#!/bin/bash
# bbduk_kmer_filtering.sh - A script that removes reads containing kmers from \
# a reference. Often used to remove PhiX spike in sequences that have made it \
# past Illumina barcode based removal.
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbtools

# Filter out PhiX containing reads optionally palcing them in their own file
bbduk.sh in="$bbtoolsExamplesDir"/data/reads.fq.gz \
out="$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/results/unmatched.fq.gz \
outm="$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/results/matched.fq.gz \
ref="$bbtoolsExamplesDir"/data/phix174_ill.ref.fa.gz \
k=31 hdist=1 stats="$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/results/stats.txt
