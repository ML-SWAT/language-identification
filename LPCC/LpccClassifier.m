classdef LpccClassifier < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        templateMap = containers.Map;
        resampleRate = 1000;
        languageSet = {'english','chinese','japanese'};
        dataDir = './data/';
    end
    
    methods
        % Build up template library
        function preprocess(obj)
            for i = 1:length(obj.languageSet)
                language = obj.languageSet{i};
                targetFolder = [obj.dataDir, language,'/'];
                files = dir(targetFolder);
                rawData = [];
                for j = 1:length(files)
                    fileName = files(j).name;
                    filePath = [targetFolder, fileName];
                    if fileName(1) == '.'
                        continue;
                    end
                    singleAudio = obj.readAudio(filePath);
                    rawData = [rawData; singleAudio];
                end
                disp(['Calculating template of ',language]);
                template = obj.extractTemplate(rawData);
                obj.templateMap(language) = template;
            end
        end
        
        function language = predict(obj,testFile)
            audio = obj.readAudio(testFile);
            features = obj.extractTemplate(audio);
            %features = obj.templateMap('chinese');
            similarityList = zeros(size(obj.languageSet));
            for i = 1:size(obj.languageSet, 2)
                languageSimilarity = 0;
                candidate = obj.languageSet{i};
                template = obj.templateMap(candidate);
                %disp(['Calculating similarity of ',candidate]);
                for j = 1:size(features,1)
                    maxSingleSimilarity = -999;
                    for k = 1:size(template,1)
                      singleSimilarity = features(j,:) * template(k,:)';
                      singleSimilarity = singleSimilarity / (norm(features(j,:)) * norm(template(k,:)));
                      if (singleSimilarity > maxSingleSimilarity)
                          maxSingleSimilarity = singleSimilarity;
                      end
                    end
                    languageSimilarity = languageSimilarity + maxSingleSimilarity;
                end
                %disp(['Similarity of ', candidate,' is ']);
                %languageSimilarity
                similarityList(1,i) = languageSimilarity;
            end
            [~,languageIndex] = max(similarityList);
            language = obj.languageSet(languageIndex);
        end
        
        % Read an audio file
        function audio = readAudio(obj,filePath)
            %disp(['Reading ', filePath]);
            [audio,fs] = audioread(filePath);
            audio = mean(audio,2);
            quietPart = abs(audio) < 0.001;
            audio(quietPart, :) = [];
            audio = resample(audio, obj.resampleRate, fs);
        end
        
        function template = extractTemplate(obj, data)
            %disp('Extracting features');
            featureMatrix = msf_lpcc(data, obj.resampleRate, 'order', 22);
            if (size(featureMatrix,1) <= 256)
                template = featureMatrix;
            else
                [~,template] = kmeans(featureMatrix, 256);
            end
        end
    end
    methods(Static)
        
    end
end

