%ͳ��ͶƱ���
clc,clear;

% ��������
load('Rating_W.mat');
[c,r]=size(Rating_W);

%ͳ������
Count=zeros(r,1);

%��ʼͳ��
for i=1:r
    Count(i)=sum(Rating_W(:,i));
end

Count=Count';