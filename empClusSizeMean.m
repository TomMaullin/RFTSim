function expected_cluster_size = empClusSizeMean(nSims, thresh, dim, FWHM)
% EMPCLUSSIZEMEAN(nSims, thresh, dim, D, FWHM, plotRange) calculates a plot
% of the emprical cluster size mean
%--------------------------------------------------------------------------
% ARGUMENTS
% nSims     the number of simulations
% thresh    the threshold (a real number).
% dim       the dimensions of the image eg [256,256]
% FWHM      the smoothing parameter.
%--------------------------------------------------------------------------
% OUTPUT
%
%--------------------------------------------------------------------------
% EXAMPLES
% empClusSizeMean(50, 1.5:0.25:3, [256,256], 9.2)
%--------------------------------------------------------------------------
% SEE ALSO
%

if nargin < 1
    nSims = 50;
end
if nargin < 2
    thresh = 2:0.1:6;
end
if nargin < 3
    dim = [256,256];
end
if nargin < 4
    FWHM = 5;
end

S = prod(dim); %S is the volume.
D = length(dim);

len_thresh = length(thresh);
expected_cluster_size = zeros(1, len_thresh);

for I = 1:len_thresh
    probabilities = empiricalClusSizes(nSims, thresh(I), dim, D, FWHM, S);
    expected_cluster_size(I) = sum(probabilities.*(1:S));
end

if len_thresh > 1
    plot(thresh, expected_cluster_size,'linewidth', 2)
    xlabel('threshold');
    ylabel('Expected Cluster Size');
    title(strcat('The Expected Cluster size (En) for Gaussian data smoothed with FWHM = ', num2str(FWHM)));

    noskoEn = zeros(1, len_thresh);
    fristonEn = zeros(1, len_thresh);
    
    W = FWHM/sqrt(4*log(2));
    for I = 1:len_thresh
        noskoEn(I) = (2*pi)^(D/2)*W^2/thresh(I)^D;
        EN = expectedN( S, thresh(I) );
        Em = expectedm( S, D, W, thresh(I) );
        fristonEn(I) = EN/Em;
    end

    hold on
    plot(thresh, noskoEn,'linewidth', 2)
    hold on
    plot(thresh, fristonEn,'linewidth', 2)
    legend('Empirical', 'Nosko', 'Friston')
end
    
end

