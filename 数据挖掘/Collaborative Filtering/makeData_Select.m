%�򵥼���ͶƱ
clc,clear;

%������ϢͶƱ
Data=importdata('Single.mat');%�û��š�ӰƬ��š��ۿ�ʱ��/�㲥���

%��ȡ�û�id�б�
load('Uid');

%���ӰƬ���
load('Mid');

%��ȡ�û���
userNum=length(Uid);

%��ȡ��Ŀ����
itemNum=length(Mid);

%�����Ӱ���û������ֵľ���
Rating_select=zeros(userNum,itemNum);

%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(Data);

%ѭ������������rating����
for i=1:baseNum
	baseLine = Data(i,:);         %ÿһ�����ּ�¼
	line = baseLine(1)-10000;     %�û����
	row = baseLine(2);            %��Ŀ���
	value = baseLine(3);          %�տ�ʱ��
    if(value>=0)                  %ͶƱһ��
        Rating_select(line,row) = Rating_select(line,row)+1;
    end
end

%��rating���󱣴�Ϊ�ļ�
save('Rating_select.mat','Rating_select');

