function [res]=readSequence(y,size,block)
res=zeros(block,size);
start_point=length(y)*1.0/block;
for i=1:block
    res(i,:)=y(start_point:start_point+size);
end