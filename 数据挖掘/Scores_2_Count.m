%统计回看投票结果
clc,clear;

% 数据载入
load('Rating_B.mat');
[c,r]=size(Rating_B);

%统计数组
Count=zeros(r,1);

%开始统计
for i=1:r
    Count(i)=sum(Rating_B(:,i));
end

Count=Count';