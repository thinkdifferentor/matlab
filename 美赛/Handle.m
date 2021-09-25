%相隔年数
years=50;

%数据导入
data=cell2mat(struct2cell(load('matlab.mat')));

%参数个数
num=length(data);

%数据相加结果矩阵
% sum=zeros(years,1);

% %数据相加结果
% for i=1:years
%    for j=i:years:num
%         sum(i,1)=sum(i,1)+data(j,1);
%    end
% end

%只取09年数据
sum=0;
for i=50:years:num
    sum=sum+data(i,1);
end
