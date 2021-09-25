%% ģ�ͼ���
clear;
% ������ʼ��
p=0;
D=1;
q=1;
filename = '../data/discdata_processed.xls';
index = 3; % D�������������±�
lagnum =12 ; % �в��ӳٸ���

%% ��ȡ����
[num,txt] = xlsread(filename);
data = num(1:end-5,index); % ȡǰ5������
T = size(data,1);

%% ԭʼ����ģ��
% ����ģ��
mod = arima(p,D,q);
[EstMdl,param,logL] = estimate(mod,data,'print',false);
% ����в�
res = infer(EstMdl,data);
stdRes = res/sqrt(EstMdl.Variance); % ��׼���в�
% ����������
[h,pValue] = lbqtest(stdRes,'lags',1:lagnum);
% ���㲻���ϰ���������ĸ���
hsum = sum(h);

%% ��ӡ���
if hsum~=0
    disp(['ģ��arima(' num2str(p) ',' num2str(D) ',' ...
        num2str(q) ')' '�����ϰ���������!']);
else
    disp(['ģ��arima(' num2str(p) ',' num2str(D) ',' ...
        num2str(q) ')' '���ϰ���������!']);
end
disp('ģ�ͼ�����ɣ�');
