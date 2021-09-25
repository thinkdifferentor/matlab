%按价格分类--新墨西哥
clear,clc

%载入数据--二维矩阵按列排列。支出顺序依次为电力，进出口，商业，煤炭平均，所有平均，其他
% electricity, import and export, business, coal, all the average, other
data_NM=cell2mat(struct2cell(load('Price_NM.mat')));

%时间矩阵
t=1970:2009;

%州内六类数据绘制
G=data_NM(:,1);
Y=data_NM(:,2);
S=data_NM(:,3);
J=data_NM(:,4);
T=data_NM(:,5);
O=data_NM(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('按价格分类--新墨西哥州内六类数据绘制')
title('Classification by price - New Mexico');
legend('electricity','import and export','business','coal','all the average','other');
grid on
xlabel('time');
ylabel('MSN');


