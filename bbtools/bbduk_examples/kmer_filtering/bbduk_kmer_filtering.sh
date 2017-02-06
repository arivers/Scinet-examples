#!/bin/bash
# bbduk_kmer_filtering.sh - A script that removes reads containing kmers from \
# a reference. Often used to remove PhiX spike in sequences that have made it \
# past Illumina barcode based removal.
# Adam Rivers 2017-02-03

# Load the bbtools module
module load bbmap

# Filter out PhiX containing reads optionally palcing them in their own file
bbduk.sh in=../../data/reads.fq out=results/unmatched.fq outm=results/matched.fq \
ref=phix174_ill.ref.fa.gz k=31 hdist=1 stats=stats.txt
