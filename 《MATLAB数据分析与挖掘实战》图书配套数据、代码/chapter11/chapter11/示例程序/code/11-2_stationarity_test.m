%% ƽ���Լ���
clear;
% ������ʼ��
discfile = '../data/discdata_processed.xls';
predictnum =5 ;  % ��������5������
index = 3; % D�������������±�

%% ��ȡ����
[num,txt] = xlsread(discfile);
data = num(1:end-5,index); % ȡǰ5������

%% ƽ���Լ��
[h,pvalue ]= adftest(data); 
diffnum = 0; % ��ֵĴ���
while h~=1
    data = diff(data);
   h =  adftest(data);
   diffnum=diffnum+1;
end

%% ��ӡ���
disp(['ƽ���Լ��pֵΪ��' num2str(pvalue) ',' ...
    num2str(diffnum) '�β�ֺ����й���ƽ��']);
disp('ƽ���Լ����ɣ�');