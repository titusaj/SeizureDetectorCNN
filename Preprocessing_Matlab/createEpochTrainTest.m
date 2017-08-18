% Titus John
% 7/21/2017
%%%%%%%%%%%%%%%%%%%%%%
% input -  
% Case Name
%Channel Number
%Epoch Numer
%Class -  Sleep/Sz
%Fs - Sampling Rate

% output - 

%files
%%%%%%%%%%%%%%%%%%%%%%
function parseEpochData

    szFolderPath = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/szEpochs/')
    sleepFolderPath = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/sleepEpochs/')
    files = dir;

    for i =5
        
        %Get the parts of name of the SZ files
        patientFolder = strcat('/Users/titusjohn/Documents/GitHub/SeizureClassfication/szNum',num2str(i));
        cd (patientFolder)
        files = dir;
        
        lastFile = files(length(files)).name; 
        lastFileParts=strsplit(lastFile,'_')
        
        
        
         numFilePart = lastFileParts{1};
         szFileNum  = str2num(numFilePart(end));
        
        
        numFilePart = lastFileParts{2};
        szEpochsNum= str2num(numFilePart(1)) %this represents the number of sz epochs in the file
        
     
        
         figure(1)
         hold on
         title('SZ FFTs')
            for j =1:szEpochsNum
                 szFileName = strcat('SZEpoch',num2str(szFileNum),'_', num2str(j) ,'.txt')
                 rawSzData = csvread(szFileName);
                 szMaxFFT= findMaxFFT(rawSzData,'r');
                
                 szFileMat = strcat(szFolderPath,'SZEpoch',num2str(szFileNum),'_', num2str(j) ,'.mat');
                 save(szFileMat, 'szMaxFFT');
            end
        
            
            
         %Pick of random files based on number sz files
          %10:1
          
            
         r = randi([1, 2000 ],1,szEpochsNum*10);
        %(length(files)-szEpochsNum)
            
        
        figure(2)
        hold on 
        title('Sleep FFTs')
            for j =1:length(r)
                  sleepFileName = strcat('NonSZEpoch',num2str(szFileNum),'_', num2str(r(j)) ,'.txt')             
                  rawSleepData = csvread(sleepFileName);
                  sleepMaxFFT= findMaxFFT(rawSleepData,'b');
                  
                  sleepFileMat = strcat(sleepFolderPath,'NonSZEpoch',num2str(szFileNum),'_', num2str(r(j)) ,'.mat');             
                   save(sleepFileMat, 'sleepMaxFFT')
            end
        
    end
    
    
    
    
     

end