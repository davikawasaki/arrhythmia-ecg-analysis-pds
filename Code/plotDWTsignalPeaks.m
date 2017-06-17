function [qrsPeaks,locs] = plotDWTsignalPeaks(ecgsigTransf, tmTransf, minPeakHeight, minPeakDistance) 
        
% usage: [qrsPeaks,locs] = plotDWTsignalPeaks(ecgsigTransf, tmTransf, 0.5, 0.150)
%
% This function extract from a given QRS extracted signal its respective
% amplitude and location peaks. In the end a plot of the signal with the
% peaks is shown.
%

% Last version
% plotDWTsignalPeaks.m           D. Kawasaki			16 June 2017
% 		      Davi Kawasaki	       16 June 2017 version 1.0

%ecgsigTransf = abs(ecgsigTransf).^2;
[qrsPeaks,locs] = findpeaks(ecgsigTransf,tmTransf,...
                            'MinPeakHeight',minPeakHeight,...
                            'MinPeakDistance',minPeakDistance);
figure;
plot(tmTransf,ecgsigTransf)
hold on
plot(locs,qrsPeaks,'ro')
xlabel('Seconds')
title('R Peaks Localized by Wavelet Transform with Automatic Annotations')

end