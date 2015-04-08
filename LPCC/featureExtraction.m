resample_rate = 8000;
[sample_ts, sample_fs] = audioread('english.mp3');
sample_ts = resample(sample_ts, resample_rate, sample_fs);
feature_matrix = msf_lpcc(sample_ts, resample_rate);
