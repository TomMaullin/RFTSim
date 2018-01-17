function En = expectedapproxn( EN, Em )
% NEWFUN serves as a function template.
%--------------------------------------------------------------------------
% ARGUMENTS
% EN    the expected value of N: the number of voxels above the threshold.
% Em    the expected value of m: the number of connected components of an 
%       excursion set.
%--------------------------------------------------------------------------
% OUTPUT
% En    the expected number of voxels in each of the clusters.
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

En = EN/Em;

end

