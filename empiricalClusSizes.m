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
%          empiricalClusSizes(500, 2.58, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = empiricalClusSizes(nSims, thresh, dim, D, FWHM, plotRange)
    if nargin < 6
        plotRange = NaN;
        %To make the default be that there is no plot if this input is not
        %included.
    end

    %Initiate an array of zeros.
    occurences = zeros(1, prod(dim));
    
    %Run nSims simulations.
    for i = 1:nSims
        
        % Generate data and calculate the number of occurences of each 
        % cluster size.
        [~, simOcc, simVals] = numOfConComps(datagen(dim, 1, 0, FWHM), thresh, D);
        
        % Add the occurences to the running total.
        for k = 1:length(simOcc)
            occurences(simVals(k)) = occurences(simVals(k)) + simOcc(k);
        end
    end
    
    % Change from counts into probabilities. 
    probabilities = occurences/sum(occurences);
    
    % Plot the result if you have a range to plot for.
    if sum(isnan(plotRange)) == 0
        plot(plotRange, probabilities(plotRange))
    end
end