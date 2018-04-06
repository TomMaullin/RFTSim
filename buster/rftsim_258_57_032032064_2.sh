for i in {1..10}
do
    name=rftsim_258_57_032032064_2
    qsub -v id=$i,thresh=2.58 -N $name getPeakNumProbs.sh
    qsub -v id=$i,thresh=2.58 -N $name getClusNumProbs.sh
done
