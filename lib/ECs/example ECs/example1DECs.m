%% 1D Examples

Dim = 10000;
D = length(Dim);
S = prod(Dim);

FWHM = 10
W = FWHM/sqrt(4*log(2)); 
u = 2.5
Em = expectedEC(S, D, W, u)

%%
FWHM = 5
W = FWHM/sqrt(4*log(2)); 
u = 1.5
Em = expectedEC(S, D, W, u)