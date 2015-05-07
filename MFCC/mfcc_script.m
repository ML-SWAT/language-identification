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
