%% ����������������Է���
clear;
% ��ʼ������
catering_sale = '../data/catering_sale_all.xls'; % �������ݣ�������������
index = 1; % �������������� 

%% ��������
[num,txt] = xlsread(catering_sale);

%% ����Է���
corr_ = corr(num);
%% ��ӡ���
rows = size(corr_,1);
for i=2:rows
    disp(['"' txt{1,2} '"��"' txt{1,1+i} '"�����ϵ��Ϊ��' num2str(corr_(i,1))]);
end
disp('������Ʒ����������Է�����ɣ�');