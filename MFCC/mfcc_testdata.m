filepath_english_test='/Users/jessyli/Documents/language-identification/MFCC/englishtest';
filepath_chinese_test='/Users/jessyli/Documents/language-identification/MFCC/chinesetest';
%filepath_test='/Users/jessyli/Documents/MATLAB/test';

fileList_english_test=listFileM4a(filepath_english_test);
fileList_chinese_test=listFileM4a(filepath_chinese_test);
%fileList_test=listFile(filepath_test);
%size_of_window=5000;
block=10;
repetition=1;
maxIteration=500;
transformed_vectors_english_test=[];
transformed_vectors_chinese_test=[];
%transformed_vectors_test=[];
for i = 1:length(fileList_english_test)
    [y,Fs] = audioread(strcat('englishtest/',fileList_english_test(i).name));
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    %[matrix]=readSequence(y,size_of_window,block);
    %[matrix]=readSequence(y,size_of_window,block);
    %for j=1:size(matrix,1)
        mfcc_matrix_english = msf_mfcc(y,8000);
        %transformed_vectors_english_test=[transformed_vectors_english_test;mfcc_matrix];
   
%end
    %mfcc_matrix = msf_mfcc(y,8000);
    %transformed_vectors_english=[transformed_vectors_english;mfcc_matrix];
    
end

for i = 1:length(fileList_chinese_test)
    [y,Fs] = audioread(strcat('chinesetest/',fileList_chinese_test(i).name));
%    y=(y(:,1)+y(:,2))/2;
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    %[matrix]=readSequence(y,size_of_window,block);
    %for j=1:size(matrix,1)
        mfcc_matrix_chinese = msf_mfcc(y,8000);
     %   transformed_vectors_chinese_test=[transformed_vectors_chinese_test;mfcc_matrix];
   % end
    
    
end
testdatachinese=mfcc_matrix_chinese;
chineselabel = -1*ones(length(mfcc_matrix_chinese),1);
testdataenglish=mfcc_matrix_english;
englishlabel = ones(length(mfcc_matrix_english),1);
testdata = [mfcc_matrix_english; mfcc_matrix_chinese] ;

testlabel = [ones(length(mfcc_matrix_english),1); -1*ones(length(mfcc_matrix_chinese),1)];
[predict_label, accuracy, prob_values] = svmpredict(testlabel, testdata, model);
[predict_labeleng, accuracyeng, prob_valueseng] = svmpredict(englishlabel, testdataenglish, model);
[predict_labelchi, accuracychi, prob_valueschi] = svmpredict(chineselabel, testdatachinese, model);