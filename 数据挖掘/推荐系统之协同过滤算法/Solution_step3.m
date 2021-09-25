% 基于item的协同过滤推荐算法MATLAB实现第三步
% 根据推荐矩阵中每个用户的推荐系数排序并输出推荐结果
clc,clear;

% 载入推荐矩阵
Predict_score=importdata('Predict_score.mat');

%确认最大推荐影片数目
top=10;

% 获取用户数和影片数
[usersNum,itemNum] = size(Predict_score);

% 定义影片推荐矩阵
Predict={};

% 记录推荐指数
Recommend=[];

% 开始查询推荐
for i=1:usersNum
    [Recommend(i,:),index]=Top_N(Predict_score(i,:),top);
    Predict{i}=Find(index);
end


%数据存储
save('Recommend.mat','Recommend');
save('Predict.mat','Predict');
