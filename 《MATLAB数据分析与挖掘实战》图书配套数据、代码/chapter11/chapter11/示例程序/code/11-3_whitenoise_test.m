%% ����������
clear;
% ������ʼ��
discfile = '../data/discdata_processed.xls';
predictnum =5 ;  % ��������5������
index = 3; % D�������������±�

%% ��ȡ����
[num,txt] = xlsread(discfile);
data = num(1:end-5,index); % ȡǰ5������

%% ���������
[h,pvalue ]= lbqtest(data); 

%% ��ӡ���
disp(['���������pֵΪ��' num2str(pvalue)]);
if h==1
    disp('��ʱ������Ϊ�ǰ���������');
else
    disp('��ʱ������Ϊ����������');
end
disp('�����������ɣ�');