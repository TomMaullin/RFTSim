function ECvsclusters( Dim, FWHM, u_vals, nsims )
% ECvsclusters plots the theoretical expected euler characteristic against
% the empirically calculated EC.
%--------------------------------------------------------------------------
% ARGUMENTS
% Dim: the dimensions of the random field
% FHWM: the smoothing
% u_vals: the vectors of thresholds that you want.
%--------------------------------------------------------------------------
% OUTPUT
% Em    the expected value of m: the number of connected components of an 
%       excursion set.
%--------------------------------------------------------------------------
% EXAMPLES
% ECvsclusters( [128, 128], 8, 0:0.25:5, 5 )
% ECvsclusters( [250,250], 5, 4:0.01:5, 50 )
%--------------------------------------------------------------------------

if nargin < 1
    Dim = [250,250];
end
if nargin < 2
    FWHM = 5;
end
if nargin < 3
    u_vals = 4:0.01:5;
end
if nargin < 4
    nsims = 10;
end
S = prod(Dim);
D = length(Dim);
W = FWHM/sqrt(4*log(2));

n_u_vals = length(u_vals);
EC = zeros(1, n_u_vals);
Em = zeros(1, n_u_vals);

for I = 1:n_u_vals
    EC(I) = expectedm(S, D, W, u_vals(I));
    
    m = 0;
    
    for J = 1:nsims
        data = datagen(Dim, 1, 0, FWHM);
        m = numOfConComps(data, u_vals(I), D) + m;
    end
    
    Em(I) = m/nsims;
end

plot(u_vals, EC,'linewidth', 2)
hold on
plot(u_vals, Em,'linewidth', 2)
legend('Theoretical EC', 'Average number of clusters observed after 50 simulations')

end
