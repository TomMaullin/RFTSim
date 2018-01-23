%==========================================================================
% This file generates the inputs needed for simulating RFT cluster size
% thresholds, expectations and probabilities. This file take one input: 
%
% D - the dimension of the data.
%
% It returns a structure containing 4 variables:
%
% D - the dimension of the data.
% u - the excursion set threshold.
% W - the measure of smoothness.
% S - the size of the data.
%
% Authors: Tom Maullin, Samuel Davenport (17/01/2018)
%==========================================================================

function inputStruct = getInputs(D)
        
        inputStruct = struct;
        
        if D == 2
            simulatedData = datagen(5,1);
        else
            simulatedData = datagen(6,1);
        end
        FWHM = 6; %Note here we assume that the FWHM is the same in every direction.
        
        inputStruct.D = D;
        inputStruct.u = 2.58;
        inputStruct.W = FWHM/sqrt(4*log(2));
        inputStruct.S = numel(simulatedData);
end

