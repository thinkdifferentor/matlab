%% ��ξ����㷨
clear;
% ������ʼ��
xlabels={'�������˾�ͣ��ʱ��','�賿�˾�ͣ��ʱ��'...
    '��ĩ�˾�ͣ��ʱ��','�վ�������'};           % x������
type=3;                                       % ��Ⱥ�����
standardizedfile='../data/standardized.xls';  % ��׼����������ļ�

%% ��ȡ����
[num,txt] =  xlsread(standardizedfile);

%% ��ξ���
Z = linkage(num,'ward','euclidean'); 
typeindex = cluster(Z,'maxclust',type);

 %% ���ÿ��Ⱥ�黭ͼ
for i=1:type
    data=num(typeindex==i,:);
    plotrows(data,i,xlabels);
end
