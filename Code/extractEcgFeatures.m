function features = extractEcgFeatures(DWTsignalPeaks, fileName) 

% usage: extractEcgFeatures(DWTsignalPeaks, 'data/vt-200m')
%
% This function extract physiological ECG features from DWT peaks.
%
% features{i,1} equals to R peak amplitude in mV
% features{i,2} equals to R-R peak time delay
% features{i,3} equals to wave arrhythmia type
%

% Last version
% extractEcgFeatures.m           D. Kawasaki			17 June 2017
% 		      Davi Kawasaki	       17 June 2017 version 1.0

features = {};

for i = 1:size(DWTsignalPeaks,1)
    if(strcmp(DWTsignalPeaks{i,3},'(VT'))
        peakAmpR = DWTsignalPeaks{i,1}(end);
        peakIntervalRR = DWTsignalPeaks{i,1}(end) - DWTsignalPeaks{i,1}(1);
        inst = {peakAmpR peakIntervalRR DWTsignalPeaks{i,3}};
    else
        % Other types of arrhythmia
    end
    features(end+1,:) = inst;
end

featuresExtr = strcat(fileName, '.csv');

featuresTable = cell2table(features, 'VariableNames',{'Amplitude','RR','Arritmia'});
writetable(featuresTable, featuresExtr);

end