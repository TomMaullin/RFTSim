%==========================================================================
% This code uses rft to estimate the probabilities of given numbers of 
% clusters and returns the result as a vector, probabilities, where 
% probabilities(k) is the probability of observing k clusters. It takes in 
% the following inputs:
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
%          theoreticalNumClusProbs(2.58, [256, 256], 2, 9.2, 1:90)
%==========================================================================

function probabilities = theoreticalNumClusProbs(thresh, dim, D, FWHM, plotRange)
    
    % Get expected m and expected N
    S = dim(1)*dim(2);
    Em = expectedm(S, D, FWHM/sqrt(4*log(2)), thresh);
    
    % Calculate P(m=x)
    probabilities = 1./factorial(plotRange).*(Em.^plotRange)*exp(-Em);
    
    % Plot the result.
    plot(plotRange, probabilities)
end 