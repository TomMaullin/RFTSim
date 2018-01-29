function prob = prob_nmax( Em, beta, k  )
% PROB_NMAX generates the probablity for the number of voxels in the 
% largest cluster to be greater than k under certain assumptions!!) 
% according to eqn (14) from Friston 1999.
%--------------------------------------------------------------------------
% ARGUMENTS
% Em    the expected number of clusters above the threshold
% beta  the parameter needed to derive the probablity of a given cluster
%       size.
% k     the number of voxels.
%--------------------------------------------------------------------------
% OUTPUT
% prob_max  the probablity for the number of voxels in the 
%           largest cluster to be greater than k
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

prob = 1 - exp(-Em*exp(-beta*k^(2/D)));

end

