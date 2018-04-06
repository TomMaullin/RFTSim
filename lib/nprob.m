function [probx, prob_morethan_x] = nprob( x, beta, D )
% nprob calculates the probability that the number of voxels in a cluster is x.
%--------------------------------------------------------------------------
% ARGUMENTS
% x     an integer that is the size of the cluster in voxels.
% beta  beta parameter as given in Friston et al 1999.
% D     is the number of dimensions of the random field.
%--------------------------------------------------------------------------
% OUTPUT
% probx  the probability that the cluster size takes the value x.
% prob_morethan_x   the probability that the cluster size take a value
%                   equal to or larger than x.
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

probx = 2*beta/D*x^(2/D-1)*exp(-beta*x^(2/D));
prob_morethan_x = exp(-beta*x^(2/D));

end

