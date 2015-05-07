import numpy as np
import librosa
from sklearn import linear_model
import os
import glob
import numpy as np
def mfccFeature(fileName):
    mfcc_order=1
    length=500;
    y, sr = librosa.load(fileName)
    startpoint =len(y)*1.0/4
    y = y[startpoint:startpoint+length]

    mfccs = librosa.feature.mfcc(y=y, sr=sr,n_mfcc=mfcc_order)
    result = np.array([])
    for i in range(mfcc_order):
        print mfccs[i]
        result = np.append(result,mfccs[i])
    return result

if __name__=="__main__":
    result=mfccFeature('/Users/JudeWang/Documents/language-identification/MFCC/english/globalnews_20150201-1546.mp3')