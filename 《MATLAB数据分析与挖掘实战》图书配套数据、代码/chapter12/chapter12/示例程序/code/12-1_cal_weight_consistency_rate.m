%% ����Ȩֵ��һ���Լ�����
clear;
% ������ʼ��
inputfile ='../data/paired_comparision.xls';
Ri=[0	0	0.58	0.90	1.12	1.24	1.32	1.41	1.45	1.49	1.51];% Ri �ο�����
outputfile = '../tmp/paired-comparision.xls'; % ����ļ�

%% ��ȡ����
[num,txt]=xlsread(inputfile,1);
[rows,cols]=size(num);

%% ����Ȩֵ�����һ���Ա���
%�����������ڻ�
prodvalue=prod(num,2);
% ��rows�η�
rootvalue=power(prodvalue,1/rows);
sumrootvalue=sum(rootvalue);
wi =rootvalue/sumrootvalue; % Ȩֵ
awi=num*wi;
awi_wi=awi./wi; 
Ci=(mean(awi_wi)-rows)/(rows-1);
consistencyrate=Ci/Ri(rows);

%% ����д��
txt(2:end,2:end) = num2cell(num);
txt(1,cols+2:cols+3) = {'Ȩ��','CR'};
txt(2:end,cols+2) = num2cell(wi);
txt{2,cols+3}= consistencyrate;
xlswrite(outputfile,txt);
disp('���һ���Ա��ʼ�����ɣ�');