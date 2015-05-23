function label=classification(english_clusters,chinese_clusters,filename,size_of_window,block,mfcc_order)
transformed_vectors=[];

[y,Fs] = audioread(filename);
y=resample(y,8000,Fs);
y=cutSilentAudio(y);
[matrix]=readSequence(y,size_of_window,block);
for j=1:size(matrix,1)
    mfcc_matrix = msf_mfcc(matrix(j,:),8000,'ncep',mfcc_order);
    transformed_vectors=[transformed_vectors;mfcc_matrix];
end
    

label=kmeans_binary_testing(english_clusters,chinese_clusters,transformed_vectors);