%% ���������Թ���
clear;
%��ʼ������
inputfile= '../data/electricity_data.xls';       % ���빩����������
outputfile = '../tmp/electricity_data.xls';  % ���Թ���������ļ�

%% ��ȡ����
[num,txt,raw]=xlsread(inputfile);                   % ���ݵ�һ��Ϊ����������ڶ���Ϊ��������
[rows,cols] = size(num);

%% ��������
loss = (num(:,1)-num(:,2))./num(:,1);

%% ������
result = cell(rows+1,cols+1);
result(:,1:cols) =raw;
result{1,cols+1} = '������';
result(2:end,cols+1) = num2cell(loss);
xlswrite(outputfile,result);
disp('���������Թ�����ϣ�');
