%简单计数投票
clc,clear;

%收视信息投票
Data=importdata('Data_test_2.txt');%用户号、频道号、收视时间

%读取用户id列表
load('Uid');

%获取用户数
[userNum,v]=size(Uid);

%获取频道列表(存在很多没用的列)
itemNum=707;

%定义电影，用户，评分的矩阵。
Rating_Test =zeros(userNum,itemNum);

%获取评分的数目，然后循环
[baseNum,v] = size(Data);

%循环将评分塞入rating矩阵
for i=1:baseNum
	baseLine = Data(i,:);         %每一条评分记录
	line = baseLine(1)-10000;     %用户
	row = baseLine(2);            %频道
    Rating_Test(line,row) = Rating_Test(line,row)+1;
end

%将rating矩阵保存为文件
save('Rating_Test.mat','Rating_Test');




