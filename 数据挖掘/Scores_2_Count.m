%ͳ�ƻؿ�ͶƱ���
clc,clear;

% ��������
load('Rating_B.mat');
[c,r]=size(Rating_B);

%ͳ������
Count=zeros(r,1);

%��ʼͳ��
for i=1:r
    Count(i)=sum(Rating_B(:,i));
end

Count=Count';