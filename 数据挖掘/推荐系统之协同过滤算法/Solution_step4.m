% ��������
clc,clear;

% �Ƽ�ָ����������
% Recommend=importdata('Recommend.mat');

% �Ƽ�ӰƬ��������
Predict=importdata('Predict.mat');
n=length(Predict);

film=[];
for i=1:n
   temp=Predict{i};
   film=[film;temp];
end


