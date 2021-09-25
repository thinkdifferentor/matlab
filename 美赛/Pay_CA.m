%��֧������--����������
clear,clc

%��������--��ά���������С�֧��˳������Ϊ��ҵ�����䣬��ҵ������������֧�� Industry,
%transportation,commerce��coking plant, total, other than
data_CA=cell2mat(struct2cell(load('Pay_CA.mat')));

%ʱ�����
t=1970:2009;

%�����������ݻ���
G=data_CA(:,1);
Y=data_CA(:,2);
S=data_CA(:,3);
J=data_CA(:,4);
T=data_CA(:,5);
O=data_CA(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('��֧������--���������������������ݻ���');
title('Classification by expenditure - California');
legend('industry','transportation','business','coking plant','total','other');
grid on
xlabel('time');
ylabel('MSN');
