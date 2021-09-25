%% �������ղ�ֵ��ţ�ٲ�ֵ�Ա�
clear;
% ������ʼ��
inputfile = '../data/catering_sale.xls' ; % ���������ļ�
index =1; % �������������±�
outputfile ='../tmp/sales.xls';  % ��ֵ�����ݴ��

%% ��������
[num,txt,raw] = xlsread(inputfile);
data = num(:,index);

%% ȥ���쳣ֵ
data = de_abnormal(data);

%% �����������ս��в�ֵ
la_data = ployinterp_column(data,'lagrange');

%% ����ţ������в�ֵ
new_data = ployinterp_column(data,'newton');

%% ���д���ļ�
rows = size(data,1);
result = cell(rows+1,3);
result{1,1}='ԭʼֵ';
result{1,2}='�������ղ�ֵ';
result{1,3}='ţ�ٲ�ֵ';

result(2:end,1)= num2cell(data);
result(2:end,2)= num2cell(la_data);
result(2:end,3)= num2cell(new_data);
xlswrite(outputfile,result);
disp('�������ղ�ֵ��ţ�ٲ�ֵ�����д�������ļ���');