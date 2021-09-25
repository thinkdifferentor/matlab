%简单计数投票
clc,clear;

%回看信息投票
Data=importdata('Data_Back.txt');%用户号、频道号、收视时间

%读取用户id列表
load('Uid');

%读取频道id列表
load('Channel_Num_End');

%获取用户数
[userNum,v]=size(Uid);

%获取频道列表(存在很多没用的列)
itemNum=max(Channel_Num_End);

%定义电影，用户，评分的矩阵。
Rating_B =zeros(userNum,itemNum);

%获取评分的数目，然后循环
[baseNum,v] = size(Data);

%循环将评分塞入rating矩阵
for i=1:baseNum
	baseLine = Data(i,:);    %每一条评分记录
	line = baseLine(1)-10000;     %用户
	row = baseLine(2);            %频道
    if(row==0)
        continue;
    end
	value = baseLine(3);          %收看时间
    if(value>=0.1&&value<=2)      %投票一次
        Rating_B(line,row)=Rating_B(line,row)+1;
    end
end

%将rating矩阵保存为文件
save('Rating_B.mat','Rating_B');

