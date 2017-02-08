#!/bin/bash

[[ -e env.sh ]] || { echo >&2 "Please cd into the bbtools directory before sourcing this script."; exit 1;}

export bbtoolsExamplesDir=$PWD

