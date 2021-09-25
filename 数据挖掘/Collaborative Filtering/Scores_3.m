%�򵥼���ͶƱ
clc,clear;

%������ϢͶƱ
Data=importdata('Single_select.mat');%�û��š�ӰƬ��š��ۿ�ʱ��/�㲥���

%��ȡ�û�id�б�
load('Uid');

%��ȡ�û���
[userNum,v]=size(Uid);

%��ȡƵ���б�(���ںܶ�û�õ���)
itemNum=length(Data(1));

%�����Ӱ���û������ֵľ���
Rating_W =zeros(userNum,itemNum);

%��ȡ���ֵ���Ŀ��Ȼ��ѭ��
[baseNum,v] = size(Data);

%ѭ������������rating����
for i=1:baseNum
	baseLine = Data(i,:);         %ÿһ�����ּ�¼
	line = baseLine(1)-10000;     %�û�
	row = baseLine(2);            %Ƶ��
	value = baseLine(3);          %�տ�ʱ��
    if(value>=0.1&&value<=12)     %ͶƱһ��
        Rating_W(line,row) = Rating_W(line,row)+1;
    end
end

%��rating���󱣴�Ϊ�ļ�
save('Rating_W.mat','Rating_W');




