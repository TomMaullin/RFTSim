av_m = 0;
tot_iters = 100;
thresh = 2.5;
D = 2;
FWHM = 10;

for iter = 1:tot_iters

Dim = [250,250];

data = datagen(Dim, 1, 0, FWHM);

av_m = numOfConComps(data, thresh, D) + av_m;
end

av_m/tot_iters

% data_above_thresh = mean_data > 0.5;
% surf(data_above_thresh)