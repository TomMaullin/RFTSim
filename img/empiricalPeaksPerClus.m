%==========================================================================
% This file estimates the number of peaks per of cluster empirically
% and returns it in the entry probabilities(k). It takes in the following
% inputs:
%
% nSims - the number of simulations for estimating.
% thresh - the threshold value.
% dim - the dimensions of simulated data.
% D - the dimension of the data.
% FWHM - the FWHM of the simulated data.
% plotRange - the range to display in plot
% iter - iteration number - for filename
%
% Authors: Tom Maullin, Samuel Davenport (05/02/2018)
%
% Example usage: 
%          empiricalPeaksPerClus(5000, 2.58, [109, 91, 109], 9.2, 1:10, 30:50)
%==========================================================================

function empiricalPeaksPerClus(nSims, thresh, dim, FWHM, iter)

    % Observed counts
    obsCounts = zeros(max(dim)^2, floor(max(dim)/4));

    for i = 1:nSims
        
        i
        %Remove values below threshold.
        sim = datagen(dim, 1, 0, FWHM);
        sim(sim<=thresh) = 0;
        
        %Find the clusters.
        CC = bwconncomp(sim);
        
        for j = 1:length(CC.PixelIdxList)
        
            %Find the index of each component in a cluster
            [x, y, z] = ind2sub(CC.ImageSize,CC.PixelIdxList{j});

            % Make a small grid and put the cluster in it.
            clusterGrid = sim(min(x):max(x), min(y):max(y), min(z):max(z));
            
            %Find the number of local maxima in this cluster
            numberOfPeaks = length(find(imregionalmax(clusterGrid, 6)));
            
            %Record that we've seen that number of peaks
            obsCounts(length(CC.PixelIdxList{j}), numberOfPeaks) = obsCounts(length(CC.PixelIdxList{j}), numberOfPeaks) + 1;
            
        end
        
    end
    
    %This code saves the variables on Buster.
    save(['/storage/u1406435/temporary/RFTSim/sim/iter' num2str(iter)], 'obsCounts')

%     %This code plots the data instead. Buster recommended... more
%     %simulations -> better graph. Also reusable data.
%
%     obsProbs =  obsCounts./sum(obsCounts, 2);
%     
%     % Remove NaN's
%     obsProbs_column1 = obsProbs(:, 1);
%     nonNanRows = find(~isnan(obsProbs_column1));    
%     obsProbs = obsProbs(nonNanRows, :);
%     %     for i = 1:1000
%         
%         plot(1:10, obsProbs(i, 1:10));
%         hold on
%         
%     end 

end
