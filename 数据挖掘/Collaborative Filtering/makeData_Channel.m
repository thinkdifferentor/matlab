%获取评分矩阵
clear;clc; 

%读取训练集（用户id，频道id，评分）
load('Score');

%读取用户id列表
load('Users_End');

%读取频道id列表
load('Channel_Num_End');

%获取用户数
[userNum,v]=size(Users_End);

%获取频道列表
[itemNum,v]=size(Channel_Num_End);

%定义电影，用户，评分的矩阵。
rating =zeros(userNum,itemNum);

%获取评分的数目，然后循环
[baseNum,v] = size(Score);

%循环将评分塞入rating矩阵
for i=1:baseNum
	baseLine = Score(i,:);        %每一条评分记录
	line = baseLine(1)-10000;     %用户
	row = baseLine(2)-10000;      %频道
	value = baseLine(3);          %用户评分    
	rating(line,row) = value;
end

%将rating矩阵保存为文件
save('Rating.mat','Rating');

