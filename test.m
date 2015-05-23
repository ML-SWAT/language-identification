files = dir('./data/englishtest/*.m4a');
result = cell(1,length(files));
errorCount = 0;
for j = 1:length(files)
    disp(['./data/englishtest/', files(j).name]);
    lan = l.predict(['./data/englishtest/', files(j).name]);
    if strcmp(lan,'english') == 0
        disp(lan);
        errorCount = errorCount + 1;
    end
    result{j} = lan;
end
