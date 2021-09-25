clc;
clear;

format rat

% 一行有多列数据输入时用...连接
a=[4 3 2 1 4 3 1 1 2 3 ...
2 1 2 3 4 4 3 3 1 1 ...
1 3 3 2 1 2 2 2 4 4 ...
2 3 2 3 1 1 2 4 3 1];

% 数据统计
for i=1:4
    for j=1:4
        f(i,j)=length(findstr([i j],a));
    end
end

f

% 对每一行数据求和
ni=(sum(f'))';

% 比例计算
for i=1:4
    p(i,:)=f(i,:)/ni(i);
end
p