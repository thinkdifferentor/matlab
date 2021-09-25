% This function gives boundaries and dimension of search space for test functions.
% 这个函数给出了测试函数的搜索空间的边界和维数。

function [down,up,dim]=test_functions_range(F_index)

%If lower bounds of dimensions are the same, then 'down' is a value.
%Otherwise, 'down' is a vector that shows the lower bound of each dimension.
%This is also true for upper bounds of dimensions.
% 如果函数的定义域的每一个分量的下限相同，down就是一个数值，如果分量不同，则返回一个向量，对于上界up也一样

% 默认维数 30
dim=30;

if F_index==1 % Rosenbrock Function
    down=-30;up=30;
end
