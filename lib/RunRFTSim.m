%Runs the RFT simulations
function RunRFTSim(i, thresh)
    addpath(genpath('/storage/u1406435/code/spm12'))
    addpath(genpath('/storage/u1406435/temporary/RFTSim'))
    
    empiricalPeaksPerClus(5000, thresh, [32, 32, 64], 5.7, i)
    
end

