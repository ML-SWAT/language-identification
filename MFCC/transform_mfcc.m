function transformed_matrix=transform_mfcc(matrix)
meanVector=computeMeanVector(matrix);
varianceVector=computeVarianceVector(matrix);
transformed_matrix=[meanVector,varianceVector];

