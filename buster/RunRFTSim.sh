#!/bin/bash
#$ -S /bin/bash
#$ -l h_rt=04:00:00
#$ -l h_vmem=8G
#$ -t 1:38
#$ -o log/
#$ -e log/
#$ -cwd

. /etc/profile

module add matlab

matlab -nodisplay -r "RunRFTSim($id, $thresh);quit"

