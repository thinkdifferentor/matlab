%% �������ݱ�׼��
clear ;
% ������ʼ��
inputfile = '../data/cluster_data.xls';
outputfile = '../tmp/cluster_data.xls';

%% ��ȡ����
[num,txt,raw] = xlsread(inputfile);

%% ���ݱ�׼��
data = num(:,2:end);
data_ = zscore(data);

%% �������
raw_ = raw;
raw_(2:end,2:end) = num2cell(data_);

%% ���
xlswrite(outputfile,raw_);
disp(['��׼������ļ���д�롰' outputfile '����']);