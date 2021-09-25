clc,clear;
A=importdata('A.mat');  
[rowsize,colsize] = size(A);  
sim = zeros(colsize);  
%% Pearson相关系数求电影相似性  
for i = 1:colsize-1  
    for j = i+1:colsize  
        sum1=0;  
        sum2=0;  
        sum3=0;  
        sum4=0;  
        sum5=0;  
        temp = A(:,i)&A(:,j);  
        index = find(temp);  
        for k = 1:size(index,1)  
            sum1 = sum1 + A(index(k),i)*A(index(k),j);  
            sum2 = sum2 + A(index(k),i);  
            sum3 = sum3 + A(index(k),j);  
            sum4 = sum4 + A(index(k),i)^2;  
            sum5 = sum5 + A(index(k),j)^2;  
        end  
        sum23 = (sum2 * sum3)/k;  
        sum42 = sum4 - sum2^2/k;  
        sum53 = sum5 - sum3^2/k;  
        if (sum42~=0&&sum53~=0)  
            sim(i,j)=(sum1 - sum23)/sqrt(sum42 * sum53);  
        end  
    end  
end  
%% 给用户推荐电影评分  
predict_score = zeros(rowsize,colsize);  
for i = 1:rowsize  
    % 找到用户已评价的电影的索引  
    find_temp = find(A(i,:));  
    % 找到用户没有评价的电影索引  
    ufind_temp = find(A(i,:)==0);
    
    % 预测用户没有评价电影的评分值  
    for j = 1:size(ufind_temp,2)  
        % 利用某用户对所有评价电影乘以未评价电影相似度  
        for k=1:size(find_temp,2)  
            predict_score(i,ufind_temp(j)) = predict_score(i,ufind_temp(j)) + A(i,find_temp(k))*sim(find_temp(k),ufind_temp(j));  
        end  
    end  
end  