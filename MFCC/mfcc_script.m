<<<<<<< HEAD
filepath_english='/Users/jessyli/Documents/MATLAB/english';
filepath_chinese='/Users/jessyli/Documents/MATLAB/chinese';
filepath_Tibetan='/Users/jessyli/Documents/MATLAB/Tibetan';

%filepath_test='/Users/jessyli/Documents/MATLAB/test';

fileList_english=listFile(filepath_english);
fileList_chinese=listFile(filepath_chinese);
fileList_Tibetan=listFile(filepath_Tibetan);
%fileList_test=listFile(filepath_test);
size_of_window=5000;
block=10;
repetition=1;
maxIteration=500;
transformed_vectors_english=[];
transformed_vectors_chinese=[];
transformed_vectors_Tibetan=[];
%transformed_vectors_test=[];
=======
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
>>>>>>> guanw
for i = 1:length(fileList_english)
    [y,Fs] = audioread(strcat('english/',fileList_english(i).name));
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
<<<<<<< HEAD
    %[matrix]=readSequence(y,size_of_window,block);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(i,:),8000);
        transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    end
    %mfcc_matrix = msf_mfcc(y,8000);
    %transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    
end
for i = 1:length(fileList_Tibetan)
    [y,Fs] = audioread(strcat('Tibetan/',fileList_Tibetan(i).name));
    
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(i,:),8000);
        transformed_vectors_Tibetan=[transformed_vectors_Tibetan;mfcc_matrix];
    end
    
    
end
for i = 1:length(fileList_chinese)
    [y,Fs] = audioread(strcat('chinese/',fileList_chinese(i).name));
    
=======
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
        mfcc_matrix = msf_mfcc(matrix(j,:),8000,'ncep',mfcc_order);
        transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    end
end

for i = 1:length(fileList_chinese)
    [y,Fs] = audioread(strcat('chinese/',fileList_chinese(i).name));
    y=(y(:,1)+y(:,2))/2;
>>>>>>> guanw
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    [matrix]=readSequence(y,size_of_window,block);
    for j=1:size(matrix,1)
<<<<<<< HEAD
        mfcc_matrix = msf_mfcc(matrix(i,:),8000);
=======
        %soundsc(matrix(j,:));
        mfcc_matrix = msf_mfcc(matrix(j,:),8000,'ncep',mfcc_order);
>>>>>>> guanw
        transformed_vectors_chinese=[transformed_vectors_chinese;mfcc_matrix];
    end
    
    
end

<<<<<<< HEAD
cluster_number=256;
C_english= kmeans_training(transformed_vectors_english,cluster_number,repetition,maxIteration);
C_chinese= kmeans_training(transformed_vectors_chinese,cluster_number,repetition,maxIteration);
C_Tibetan= kmeans_training(transformed_vectors_Tibetan,cluster_number,repetition,maxIteration);


%scalling the data
%transformed_vectors_english = mapminmax(transformed_vectors_english);
%transformed_vectors_chinese = mapminmax(transformed_vectors_chinese);

% TrainData = [C_english; C_chinese; C_Tibetan];
% TrainLabel = ones(256,1);
% TrainLabel = [3*TrainLabel; 1*TrainLabel; 2*TrainLabel];
% transformed_vectors_test=[];
% 
%  model = svmtrain(TrainLabel, TrainData, '-c 1 -g 0.07 -b 1 -t 3 ');

% testLabel  = -1*ones(610,1);
% testLabel = [testLabel; ones(610,1)];
% [predict_label, accuracy, prob_values] = svmpredict(testLabel, transformed_vectors_test, model, '-b 1');
% 
% 
% 
=======
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




>>>>>>> guanw
