
#!/bin/bash
#$ -S /bin/bash
#$ -l h_rt=06:00:00
#$ -l h_vmem=8G
#$ -t 1:1
#$ -o log/
#$ -e log/
#$ -cwd

. /etc/profile

module add matlab

matlab -nodisplay -r "addpath(genpath('/storage/u1406435/code/spm12'));addpath(genpath('/storage/u1406435/code/RFTSim'));empiricalMaxClusSizes_2t(10000, 2.58, [91, 109, 91], 3, 9.2);quit"
