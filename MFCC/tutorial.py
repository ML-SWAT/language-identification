import numpy as np
import librosa
from sklearn import linear_model
import os
import glob
from sklearn.preprocessing import normalize
import matplotlib.pyplot as plt
from sklearn.metrics import accuracy_score
def mfccFeature(fileName):
    mfcc_order=10
    length=500;
    y, sr = librosa.load(fileName)
    print "loaded one file"
    startpoint =len(y)*1.0/4
    y = y[startpoint:startpoint+length]

    mfccs = librosa.feature.mfcc(y=y, sr=sr,n_mfcc=mfcc_order)
    print "processing one file"
    meanVector=computeMean(mfccs)
    varianceVector=computeMatrixVariance(mfccs)
    res=np.concatenate(meanVector,varianceVector)
    return res

def train():
    english_list=Files("english")
    chinese_list=Files("chinese")
    X_train = []
    dir=os.getcwd()+"/"
    print english_list
    print chinese_list
    for file in english_list:
        print dir+file
        X_train=X_train.append(mfccFeature(dir+file))

    for file in chinese_list:
        print dir+file
        X_train=X_train.append(mfccFeature(dir+file))

    # # plt.plot(X_train)
    # # plt.show()
    #
    # Y_train = []
    # for file_path in english_list:
    #     Y_train.append("english" in file_path)
    # for file_path in chinese_list:
    #     Y_train.append("chinese" in file_path)
    # logreg = linear_model.LogisticRegression(dual=True)
    # logreg.fit(X_train, Y_train)
    # y_hat = logreg.predict(X_train)
    # print accuracy_score(Y_train,y_hat)
    #return logreg
def Files(partOfDir):
    part = partOfDir+"/*" #Project/english
    train_file_list = glob.glob(part)
    return train_file_list


def computeMean(matrix):
    mean_unnormalized=np.mean(matrix,axis=1)
    #print mean_unnormalized
    mean_normalized=mean_unnormalized/np.linalg.norm(mean_unnormalized)
    #print mean_normalized
    return mean_normalized
def computeVectorVariance(vector):
    return np.var(vector)
def computeMatrixVariance(matrix):
    res=matrix.var(1)
    res=np.squeeze(np.asarray(res))
    res=res/np.linalg.norm(res)
    return res
if __name__ =="__main__":
    #logreg = linear_model.LogisticRegression(dual=True)
    train()
    #a = np.matrix('1 2 3 4; 3 4 5 6;6 7 8 9')
    #res = computeMean(a)
    # a = np.matrix('1 2 3;3,4,5')
    # res =computeMatrixVariance(a)
    # print res



