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
%          empiricalNumClusProbs(50000, 2.58, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = empiricalNumClusProbs(nSims, thresh, dim, D, FWHM, plotRange)
    
    %Initiate an array of zeros.
    occurences = zeros(1, dim(1)*dim(2)/4);
    
    for i = 1:nSims
        i
        truen = numOfConComps(datagen(dim, 1, 0, FWHM), thresh, D);
        occurences(truen) = occurences(truen) + 1;
        
    end
    
    % Change from counts into probabilities. 
    probabilities = occurences/sum(occurences);
    
    % Plot the result.
    plot(plotRange, probabilities(plotRange))

end 