%% Apriori���������㷨
clear;
% ������ʼ��
inputfile = '../data/apriori.txt';% ���������ļ�
outputfile='../tmp/as.txt';% ���ת����0,1�����ļ�
minSup = 0.06; % ��С֧�ֶ�
minConf = 0.75;% ��С���Ŷ�
nRules = 1000;% �����������
sortFlag = 1;% ����֧�ֶ�����
rulefile = '../tmp/rules.txt'; % ��������ļ�

%% ����ת������ ��������ת��Ϊ0,1�����Զ��庯��
[transactions,code] = trans2matrix(inputfile,outputfile,','); 

%% ����Apriori���������㷨���Զ��庯��
[Rules,FreqItemsets] = findRules(transactions, minSup, minConf, nRules, sortFlag, code, rulefile);
disp('Apriori�㷨������ɣ�');
