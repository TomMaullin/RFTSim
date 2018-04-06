%==========================================================================
% This file counts the number of connected components in an excursion set.
% It takes in:
%
% sim - the simulated data.
% thresh - the threshold value.
% D - the dimension of the data.
%
% And returns:
%
% truem - the number of peaks.
%
% Authors: Tom Maullin
%
% EXAMPLES
% simul = randn(10,10)
% thresh = 1.5;
% simul > thresh
% numOfPeaks(simul, thresh, 2)
%==========================================================================
function runningTotal = numOfPeaks(sim, thresh, D)

    %Remove values below threshold.
    sim(sim<=thresh) = 0;

    runningTotal = 0;
    
    %If we're in the 2d case only look at components connected vertically
    %and horizontally (i.e. no diagonals!)
    if D == 2     
        CC = bwconncomp(sim, 6);
    elseif D == 3
        CC = bwconncomp(sim, 18);
    else
        error('Nope');
    end 

    for j = 1:length(CC.PixelIdxList)
        
        if D == 3
            
            %Find the index of each component in a cluster
            [x, y, z] = ind2sub(CC.ImageSize,CC.PixelIdxList{j});

            % Make a small grid and put the cluster in it.
            clusterGrid = sim(min(x):max(x), min(y):max(y), min(z):max(z));

            %Find the number of local maxima in this cluster
            numberOfPeaks = length(find(imregionalmax(clusterGrid, 18)));
            
            runningTotal = runningTotal + numberOfPeaks;
        end
            
        if D==2
            %Find the index of each component in a cluster
            [x, y] = ind2sub(CC.ImageSize,CC.PixelIdxList{j});

            % Make a small grid and put the cluster in it.
            clusterGrid = sim(min(x):max(x), min(y):max(y));

            %Find the number of local maxima in this cluster
            numberOfPeaks = length(find(imregionalmax(clusterGrid, 6)));
            
            runningTotal = runningTotal + numberOfPeaks;
            
        end

    end

end