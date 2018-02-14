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
%          theoreticalMaxClusSizes(2.8, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = theoreticalMaxClusSizes(thresh, dim, D, FWHM, plotRange)
    
    % Get expected m and expected N
    S = dim(1)*dim(2);
    EN = expectedN(S , thresh);
    Em = expectedm(S, D, FWHM/sqrt(4*log(2)), thresh);
    
    % Get beta.
    beta = cluster_beta(Em, EN, D);
    
    % Get the probabilities.
    probabilities = 1 - exp(-Em.*exp(-beta.*(plotRange.^(2/D))));
    
    % Plot the result.
    plot(plotRange, probabilities)
end