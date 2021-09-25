%���۸����--��ī����
clear,clc

%��������--��ά���������С�֧��˳������Ϊ�����������ڣ���ҵ��ú̿ƽ��������ƽ��������
% electricity, import and export, business, coal, all the average, other
data_NM=cell2mat(struct2cell(load('Price_NM.mat')));

%ʱ�����
t=1970:2009;

%�����������ݻ���
G=data_NM(:,1);
Y=data_NM(:,2);
S=data_NM(:,3);
J=data_NM(:,4);
T=data_NM(:,5);
O=data_NM(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('���۸����--��ī���������������ݻ���')
title('Classification by price - New Mexico');
legend('electricity','import and export','business','coal','all the average','other');
grid on
xlabel('time');
ylabel('MSN');


