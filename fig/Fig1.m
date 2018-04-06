%Replicating Figure 1 from Friston 1994.
Dim = [250,250];
S = prod(Dim);
u = 2:0.1:6;
D = length(Dim);
FWHM = 5;
W = FWHM/sqrt(4*log(2));
len_u = length(u);

noskoEn = zeros(1, len_u);
fristonEn = zeros(1, len_u);

for I = 1:len_u
    noskoEn(I) = (2*pi)^(D/2)*W^2/u(I)^D;
    EN = expectedN( S, u(I) );
    Em = expectedm( S, D, W, u(I) );
    fristonEn(I) = EN/Em;
end

plot(u, noskoEn,'linewidth', 2)
hold on
plot(u, fristonEn,'linewidth', 2)
xlabel('threshold')
legend('Nosko En', 'Friston En')