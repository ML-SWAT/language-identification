
filepath_chineseTest='/Users/jessyli/Documents/language-identification/MFCC/chinesetest';

fileList_chinese_test=listFileM4a(filepath_chineseTest);
% size_of_window=5000;
% block=10;
% repetition=1;
% maxIteration=500;
%transformed_vectors_chinese_test=[];
size(fileList_chinese_test);
count=0;
for i = 1:length(fileList_chinese_test)
    filename=strcat(filepath_chineseTest,'/');
    filename=strcat(filename,fileList_chinese_test(i).name);
    %label1=classification(C_english,C_chinese,filename,size_of_window,block,mfcc_order);
    transformed_vectors=[];

    [y,Fs] = audioread(filename);
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    mfcc_matrix = msf_mfcc(y,8000);
    
    

    label=kmeans_multi_testing(C_english,C_chinese,C_Tibetan,mfcc_matrix);
     if strcmp(label,'chinese')
         count=count+1;
     end
    
end
count*1.0/100