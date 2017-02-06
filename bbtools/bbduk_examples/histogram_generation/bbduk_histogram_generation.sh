#!/bin/bash
# bbduk_histogram_generation.sh - A script that generates sequence quality \
# histograms
# Adam Rivers 2017-02-03

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
bbduk.sh in=../../data/reads.fq bhist=results/bhist.txt qhist=results/qhist.txt \
gchist=results/gchist.txt aqhist=results/aqhist.txt bqhist=results/bqhist.txt \
lhist=results/lhist.txt gchist=results/gchist.txt gcbins=auto
