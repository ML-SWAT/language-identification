function res=listFileM4a(path)
fileList = dir(path);
res=[];
for i =1:length(fileList)
    startIndex = regexp(fileList(i).name,'.m4a', 'once');
    if ~isempty(startIndex)
        res=[res,fileList(i)];
    end
end