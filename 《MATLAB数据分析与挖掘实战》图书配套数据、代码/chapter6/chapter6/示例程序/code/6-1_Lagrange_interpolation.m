%% �������ղ�ֵ�㷨
clear;
% ������ʼ��
inputfile='../data/missing_data.xls';   % ��������·��,��Ҫʹ��Excel��ʽ��
outputfile='../tmp/missing_data_processed.xls';            %�������·��,��Ҫʹ��Excel��ʽ

%% �������ղ�ֵ
% �����ļ�
data=xlsread(inputfile);
[rows,cols]=size(data);

% ����ÿ�н��в�ֵ����
% ����ployinterp_columnΪ�Զ��庯����������������в�ֵ
for j=1:cols
   data(:,j)=ployinterp_column(data(:,j)); 
end

%% д���ļ�
xlswrite(outputfile,data);
