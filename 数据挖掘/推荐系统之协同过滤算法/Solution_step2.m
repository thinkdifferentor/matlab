% 基于item的协同过滤推荐算法MATLAB实现第二步
% 根据item相似矩阵计算得出推荐矩阵
clc,clear;

%载入评分矩阵
A=importdata('Rating_test.mat');

%载入item相似度矩阵
sim=importdata('Sim_matrix.mat');  

%获取用户数和项目数
[usersNum,itemNum] = size(A);  

%定义预测推荐评分矩阵
predict_score = zeros(usersNum,itemNum);  

%开始推荐
for i = 1:usersNum   
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

%预测推荐矩阵数据保存
save('Predict_score.mat','predict_score');