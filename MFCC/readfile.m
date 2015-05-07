function [y,Fs]=readfile(filename,range)
[y,Fs] = audioread(filename,range);
