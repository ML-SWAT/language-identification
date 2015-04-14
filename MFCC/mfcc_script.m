filepath_english='/Users/JudeWang/Documents/language-identification/MFCC/english';
filepath_chinese='/Users/JudeWang/Documents/language-identification/MFCC/chinese';
fileList_english=listFile(filepath_english);
fileList_chinese=listFile(filepath_chinese);
size_of_window=15000;
block=20;
mfcc_order=22;
repetition=1;
maxIteration=500;
cluster_number=256;
transformed_vectors_english=[];
transformed_vectors_chinese=[];
for i = 1:length(fileList_english)
    [y,Fs] = audioread(strcat('english/',fileList_english(i).name));
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(j,:),8000,'ncep',mfcc_order);
        transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    end
end

for i = 1:length(fileList_chinese)
    [y,Fs] = audioread(strcat('chinese/',fileList_chinese(i).name));
    y=(y(:,1)+y(:,2))/2;
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        %soundsc(matrix(j,:));
        mfcc_matrix = msf_mfcc(matrix(j,:),8000,'ncep',mfcc_order);
        transformed_vectors_chinese=[transformed_vectors_chinese;mfcc_matrix];
    end
    
    
end

C_english= kmeans_training(transformed_vectors_english,cluster_number,repetition,maxIteration);
C_chinese= kmeans_training(transformed_vectors_chinese,cluster_number,repetition,maxIteration);

% chinese='/Users/JudeWang/Documents/language-identification/MFCC/test/1.mp3';
% english='/Users/JudeWang/Documents/language-identification/MFCC/test/2.mp3';
% 
% label1=classification(C_english,C_chinese,chinese,size_of_window,block,mfcc_order);
% label2=classification(C_english,C_chinese,english,size_of_window,block,mfcc_order);
% 
% 
% label1;
% label2;




