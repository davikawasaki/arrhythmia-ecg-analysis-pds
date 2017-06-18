function [tmSeg,ecgsig,Fs,sizeEcgSig,timeEcgSig,annotationsEcg,qrsExtracted,tmExtracted,ecgsigTransf,qrsPeaks,locs] = singleExampleWithDWTsignalPeaksExtraction(filename, filepath, arrhythmiaType, minutes, seconds, period, minPeakHeight, minPeakDistance) 

% Usage: function [tmSeg,ecgsig,Fs,sizeEcgSig,timeEcgSig
%                  annotationsEcg,qrsExtracted,tmExtracted
%                  ecgsigTransf,qrsPeaks,locs] =
%                  singleExampleWithDWTsignalPeaksExtraction('200m', '../data/200m',
%                                                            'VT', 0, 7.517, 2706,
%                                                            0.5, 0.150);
%
% This function plots and extracts QRS peaks example.
%

% Last version
% singleExampleWithDWTsignalPeaksExtraction.m           D. Kawasaki			18 June 2017
% 		      Davi Kawasaki	       18 June 2017 version 1.0

[tmSeg,ecgsig,Fs,sizeEcgSig,timeEcgSig] = loadEcgSignal('../data/100m');
annotationsEcg = readAnnotations('../data/100m');
[qrsExtracted, tmExtracted] = plotExtractSingleQRS(0, 7.517, 2706, sizeEcgSig, timeEcgSig, ecgsig, tmSeg, '200m', 'VT');
ecgsigTransf = dwtSignal(qrsExtracted, 3);
[qrsPeaks,locs] = plotDWTsignalPeaks(ecgsigTransf, tmExtracted, 0.5, 0.150);

end