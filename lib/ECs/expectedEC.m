function Em = expectedm( S, D, W, u )
% EXPECTEDM calculates the expected value of the number m of connected
% components of an excursion set.
%--------------------------------------------------------------------------
% ARGUMENTS
% S     the total volume of the image.
% u     the threshold.
% D     the number of dimensions.
% W     measures the smoothness.
%--------------------------------------------------------------------------
% OUTPUT
% Em    the expected value of m: the number of connected components of an 
%       excursion set.
%--------------------------------------------------------------------------
% EXAMPLES
% Dim = [250,250];
% D = length(Dim);
% S = prod(Dim);
% 
% FWHM = 10;
% W = FWHM/sqrt(4*log(2)); 
% u = 2.5;
% Em = expectedm(S, D, W, u)
%--------------------------------------------------------------------------
% SEE ALSO
% 

Em = S*(2*pi)^(-(D+1)/2)*W^(-D)*u^(D-1)*exp(-u^2/2);


end

