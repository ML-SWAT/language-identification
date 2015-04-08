function res=listFile(path)
fileList = dir(path);
res=[];
for i =1:length(fileList)
    startIndex = regexp(fileList(i).name,'.mp3', 'once');
    if ~isempty(startIndex)
        res=[res,fileList(i)];
    end
end