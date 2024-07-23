function [EEG] = MergeBSandEEG_cs(BSdata,EEGorg22,ARTIFACTS)
%%
%EEGorg22 = EEGorg2; 
clear data
for chan = 1:length(BSdata); data(chan,:) = BSdata(chan).DataRes; end
time = BSdata(1).time;

%%% Realign BS data to EEG
% xlat = ARTIFACTS.LFP(subject,1:12);
%ARTIFACTS = tempDBSARTperceptIDX; 
%figure; plot(BSdata(1).DataRes); hold on;
%plot(ARTIFACTS, BSdata(1).DataRes(ARTIFACTS),'rx')
xlat = ARTIFACTS;
Tart_LFP = xlat;
Tart_EEG = [EEGorg22.event( find(strcmp({EEGorg22.event.type}, 'DBS_ARTIFACT')) ).latency];
% Tart_LFP2= xlat;
% Tart_EEG2= [EEGorg22.event( find(strcmp({EEGorg22.event.type}, 'DBS_OFF')) ).latency];

% for i = 1:length(xlat)
%     [xx,Tart_LFP(i)] = min(abs(time-Tart_LFP(i)));
%     [yy,Tart_EEG(i)] = min(abs(EEGorg22.times-Tart_EEG(i)));
% end

% align BS data to first artifact
% Tart_LFP(1) 
% Tart_EEG(1)
if Tart_LFP(1) > Tart_EEG(1)
    Diff = Tart_LFP(1) - Tart_EEG(1);
    data(:,1:Diff) = []; 
    Tart_LFP = Tart_LFP-Diff;
elseif Tart_LFP(1) < Tart_EEG(1)
    Diff = Tart_EEG(1) - Tart_LFP(1) ;
    data = [data(:,1:Diff) data];
    Tart_LFP = Tart_LFP+Diff;
end

if Tart_LFP(1) ~= Tart_EEG(1)
    error('First point mismatch')
end
%%
% realign for each block onset
% i=8
for i = 2:length(Tart_LFP)
    
    
    
    delta = Tart_LFP(i) - Tart_EEG(i);
    % delta
    % [i delta]
    if  delta > 0 % IF LFP was later than EEG
        delta = abs(delta);
        data(:,Tart_LFP(i)-delta:Tart_LFP(i)-1) = []; % remove left over datapoints
        % data(:,Tart_LFP(i)-delta:Tart_LFP(i)-1) = [];
        Tart_LFP(i:end) = Tart_LFP(i:end)-delta;
    elseif delta < 0 % IF LFP was earlier than EEG
        delta = abs(delta);
        % data = [data(:,1:Tart_LFP(i)) zeros(size(data,1),delta-2) data(:,Tart_LFP(i):end)];
        % ones(size(data,1),delta)*Tart_LFP(i)
        % ones(size(data,1),delta)
        
        % insert some datapoints to match the size
        % data = [data(:,1:Tart_LFP(i)-1) ones(size(data,1),delta).*repmat(data(:,Tart_LFP(i)-1),1,delta) data(:,(Tart_LFP(i)):end)];
        
        data = [data(:,1:Tart_LFP(i)-31) ones(size(data,1),delta).*repmat(data(:,Tart_LFP(i)-31-delta),1,delta) data(:,(Tart_LFP(i)-30):end)];

        % ones(size(data,1),delta).*repmat(data(:,Tart_LFP(i)-1),1,delta)
        Tart_LFP(i:end) = Tart_LFP(i:end)+delta;
        
    elseif delta == 0
    end
    
    if Tart_LFP(i) ~= Tart_EEG(i)
        error('Percept and EEG mismatch')
    end
end

% find(data(2,:)==0)


% adjust size of BS and EEG data
if length(data) > length(EEGorg22.times)
    data(:,length(EEGorg22.times)+1:end) = [];
elseif length(data) < length(EEGorg22.times)
    EEGorg22 = pop_select(EEGorg22,'nopoint',[length(data)+1 length(EEGorg22.times)]);
end

%%% ADD BS DATA TO EEG DATA
EEGorg22.data = [EEGorg22.data;data]; EEGorg22.nbchan = length(EEGorg22.chanlocs)+length(BSdata);
for chan = 1:length(BSdata); EEGorg22.chanlocs(length(EEGorg22.chanlocs)+1).labels = char(BSdata(chan).Channel); end
% EEGorg22 = eeg_checkset( EEGorg22 );

EEG = EEGorg22;

end