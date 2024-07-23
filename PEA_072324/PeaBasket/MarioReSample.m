function [data, time] = MarioReSample(OriginalData, OriginalRate, NewRate)

% sampling rates in Hz

[p,q] = rat(NewRate / OriginalRate);
data = resample(OriginalData,p,q);
time = (0:numel(data)-1)/NewRate*1000;


% figure
% plot((0:numel(OriginalData)-1)/OriginalRate*1000,OriginalData,'b')
% hold on
% plot(time,data,'r')


end