%% �����ݷ�Ϊ�����֣�ѵ�����ݡ���������
clear;
% ������ʼ��
datafile = '../data/moment.xls'; % �����ļ�
trainfile = '../tmp/train_moment.xls' ; % ѵ�������ļ�
testfile = '../tmp/test_moment.xls' ; % ���������ļ�
proportion =0.8 ;  % ����ѵ�����ݱ���

%% ���ݷָ�
[num,txt]= xlsread(datafile);
% split2train_test Ϊ�Զ��庯������num�������ݣ����зֲ�����Ϊ������
% ����ѵ�����ݼ�ռ��proportion
[train,test] = split2train_test(num,proportion);

%% ���ݴ洢
xlswrite(trainfile,[txt;num2cell(train)]); % д��ѵ������
xlswrite(testfile,[txt;num2cell(test)]); % д���������
disp('���ݷָ���ɣ�');