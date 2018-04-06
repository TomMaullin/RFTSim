#!/bin/bash
#$ -S /bin/bash
#$ -l h_rt=04:00:00
#$ -l h_vmem=8G
#$ -t 1:38
#$ -o log/
#$ -e log/
#$ -cwd

# [WIP] This file is a work in progress. For some reason errors currently.

. /etc/profile

module add matlab

matlab -nodisplay -r "empiricalNumPeaks(5000, $thresh, [32, 32, 64], 3, 5.7, 1:90, $id);quit"

