#!/bin/bash
# bbmap_basic_mapping.sh a shell script that generates an index then maps \
# reads to the index
# Adam Rivers 2017-02-03

# Load the bbtools module
module load bbmap

# Create a mapping index and save it to disk (you only need to do this once)
bbmap.sh ref=../../data/reference.fa

# Map reads to the reference index
# -usejni uses compiled C code for speedup
# -pigz and -unpigz perform parallel compression and uncompression
bbmap.sh in=../../data/reads.fq out=results/mapped.sam \
bamscript=results/bamscript.sh usejni pigz unpigz

# Create and index a bam file using the script created by bbtools
module load samtools
bash bamscript.sh
