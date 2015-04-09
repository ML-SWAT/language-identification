function [C]=kmeans_supervised(feature_matrix,cluster,repetition)
[~,C] = kmeans(feature_matrix,cluster,'Replicates',repetition);