
%% matchedEEGtooBandWave
%Titus John
%May 5,2017



%Input


%Output 
%B1 - 0 -7Hz magnitue map to the channel map
%B2 -  7-14Hz
%B3 -  14-49Hz


function [B1, B2 B3] =  matchedEEGtooBandWave(matchedEEGData, fs)

    for i  %this will represent the number of channels in the matched EEG data sete
        [channelWT, freq ] = cwt(eegChannel, fs)
        freq = flipud(freq); %flip the direction of the array for accesnding order of frequncy of the frequncy array
        [B1ChannelMag, B2ChannelMag, B3ChannelMag] =  parseWaveDatatoFreqBands (channelWT, freq)  ;
        
    
    end

end