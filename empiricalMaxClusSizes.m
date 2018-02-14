%==========================================================================
% This file estimates the probabilities of observing a cluster of size k
% and returns it in the entry probabilities(k). It takes in the following
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
%          empiricalMaxClusSizes(500, 2.58, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = empiricalMaxClusSizes(nSims, thresh, dim, D, FWHM, plotRange)
    
    %Initiate an array of zeros.
    occurences = zeros(1, dim(1)*dim(2));
    
    %Run nSims simulations.
    for i = 1:nSims
        i
        % Generate data and calculate the maximum cluster size.
        [~, simOcc, simVals] = numOfConComps(datagen(dim, 1, 0, FWHM), thresh, D);
        
        % Add the occurences to the running total.
        occurences(max(simVals)) = occurences(max(simVals)) + 1;
    end
    
    %Initiate an array of zeros.
    probabilities = zeros(1, dim(1)*dim(2));
    
    % Change from counts into probabilities. 
    for i = 1:length(occurences)
        probabilities(i) = sum(occurences(i:length(occurences)))/sum(occurences);
    end
    
    % Plot the result.
    plot(plotRange, probabilities(plotRange))
end