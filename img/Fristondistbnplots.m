u = 4;
Dim = [256,256];
D = length(Dim);
S = prod(Dim);
FWHM = 9.2;
nSims = 250;

%% Cluster Extent
cla
empiricalClusSizes(nSims, u, Dim, D, FWHM, 1:90);
hold on
theoreticalClusSizes(u, Dim, D, FWHM, 1:90);
ylabel('P(n = x)')
xlabel('Cluster extent')
title('Distribution of Cluster Size')
legend(strcat('Empirical after ',num2str(nSims),' simulations'), 'theoretical')

%% Number of Clusters


