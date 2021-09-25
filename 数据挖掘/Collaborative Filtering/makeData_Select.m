%简单计数投票
clc,clear;

%收视信息投票
Data=importdata('Single.mat');%用户号、影片编号、观看时间/点播金额

%读取用户id列表
load('Uid');

%入读影片编号
load('Mid');

%获取用户数
userNum=length(Uid);

%获取节目数量
itemNum=length(Mid);

%定义电影，用户，评分的矩阵。
Rating_select=zeros(userNum,itemNum);

%获取评分的数目，然后循环
[baseNum,v] = size(Data);

%循环将评分塞入rating矩阵
for i=1:baseNum
	baseLine = Data(i,:);         %每一条评分记录
	line = baseLine(1)-10000;     %用户编号
	row = baseLine(2);            %节目编号
	value = baseLine(3);          %收看时间
    if(value>=0)                  %投票一次
        Rating_select(line,row) = Rating_select(line,row)+1;
    end
end

%将rating矩阵保存为文件
save('Rating_select.mat','Rating_select');

