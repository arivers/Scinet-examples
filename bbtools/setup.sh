#!/bin/bash
# setup.sh [build|clean] - a script used to generate or remove all example data.
# It is not meant to be part of the tutorial.
# Adam Rivers 2017-02-03

btd=`.`
if [ "$1" = 'build']; then
  cd $btd/bbduk_examples/adapter_trimmming/
  ./bbduk_adaptor_trimming.sh
  cd ../histogram_generation
  ./histogram_generation.sh
  cd ../kmer_filtering
  ./bbduk_kmer_filtering.sh
  cd ../quality_trimming/
  ./bbduk_quality_trimming.sh
  cd ../..
  cd /bbmap_examples/basic_mapping/
  ./bbmap_basic_mapping.sh
  cd ../..
  cd /bbmerge_examples/basic_merging/
  ./bbmerge_basic_merging.sh
  cd ../error_correction/
  ./bbmerge_error_correction.sh

elif [ "$1" = 'clean']; then
  rm -r /bbduk_examples/adapter_trimmming/results/*
  rm -r /bbduk_examples/histogram_generation//results/*
  rm -r /bbduk_examples/kmer_filtering/results/*
  rm -r /bbduk_examples/quality_trimming/results/*
  rm -r /bbmap_examples/basic_mapping/results/*
  rm -r /bbmerge_examples/basic_merging/results/*
  rm -r /bbmerge_examples/error_correction/results/*
else
  echo "Did not recognize command $1" >&2
  exit 1
