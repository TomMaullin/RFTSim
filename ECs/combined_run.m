% Puts all of the functions together in 2D

Dim = [250,250];
D = length(Dim);
S = prod(Dim);
FWHM = 5;
W = FWHM/(4*log(2));
u = 2.5;
Em = expectedm(S, D, W, u)