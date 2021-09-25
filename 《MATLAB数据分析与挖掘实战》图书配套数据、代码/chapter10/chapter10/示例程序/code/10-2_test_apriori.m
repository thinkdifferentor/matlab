%% �������������Ƽ� Apriori���������ھ�
clear;
% ������ʼ��
inputfile = '../data/visit_data.xls';
preprocessedfile = '../tmp/visit_data.txt';
outputfile='../tmp/as.txt';% ���ת����0,1�����ļ�
rulefile = '../tmp/rules.txt'; % ��������ļ�
minSup = 0.01; % ��С֧�ֶ�
minConf = 0.70;% ��С���Ŷ�
nRules = 1000;% �����������
sortFlag = 1;% ����֧�ֶ�����
separator = ','; % �ָ���

%% ����Ԥ��������sessionID�Է������ݽ��оۺ�
preprocess_apriori(inputfile,preprocessedfile,separator);

%% ���ݱ���
[transactions,code] = trans2matrix(preprocessedfile,outputfile,separator); 

%% ����Apriori���������㷨
[Rules,FreqItemsets] = findRules(transactions, minSup, minConf, nRules, sortFlag, code, rulefile);
disp('Apriori���������㷨������ɣ�');
