%���۸����--����������
clear,clc

%��������--��ά���������С�֧��˳������Ϊ�����������ڣ���ҵ��ú̿ƽ��������ƽ��������
% electricity, import and export, business, coal, all the average, other
data_CA=cell2mat(struct2cell(load('Price_CA.mat')));

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
% title('���۸����--���������������������ݻ���')
title('Classification by price - California');
legend('electricity','import and export','business','coal','all the average','other');
grid on
xlabel('time');
ylabel('MSN');

