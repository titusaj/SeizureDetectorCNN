%%  Filter wavelet data into the given frequncy bands

%Titus John
%May 4, 2017

%input

%output

function [B1, B2, B3] =  parseWaveDatatoFreqBands (channelWT, freq)
        
        B1check = 0;
        B2check = 0;
        B3check = 0;

        for i =1:length(freq)       

                if freq(i) > 7 && B1check ==0  %pick of the index where the freq value becomes greater than 7
                       B1(2) = i;
                       B1check = 1;
                end

                if freq(i) >14 && B2check ==0  %pick of the index where the freq value becomes greater than 14      
                       B2(2) = i;
                       B2check = 1;
                end

                if freq(i)>49 && B3check ==0  %pick of the index where the freq value becomes greater than 49
                       B3(2) = i;
                       B3check = 1;
                end           

        end
     
        %set the starting point of the given data 
        B1(1) = 1; 
        B2(1) = B1(2) +1;
        B3(1) = B2(2) +1;
       
        
        %loop through the wave data to get the given wave data
        for i =1:3
            B = eval(strcat('B',num2str(i)));
            BChannelWav= channelWT(B(1): B(2),:);
            
            for j =1:length(BChannelWav(:,1))
                BChannelRowWav = BChannelWav(j,:);
                BChannelRowMag = mean(abs(BChannelRowWav)/length(BChannelRowWav));
                BChannelMag(j) =BChannelRowMag; 
            end
            
            if i==1
                B1 = mean(BChannelMag);
            elseif i==2
                B2= mean(BChannelMag);
            elseif i ==3
                B3 = mean(BChannelMag);
            end
            
            
        end

end