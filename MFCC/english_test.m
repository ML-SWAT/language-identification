filepath_englishTest='/Users/JudeWang/Documents/language-identification/MFCC/englishtest';
fileList_english_test=listFileM4a(filepath_englishTest);
% size_of_window=5000;
% block=10;
% repetition=1;
% maxIteration=500;
%transformed_vectors_chinese_test=[];
size(fileList_english_test);
count=0;
for i = 1:length(fileList_english_test)
    filename=strcat(filepath_englishTest,'/');
    filename=strcat(filename,fileList_english_test(i).name);
    %label1=classification(C_english,C_chinese,filename,size_of_window,block,mfcc_order);
    transformed_vectors=[];

    [y,Fs] = audioread(filename);
    y=resample(y,8000,Fs);
    y=cutSilentAudio(y);
    mfcc_matrix = msf_mfcc(y,8000,'ncep',mfcc_order);
    
    


    label=kmeans_binary_testing(C_english,C_chinese,mfcc_matrix);
     if strcmp(label,'english')
         count=count+1;
     end
    
end
count*1.0/100