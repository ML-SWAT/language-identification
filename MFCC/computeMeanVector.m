function meanVector=computeMeanVector(matrix)
nSize=size(matrix,1);
meanVector=zeros(nSize,1);

for i=1:nSize
    m=mean(matrix(i,:));
    m=m/norm(m);
    meanVector(i)=m;
end