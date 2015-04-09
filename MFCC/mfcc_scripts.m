filepath_english='/Users/JudeWang/Documents/language-identification/MFCC/english';
filepath_chinese='/Users/JudeWang/Documents/language-identification/MFCC/chinese';
fileList_english=listFile(filepath_english);
fileList_chinese=listFile(filepath_chinese);
size=500;
block=10;
for i = 1:length(fileList_english)
    [y,Fs] = audioread(strcat('english/',fileList_english(i).name));
    [matrix]=readSequence(y,500,10);

end