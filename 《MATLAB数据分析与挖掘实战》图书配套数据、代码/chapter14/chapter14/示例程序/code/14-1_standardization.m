%% ���ݱ�׼����[0,1]
clear;
% ������ʼ��
filename='../data/business_circle.xls';       % �����ļ�
standardizedfile='../tmp/standardized.xls';  % ��׼����������ļ�

%% ��ȡ����
[num,txt] =  xlsread(filename);
data = num(:,2:end); % ��ȡ��Ҫ����ת��������

%% ���ݱ�׼��
data = data'; % ����ת�ã�������Ҫ����mapminmax����Ҫ��
[ydata,ps] = mapminmax(data,0,1); % ��׼����[0,1]
ydata = ydata';

%% ��׼��������д���ļ�
xlswrite(standardizedfile, ydata);
disp('��������׼����ɣ�');