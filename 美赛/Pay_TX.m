%��֧������--�¿���˹��
clear,clc

%��������--��ά���������С�֧��˳������Ϊ��ҵ�����䣬��ҵ������������֧��,���� Industry,
%transportation,commerce��coking plant, total, other than
% data_TX=struct2cell(load('Pay_TX.mat'));
data_TX=cell2mat(struct2cell(load('Pay_TX.mat')));



%ʱ�����
t=1970:2009;

%�����������ݻ���
G=data_TX(:,1);
Y=data_TX(:,2);
S=data_TX(:,3);
J=data_TX(:,4);
T=data_TX(:,5);
O=data_TX(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('��֧������--���������������������ݻ���')
title('Classification by expenditure - Texas');
legend('industry','transportation','business','coking plant','total','other');
grid on
xlabel('time');
ylabel('MSN');

