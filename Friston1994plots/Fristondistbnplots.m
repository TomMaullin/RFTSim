u = 2.8;
Dim = [256,256];
D = length(Dim);
S = prod(Dim);
FWHM = 5;

nSims = 250;

empiricalClusSizes(nSims, 2.8, Dim, D, 9.2, 1:90);
hold on
theoreticalClusSizes(2.8, Dim, D, 9.2, 1:90);




