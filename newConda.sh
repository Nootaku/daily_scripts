#!/bin/bash
#
# Creation of a new Conda environment
# by Maxime Wattez 2020
#
# Usage:    ./newConda.sh <NAME> <PYTHON VERSION>

echo "Creation of new Conda environment"

NAME=$1
PYVERSION=$2

conda create -n $NAME python=$PYVERSION

echo "    --> $NAME has been created !"
