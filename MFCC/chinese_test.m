filepath_chineseTest='/Users/JudeWang/Documents/language-identification/MFCC/chinesetest';
fileList_chinese_test=listFileM4a(filepath_chineseTest);
% size_of_window=5000;
% block=10;
% repetition=1;
% maxIteration=500;
%transformed_vectors_chinese_test=[];
size(fileList_chinese_test);
count=0;
for i = 1:length(fileList_chinese_test)
    [y,Fs] = audioread(strcat('chinesetest/',fileList_chinese_test(i).name));
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    %[matrix]=readSequence(y,size_of_window,block);
    
    mfcc_matrix = msf_mfcc(y,8000);
    size(mfcc_matrix);
    %transformed_vectors_chinese_test=[transformed_vectors_chinese_test;mfcc_matrix];
    
    label=kmeans_binary_testing(C_english,C_chinese,mfcc_matrix);
    if strcmp(label,'chinese')
        count=count+1;
    end
    
end
count*1.0/100