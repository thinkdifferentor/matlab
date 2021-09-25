% 数据整理
clc,clear;

% 推荐指数数据载入
% Recommend=importdata('Recommend.mat');

% 推荐影片数据载入
Predict=importdata('Predict.mat');
n=length(Predict);

film=[];
for i=1:n
   temp=Predict{i};
   film=[film;temp];
end


