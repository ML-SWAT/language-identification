filepath_english='/Users/JudeWang/Documents/language-identification/MFCC/english';
filepath_chinese='/Users/JudeWang/Documents/language-identification/MFCC/chinese';
fileList_english=listFile(filepath_english);
fileList_chinese=listFile(filepath_chinese);
size=500;
block=10;
transformed_vectors_english=[];
transformed_vectors_chinese=[];
for i = 1:length(fileList_english)
    [y,Fs] = audioread(strcat('english/',fileList_english(i).name));
    [matrix]=readSequence(y,500,10);
    for i=1:size(matrix,1)
        %TODO
        %mfcc on matrix(i,:)
        %transform on mfcc vectors
        %add the transformed vectors to transformed_vectors_*
        
    end
end




