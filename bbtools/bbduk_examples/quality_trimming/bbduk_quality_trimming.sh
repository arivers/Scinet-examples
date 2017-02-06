#!/bin/bash
# bbduk_quality_trimming.sh - A script that trims low quality reads from the ends of a fastq read
# Adam Rivers 2017-02-03

# Load the bbtools module
module load bbmap

#Trim reads with a quality score of less than 10 from the right side of reads
bbduk.sh in=../../data/reads.fq out=results/clean.fq qtrim=r trimq=10
