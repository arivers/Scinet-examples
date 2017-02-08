#!/bin/bash
# bbmap_basic_mapping.sh a shell script that generates an index then maps \
# reads to the index
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbmap

# Create a mapping index for the phage phiX174 and save it to disk \
# (you only need to do this once)
bbmap.sh ref="$bbtoolsExamplesDir"/data/phix174_ill.ref.fa.gz \
path="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results

# Map reads to the reference index
# -usejni uses compiled C code for speedup
# -pigz and -unpigz perform parallel compression and uncompression
bbmap.sh in="$bbtoolsExamplesDir"/data/reads.fq \
path="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results \
out="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/mapped.sam \
bamscript="$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/bamscript.sh \
usejni pigz unpigz

# Create and index a bam file using the script created by bbtools
module load samtools
bash "$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/bamscript.sh
