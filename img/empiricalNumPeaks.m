%==========================================================================
% This file estimates the probabilities of given numbers of clusters and
% returns the result as a vector, probabilities, where probabilities(k) is
% the probability of observing k clusters. It takes in the following
% inputs:
%
% nSims - the number of simulations for estimating.
% thresh - the threshold value.
% dim - the dimensions of simulated data.
% D - the dimension of the data.
% FWHM - the FWHM of the simulated data.
% plotRange - the range to display in plot
%
% And returns:
%
% probabilities - the probability array of cluster sizes.
%
% Authors: Tom Maullin, Samuel Davenport (05/02/2018)
%
% Example usage: 
%          empiricalNumPeaks(50000, 2.58, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = empiricalNumPeaks(nSims, thresh, dim, D, FWHM, plotRange, iter)

    addpath(genpath('/storage/u1406435/code/spm12'))
    addpath(genpath('/storage/u1406435/temporary/RFTSim'))
    
    %Initiate an array of zeros.
    occurences = zeros(1, dim(1)*dim(2)*dim(3));
    
    for i = 1:nSims
        i
        truen = numOfPeaks(datagen(dim, 1, 0, FWHM), thresh, D);
        occurences(truen) = occurences(truen) + 1;
        
    end
%     
%     % Change from counts into probabilities. 
%     probabilities = occurences/sum(occurences);
%     
%     % Plot the result.
%     plot(plotRange, probabilities(plotRange))

    % Save the counts
    save(['/storage/u1406435/temporary/RFTSim/sim/NumClus' num2str(iter)], 'occurences')

end 
