filepath_english='/Users/JudeWang/Documents/language-identification/MFCC/english';
filepath_chinese='/Users/JudeWang/Documents/language-identification/MFCC/chinese';
fileList_english=listFile(filepath_english);
fileList_chinese=listFile(filepath_chinese);
size_of_window=5000;
block=10;
repetition=1;
maxIteration=500;
transformed_vectors_english=[];
transformed_vectors_chinese=[];
for i = 1:length(fileList_english)
    [y,Fs] = audioread(strcat('english/',fileList_english(i).name));
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    %[matrix]=readSequence(y,size_of_window,block);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(i,:),8000);
        transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    end
    %mfcc_matrix = msf_mfcc(y,8000);
    %transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    
end

for i = 1:length(fileList_chinese)
    [y,Fs] = audioread(strcat('chinese/',fileList_chinese(i).name));
    y=(y(:,1)+y(:,2))/2;
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(i,:),8000);
        transformed_vectors_chinese=[transformed_vectors_chinese;mfcc_matrix];
    end
    
    
end
cluster_number=256;
C_english= kmeans_training(transformed_vectors_english,cluster_number,repetition,maxIteration);
C_chinese= kmeans_training(transformed_vectors_chinese,cluster_number,repetition,maxIteration);








