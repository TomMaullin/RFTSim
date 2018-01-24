function [ out ] = nprob( x, beta )
% nprob calculates the probability that the number of voxels in a cluster is x.
%--------------------------------------------------------------------------
% ARGUMENTS
% x     an integer that is the size of the cluster in voxels.
% beta  beta parameter as given in Friston et al 1999.
%--------------------------------------------------------------------------
% OUTPUT
% prob  the probability that the cluster size takes the value x
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

prob = 1/factorial(x)*Em^x * e^(-Em);
end

