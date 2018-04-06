function EN = expectedN( S, u )
% EXPECTEDN calculates the expected value of the number N of voxels above a
% threshold for a random process with a given volume in both 2D or 3D.
%--------------------------------------------------------------------------
% ARGUMENTS
% S     the total volume of the image.
% u     the threshold.
%--------------------------------------------------------------------------
% OUTPUT
% EN    the expected value of N: the number of voxels above the threshold.
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

EN = S*(1-normcdf(u));

end

