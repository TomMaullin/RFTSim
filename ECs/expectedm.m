function Em = expectedm( S, D, W, u )
% EXPECTEDM calculates the expected value of the number m of connected
% components of an excursion set.
%--------------------------------------------------------------------------
% ARGUMENTS
% S     the total volume of the image.
% u     the threshold.
% D     the number of dimensions.
% W     measures the smoothness. It is the deterimant of the matrix of
%       partial derivatives.
%--------------------------------------------------------------------------
% OUTPUT
% Em    the expected value of m: the number of connected components of an 
%       excursion set.
%--------------------------------------------------------------------------
% EXAMPLES
% 
%--------------------------------------------------------------------------
% SEE ALSO
% 

Em = S*(2*pi)^(-(D+1)/2)*W^(-D)*u^(D-1)*exp(-u^2/2);


end

