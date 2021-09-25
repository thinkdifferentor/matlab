%统计投票结果
clc,clear;

% 数据载入
load('Rating_W.mat');
[c,r]=size(Rating_W);

%统计数组
Count=zeros(r,1);

%开始统计
for i=1:r
    Count(i)=sum(Rating_W(:,i));
end

Count=Count';