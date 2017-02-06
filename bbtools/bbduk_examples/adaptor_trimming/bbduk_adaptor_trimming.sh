#!/bin/bash
# bbduk_adaptor_trimming.sh - A script that trims adapters from a fastq file
# Adam Rivers 2017-02-03

# Load the bbtools module
module load bbmap

# Trim the adapters using the reference file adaptors.fa (provided by bbduk)
bbduk.sh in=../../data/reads.fq out=results/clean.fq ref=adapters.fa ktrim=r \
k=23 mink=11 hdist=1 tpe tbo
