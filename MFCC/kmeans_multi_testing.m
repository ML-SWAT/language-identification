function label=kmeans_multi_testing(english_clusters,chinese_clusters,Tibetan_clusters,test_matrix)
vote_to_chinese=0;
vote_to_english=0;
vote_to_Tibetan=0;
sum_cluster_english = sqrt(sum(english_clusters .* english_clusters,2));
sum_cluster_chinese = sqrt(sum(chinese_clusters .* chinese_clusters,2));
sum_cluster_Tibetan = sqrt(sum(Tibetan_clusters .* Tibetan_clusters,2));
cluster_size=size(english_clusters,1);
for i=1:size(test_matrix,1)
    test_Vector=test_matrix(i,:);
    sum_test_vector=sqrt(sum(test_Vector.*test_Vector));
    test_vectors= repmat(test_Vector,cluster_size,1);
    english_distance = sum(test_vectors.*english_clusters,2);
    english_distance = english_distance/sum_test_vector;
    english_distance = english_distance./sum_cluster_english;
    
    chinese_distance = sum(test_vectors.*chinese_clusters,2);
    chinese_distance = chinese_distance/sum_test_vector;
    chinese_distance = chinese_distance./sum_cluster_chinese;
    %english_distance = sqrt((test_vectors-english_clusters).^2);
    %chinese_distance = sqrt((test_vectors-chinese_clusters).^2);
    Tibetan_distance = sum(test_vectors.*Tibetan_clusters,2);
    Tibetan_distance = Tibetan_distance/sum_test_vector;
    Tibetan_distance = Tibetan_distance./sum_cluster_Tibetan;
    min_english=max(english_distance);
    min_chinese=max(chinese_distance);
    min_Tibetan=max(Tibetan_distance);

    temp = [min_english,min_chinese,min_Tibetan];
    if max(temp)==min_english
        vote_to_english=vote_to_english+1;
    elseif max(temp)==min_chinese
        vote_to_chinese=vote_to_chinese+1;
        else
         vote_to_Tibetan = vote_to_Tibetan+1;   
    end
    
end
temp2=[vote_to_chinese,vote_to_english,vote_to_Tibetan];
if vote_to_chinese==max(temp2)
    label='chinese';
elseif vote_to_english==max(temp2)
    label='english';
else
    label ='Tibetan';
end