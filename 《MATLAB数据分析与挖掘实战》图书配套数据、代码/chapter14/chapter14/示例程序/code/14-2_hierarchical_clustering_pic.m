%% ��ϵ����ͼ
clear;
% ������ʼ��
standardizedfile='../data/standardized.xls';  % ��׼����������ļ�

%% ��ȡ����
[num,txt] =  xlsread(standardizedfile);

%% ��ϵ����ͼ
Z = linkage(num,'ward','euclidean');
% ����ϵ����ͼ
dendrogram(Z,0);
