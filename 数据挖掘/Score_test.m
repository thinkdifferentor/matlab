%�򵥼���ͶƱ
clc,clear;

%������ϢͶƱ
Data=importdata('Data_test_2.txt');%�û��š�Ƶ���š�����ʱ��

%��ȡ�û�id�б�
load('Uid');

%��ȡ�û���
[userNum,v]=size(Uid);

%��ȡƵ���б�(���ںܶ�û�õ���)
itemNum=707;

%�����Ӱ���û������ֵľ���
Rating_Test =zeros(userNum,itemNum);

%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(Data);

%ѭ������������rating����
for i=1:baseNum
	baseLine = Data(i,:);         %ÿһ�����ּ�¼
	line = baseLine(1)-10000;     %�û�
	row = baseLine(2);            %Ƶ��
    Rating_Test(line,row) = Rating_Test(line,row)+1;
end

%��rating���󱣴�Ϊ�ļ�
save('Rating_Test.mat','Rating_Test');




