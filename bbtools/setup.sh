#!/bin/bash
# setup.sh [build|clean] - a script used to generate or remove all example data.
# It is not meant to be part of the tutorial.
# Adam Rivers 2017-02-03

# Check that the bbtools example directory variable has been set for users
[[ -e "$bbtoolsExamplesDir" ]] || { echo >&2 "Please source the env.sh file \
(source env.sh) in the bbtools example directory before running this script"; exit 1;}


if [ "$1" == 'build' ]; then
  "$bbtoolsExamplesDir"/bbduk_examples/adaptor_trimming/bbduk_adaptor_trimming.sh \
  2> "$bbtoolsExamplesDir"/bbduk_examples/adaptor_trimming/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/histogram_generation.sh \
  2> "$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/bbduk_kmer_filtering.sh \
  2> "$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbduk_examples/quality_trimming/bbduk_quality_trimming.sh \
  2> "$bbtoolsExamplesDir"/bbduk_examples/quality_trimming/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbmap_examples/basic_mapping//bbmap_basic_mapping.sh \
  2> "$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbmerge_examples/basic_merging/bbmerge_basic_merging.sh \
  2> "$bbtoolsExamplesDir"/bbmerge_examples/basic_merging/results/terminaloutput.txt
  "$bbtoolsExamplesDir"/bbmerge_examples/error_correction/bbmerge_error_correction.sh \
  2> "$bbtoolsExamplesDir"/bbmerge_examples/error_correction/results/terminaloutput.txt
elif [ "$1" == 'clean' ]; then
  rm -r "$bbtoolsExamplesDir"/bbduk_examples/adaptor_trimming/results/*
  rm -r "$bbtoolsExamplesDir"/bbduk_examples/histogram_generation/results/*
  rm -r "$bbtoolsExamplesDir"/bbduk_examples/kmer_filtering/results/*
  rm -r "$bbtoolsExamplesDir"/bbduk_examples/quality_trimming/results/*
  rm -r "$bbtoolsExamplesDir"/bbmap_examples/basic_mapping/results/*
  rm -r "$bbtoolsExamplesDir"/bbmerge_examples/basic_merging/results/*
  rm -r "$bbtoolsExamplesDir"/bbmerge_examples/error_correction/results/*
else
  echo "Did not recognize the command: $1" >&2
  exit 1
fi
