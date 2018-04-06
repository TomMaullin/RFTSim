function beta = cluster_beta( Em, EN, D )
% cluster_beta calculates the value of beta corresponding to (12) in
% Friston 1999.
%--------------------------------------------------------------------------
% ARGUMENTS
% Em    the expected number of clusters above the threshold
% EN    the expected number of voxels exceeding the threshold
% D     the dimensions of the random field.
%--------------------------------------------------------------------------
% OUTPUT
% beta  the parameter needed to derive the probablity of a given cluster
%       size.
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

beta = (gamma(D/2+1)*Em/EN)^(2/D);

end

