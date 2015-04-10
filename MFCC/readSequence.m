function [res]=readSequence(y,size,block)
res=zeros(block,size);
start_point=length(y)/(block+1);
start_point=int32(start_point);
interval=start_point;
%start_point=int32(length(y)*1/(block+1));
for i=1:block
    res(i,:)=y(start_point:start_point+size-1);
    start_point=start_point+interval;
end