function arrhythmiaMultipleQRS = extractMultipleQRS(arrhythmiaPeriods, sizeEcgSig, timeEcgSig, ecgsig, tmSeg)

% usage: arrhythmiaMultipleQRS = extractMultipleQRS(arrhythmiaPeriods, 650000, 1820, ecgsig, tmSeg)
%
% This function extract multiples QRS wave,
% which may or not contain signal arrhytmias.
%
% arrhythmiaMultipleQRS{i,1} equals to the QRS extracted signal
% arrhythmiaMultipleQRS{i,2} equals to the QRS extracted time
% arrhythmiaMultipleQRS{i,3} equals to arrhythmia type sample
%

% Last version
% extractMultipleQRS.m           D. Kawasaki			16 June 2017
% 		      Davi Kawasaki	       16 June 2017 version 1.0

periodInterval = sizeEcgSig/timeEcgSig;

arrhythmiaMultipleQRS = {};
for i = 1:size(arrhythmiaPeriods,1)
    period = arrhythmiaPeriods{i,3};
    if(period == -1)
        %tmPeriod = arrhythmiaPeriods{i,3} * interval;
        tmTotal = arrhythmiaPeriods{i,1} * 60;
        tmTotal = tmTotal + arrhythmiaPeriods{i,2};
        period = (tmTotal*sizeEcgSig)/timeEcgSig;
    end
    qrsExtracted = ecgsig(round(period - periodInterval/2):round(period + periodInterval));
    tmExtracted = tmSeg(round(period - periodInterval/2):round(period + periodInterval));
    inst = {qrsExtracted tmExtracted arrhythmiaPeriods{i,4}};
    arrhythmiaMultipleQRS(end+1,:) = inst;
end

end
