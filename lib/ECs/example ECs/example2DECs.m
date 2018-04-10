%% 2D Examples

Dim = [250,250];
D = length(Dim);
S = prod(Dim);

FWHM = 10
W = FWHM/sqrt(4*log(2)); 
u = 2.5
Em = expectedEC(S, D, W, u)

%%
FWHM = 15
W = FWHM/sqrt(4*log(2));
u = 2.5

Em = expectedEC(S, D, W, u)

%%
FWHM = 10
W = FWHM/sqrt(4*log(2));
u = 3
Em = expectedEC(S, D, W, u)

%% Example from https://matthew-brett.github.io/teaching/random_fields.html

Dim = [128, 128];
S = prod(Dim);

FWHM = 8
W = FWHM/sqrt(4*log(2));

u = 2.75
Em = expectedEC(S, D, W, u)

%%
FWHM = 8
W = FWHM/sqrt(4*log(2));

u = 3.25
Em = expectedEC(S, D, W, u)
