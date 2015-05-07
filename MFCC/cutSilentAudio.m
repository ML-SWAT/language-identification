function yEdited=cutSilentAudio(y)
%[y] = audioread('english/20090526_atc_01.mp3');
meanOfBothChannels = mean(abs(y), 2);
envelope = imdilate(meanOfBothChannels, true(1501, 1));
% Find the quiet parts.
quietParts = envelope < 0.05; % Or whatever value you want.
% Cut out quiet parts and plot.
yEdited = y; % Initialize
yEdited(quietParts, :) = []; % Erase quiet rows

