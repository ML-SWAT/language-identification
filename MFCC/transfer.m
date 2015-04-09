function [speechnew, fs] = transfer(speech, fs)
    [M,N] = size(speech);
    %speechnew = [];
    if N~=1
        speechnew = speech(:,1);
    else
        speechnew = speech;
    end
        
end