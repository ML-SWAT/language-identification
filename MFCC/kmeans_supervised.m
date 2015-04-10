function [C]=kmeans_supervised(feature_matrix,cluster,repetition,maxIteration)
[~,C] = kmeans(feature_matrix,cluster,'Replicates',repetition,'MaxIter',maxIteration);