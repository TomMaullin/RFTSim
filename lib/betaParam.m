%==========================================================================
% This file creates the beta parameter described in "Assessing Focal 
% Activations by Spatial Extent" by Friston, et al (1994). It takes as
% input:
%
% D - the dimension of the data.
% expectedn - the expected number of clusters above a threshold.
%
% And returns:
%
% beta - the beta parameter.
%
% Authors: Tom Maullin, Samuel Davenport (05/02/2018)
%==========================================================================

function beta = betaParam(expectedn, D)

    beta = (gamma(D/2 + 1)*expectedn)^(2/D);

end