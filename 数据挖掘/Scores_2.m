%�򵥼���ͶƱ
clc,clear;

%�ؿ���ϢͶƱ
Data=importdata('Data_Back.txt');%�û��š�Ƶ���š�����ʱ��

%��ȡ�û�id�б�
load('Uid');

%��ȡƵ��id�б�
load('Channel_Num_End');

%��ȡ�û���
[userNum,v]=size(Uid);

%��ȡƵ���б�(���ںܶ�û�õ���)
itemNum=max(Channel_Num_End);

%�����Ӱ���û������ֵľ���
Rating_B =zeros(userNum,itemNum);

%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(Data);

%ѭ������������rating����
for i=1:baseNum
	baseLine = Data(i,:);    %ÿһ�����ּ�¼
	line = baseLine(1)-10000;     %�û�
	row = baseLine(2);            %Ƶ��
    if(row==0)
        continue;
    end
	value = baseLine(3);          %�տ�ʱ��
    if(value>=0.1&&value<=2)      %ͶƱһ��
        Rating_B(line,row)=Rating_B(line,row)+1;
    end
end

%��rating���󱣴�Ϊ�ļ�
save('Rating_B.mat','Rating_B');

