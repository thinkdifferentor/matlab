%��ȡ���־���
clear;clc; 

%��ȡѵ�������û�id��Ƶ��id�����֣�
load('Score');

%��ȡ�û�id�б�
load('Users_End');

%��ȡƵ��id�б�
load('Channel_Num_End');

%��ȡ�û���
[userNum,v]=size(Users_End);

%��ȡƵ���б�
[itemNum,v]=size(Channel_Num_End);

%�����Ӱ���û������ֵľ���
rating =zeros(userNum,itemNum);

%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(Score);

%ѭ������������rating����
for i=1:baseNum
	baseLine = Score(i,:);        %ÿһ�����ּ�¼
	line = baseLine(1)-10000;     %�û�
	row = baseLine(2)-10000;      %Ƶ��
	value = baseLine(3);          %�û�����    
	rating(line,row) = value;
end

%��rating���󱣴�Ϊ�ļ�
save('Rating.mat','Rating');

