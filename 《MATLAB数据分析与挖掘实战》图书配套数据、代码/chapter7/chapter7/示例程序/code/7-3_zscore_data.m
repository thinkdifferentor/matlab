%% ��׼���׼��
clear;
% ������ʼ��
datafile = '../data/zscoredata.xls';  % ��Ҫ���б�׼���������ļ���
zscoredfile = '../tmp/zscoreddata.xls'; % ��׼�������ݴ洢·���ļ���

%% ��׼������
[data,txt]=xlsread(datafile);  
zscoredata = zscore(data) ;  % ����zscore����ΪMATLAB���õı�׼������

%% ����д��
xlswrite(zscoredfile,[txt;num2cell(zscoredata)]);