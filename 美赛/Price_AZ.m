%���۸����--����ɣ����
clear,clc

%��������--��ά���������С�֧��˳������Ϊ�����������ڣ���ҵ��ú̿ƽ��������ƽ��������
% electricity, import and export, business, coal, all the average, other
data_AZ=cell2mat(struct2cell(load('Pay_AZ.mat')));

%ʱ�����
t=1970:2009;

%�����������ݻ���
G=data_AZ(:,1);
Y=data_AZ(:,2);
S=data_AZ(:,3);
J=data_AZ(:,4);
T=data_AZ(:,5);
O=data_AZ(:,6);


plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('���۸����--����ɣ�������������ݻ���')
title('Classification by price - Arizona');
legend('electricity','import and export','business','coal','all the average','other');
grid on
xlabel('time');
ylabel('MSN');