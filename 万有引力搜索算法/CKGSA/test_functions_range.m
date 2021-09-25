% This function gives boundaries and dimension of search space for test functions.
% ������������˲��Ժ����������ռ�ı߽��ά����

function [down,up,dim]=test_functions_range(F_index)

%If lower bounds of dimensions are the same, then 'down' is a value.
%Otherwise, 'down' is a vector that shows the lower bound of each dimension.
%This is also true for upper bounds of dimensions.
% ��������Ķ������ÿһ��������������ͬ��down����һ����ֵ�����������ͬ���򷵻�һ�������������Ͻ�upҲһ��

% Ĭ��ά�� 30
dim=30;

if F_index==1 % Rosenbrock Function
    down=-30;up=30;
end
