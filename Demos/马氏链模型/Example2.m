clc;
clear;

format rat

% һ���ж�����������ʱ��...����
a=[4 3 2 1 4 3 1 1 2 3 ...
2 1 2 3 4 4 3 3 1 1 ...
1 3 3 2 1 2 2 2 4 4 ...
2 3 2 3 1 1 2 4 3 1];

% ����ͳ��
for i=1:4
    for j=1:4
        f(i,j)=length(findstr([i j],a));
    end
end

f

% ��ÿһ���������
ni=(sum(f'))';

% ��������
for i=1:4
    p(i,:)=f(i,:)/ni(i);
end
p