function [qrsExtracted, tmExtracted] = plotExtractSingleQRS(minute, seconds, period, sizeEcgSig, timeEcgSig, ecgsig, tmSeg)

% usage: [qrsExtracted, tmExtracted] = plotExtractSingleQRS(1, 00.0123, 38154, 650000, 1820, ecgsig, tmSeg)
%
% This function get a period to extract a QRS wave,
% which may or not contain signal arrhytmias.
%
% References can be found at
% PhysioBank ATM, at
%    http://physionet.org/cgi-bin/ATM
%

% Last version
% plotExtractSingleQRS.m           D. Kawasaki			16 June 2017
% 		      Davi Kawasaki	       16 June 2017 version 1.0

periodInterval = sizeEcgSig/timeEcgSig;

if(period == -1)
    %tmPeriod = period * interval;
    tmTotal = minute * 60;
    tmTotal = tmTotal + seconds;
    period = (tmTotal*sizeEcgSig)/timeEcgSig;
end
qrsExtracted = ecgsig(round(period - periodInterval/2):round(period + periodInterval));
tmExtracted = tmSeg(round(period - periodInterval/2):round(period + periodInterval));

plot(tmExtracted, qrsExtracted);
xlabel('Time (sec)');

end
