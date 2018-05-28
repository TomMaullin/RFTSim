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
% Author: Tom Maullin (28/05/2018)
%
% Example usage: 
%          empiricalMaxClusSizes_2t(10000, 2.58, [91, 109, 91], 3, 9.2)
%==========================================================================

function empiricalMaxClusSizes_2t(nSims, thresh, dim, D, FWHM)
    
    %Initiate an array of zeros.
    occurences_u = zeros(1, dim(1)*dim(2)*dim(3));
    occurences_l = zeros(1, dim(1)*dim(2)*dim(3));
    occurences_e = zeros(1, dim(1)*dim(2)*dim(3));
    
    %Run nSims simulations.
    for i = 1:nSims
        i
        
        % Simulate
        sim = datagen(dim, 1, 0, FWHM);
        
        % Generate data and calculate the maximum cluster size.
        [~, ~, simVals_u] = numOfConComps(sim, thresh, D, 'upper');
        [~, ~, simVals_l] = numOfConComps(sim, thresh, D, 'lower');
        
        disp(simVals_u)
        disp(simVals_l)
        
        % Record upper occurences.
        occurences_u(max(simVals_u)) = occurences_u(max(simVals_u)) + 1;
        
        % Record lower occurences.
        occurences_l(max(simVals_l)) = occurences_l(max(simVals_l)) + 1;
        
        % Record either upper of lower occurences.
        occurences_e(min(max(simVals_l), max(simVals_u))) = occurences_e(min(max(simVals_l), max(simVals_u))) + 1;
        
        
    end
    
    %Initiate an array of zeros for either.
    probabilities_e = zeros(1, dim(1)*dim(2)*dim(3));
    
    % Change from counts into probabilities. 
    for i = 1:length(occurences_e)
        probabilities_e(i) = sum(occurences_e(i:length(occurences_e)))/sum(occurences_e);
    end
    
    %Initiate an array of zeros for sum.
    probabilities_s = zeros(1, dim(1)*dim(2)*dim(3));
    
    % Change from counts into probabilities. 
    for i = 1:length(occurences_u)
        probabilities_s(i) = sum(occurences_u(i:length(occurences_u)))/sum(occurences_u) + sum(occurences_l(i:length(occurences_l)))/sum(occurences_l);
    end
    
    save('ps', 'probabilities_s');
    save('pe', 'probabilities_e');
    
end