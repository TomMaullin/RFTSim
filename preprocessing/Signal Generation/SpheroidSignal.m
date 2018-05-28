function Img = SpheroidSignal(Dim, rad, mag, smo)
% SPHEROIDSIGNAL generates signal within the ellipsoid with cartesian 
% equation x^2 + y^2 + z^2 = rad^2. It then smoothes it using a 
% kernel smoother with the FWHM given by smo.Amate
%--------------------------------------------------------------------------
% ARGUMENTS
% Dim   A 1 by 2 or 1 by 3 vector of the image dimensions, 
%       Dim = [256,256,256] corresponds to a 256*256*256 image.
% rad   A positive number that is the equatorial radius of Spheroid.
% mag   The magnitude of the signal.
% smo   A 1 by 2 or 1 by 3 vector with the smoothness in each direction. 
%       This is in terms of the FWHM, ie smo = [FWHM_x, FWHM_y, FWHM_z]:
%       the FWHM in each of the x, y and z directions. Taking smo = 0
%       means that there is no smoothing done.
%--------------------------------------------------------------------------
% OUTPUT
% Img   An array with dimensions given by Dim that has been smoothed
%       according to the degree of smoothness specified by smo.
%--------------------------------------------------------------------------
% EXAMPLES
% %2d signal without smoothing:
% Sig = SpheroidSignal([256, 256],20,3,0);
% surf(Sig)
%
% %2d signal with smoothing:
% Sig = SpheroidSignal([256, 256],20,3,10);
% surf(Sig)
%
% %3d signal without smoothing:
% Sig = SpheroidSignal([256, 256, 256],20,3,0);
% surf(Sig(:,:,128)); %And compare this to:
% surf(Sig(:,:,109)); %This has a smaller radius as is in a higher part of
%                     %the sphere.
%
% %3d signal with smoothing:
% Sig = SpheroidSignal([256, 256, 256],20,3,10);
% surf(Sig(:,:,128)); %And compare this to:
% surf(Sig(:,:,109)); %This has a smaller radius as is in a higher part of
%                     %the sphere.
%--------------------------------------------------------------------------
% SEE ALSO
% MYSMOOTH, MKRADIMG

Dim = Dim(:)';

%Calculate the centre of the image.
Cent0 = Dim/2 + 1/2;

%Comm = sprintf('Sphere r=%02d sm=%1d',rad,smo); 

Img = MySmooth(MkRadImg(Dim,Cent0)<=rad,smo)*mag;

return