% 基于item的协同过滤推荐算法MATLAB实现第一步
% 根据用户评分三列数据得出相似矩阵
clear,clc

% 载入三列评分数据
Scores_data=importdata('u1.base');

% 数据预处理--得到用户的评分矩阵--注意编号问题 
% 提取数据的前三列，即用户序号、被该用户评价影片序号、评价分值
[m,n]=size(Scores_data);
test=zeros(m,3);
for i=1:3
    test(:,i)=Scores_data(:,i);
end

% 建立评分矩阵
number_user=max(test(:,1));
number_movies=max(test(:,2));

%评分矩阵943*1682维
score_matrix=zeros(number_user,number_movies);
for i=1:m
    score_matrix(test(i,1),test(i,2))=test(i,3);
end

%定义相似矩阵每两个影片相似度矩阵1642*1642维
Sim_matrix=zeros(number_movies,number_movies);

tic;
%通过评分矩阵计算每两个影片之间的相似度
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_item(score_matrix,i,j);
    end
end
toc;

% 建立相似度矩阵
Sim_matrix=Sim_matrix'+Sim_matrix;%求完整的相似度矩阵(原本矩阵为三角矩阵)
value_1_index=find(Sim_matrix>=0.9999);%找出Sim_matrix矩阵中所有相似度为1的值，
Sim_matrix(value_1_index)=0;%将所有相似度为1的值用0代替-在相似矩阵中与自己相似的物品相似度设为1

%item相似矩阵数据保存
save('Sim_matrix','Sim_matrix.mat');
