function expected_cluster_size = empClusSizeMean(nSims, thresh, dim, FWHM)
% EMPCLUSSIZEMEAN(nSims, thresh, dim, D, FWHM, plotRange) calculates a plot 
% of the emprical cluster size mean 
%--------------------------------------------------------------------------
% ARGUMENTS
% nSims     the number of simulations
% thresh    the threshold (a real number).
% dim       the dimensions of the image eg [256,256]
% FWHM      the smoothing parameter.
%--------------------------------------------------------------------------
% OUTPUT
% 
%--------------------------------------------------------------------------
% EXAMPLES
% empClusSizeMean(50, 2.8, [256,256], 9.2)
%--------------------------------------------------------------------------
% SEE ALSO
% 

S = prod(dim); %S is the volume.
D = length(dim);

probabilities = empiricalClusSizes(nSims, thresh, dim, D, FWHM, S);

expected_cluster_size = sum(probabilities.*(1:S));

end

