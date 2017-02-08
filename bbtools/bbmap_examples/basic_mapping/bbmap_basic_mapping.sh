#!/bin/bash
# bbmap_basic_mapping.sh a shell script that generates an index then maps \
# reads to the index
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbtools

# Create a mapping index for the phage phiX174 and save it to disk \
# (you only need to do this once)
bbmap.sh ref="$bbtoolsExamplesDir"/data/Ref_database.fa.gz \
path="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results \
usejni

# Map reads to the reference index
# -usejni uses compiled C code for speedup
# -pigz and -unpigz perform parallel compression and uncompression
# -Xmx4g limits the amount of memory for this very small job
# -threads limits the threads for the example. You should match this to the \
# number o threads requested my your SLURM job.  by defauld bbtools grabs all \
# available threads.
# -maxindel=90 sets the maximum gap between the read pairs. The default is 16k \
# for eukaryotic RNA but this is not needed for DNA
bbmap.sh in="$bbtoolsExamplesDir"/data/reads.fq.gz \
path="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results \
out="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/mapped.sam \
usejni pigz unpigz maxindel=90
