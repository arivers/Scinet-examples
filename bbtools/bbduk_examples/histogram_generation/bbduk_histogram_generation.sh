#!/bin/bash
# bbduk_histogram_generation.sh - A script that generates sequence quality \
# histograms
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}

# Load the bbtools module
module load bbmap

# Generate summary histogram data (normally these would be run during another \
# opperation like adapter trimming )
# bhist=        Base composition histogram by position.
# qhist=        Quality histogram by position.
# qchist=       Count of bases with each quality value.
# aqhist=       Histogram of average read quality.
# bqhist=       Quality histogram designed for box plots.
# lhist=        Read length histogram.
# gchist=       Read GC content histogram.
bbduk.sh in="$bbtoolsExamplesDir"/data/reads.fq \
bhist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/bhist.txt \
qhist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/qhist.txt \
gchist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/gchist.txt \
aqhist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/aqhist.txt \
bqhist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/bqhist.txt \
lhist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/lhist.txt \
gchist="$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/gchist.txt \
gcbins=auto
