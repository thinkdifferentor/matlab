%通过用户的ID获取对各个电影的评分向量

function [ oneLine ] = getScore( id )

%用户号、影片编号、观看时间/点播金额
data=importdata('Single.mat');

%查找到输入用户的id的对电影的所有评分，用户id，电影ID，评分的矩阵
oneTest = data(data(:,1)==id,:);

%获取影片数
Mid = importdata('Mid.mat');
oneLine = zeros(1,length(Mid));

% 给电影向量赋值 
[oneTestNum,v] = size(oneTest);
for n=1:oneTestNum
    oneTestLine = oneTest(n,:);
    oneLine(oneTestLine(2)) = oneTestLine(3);
end

end

