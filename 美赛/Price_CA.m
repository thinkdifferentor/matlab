%按价格分类--加利福尼亚
clear,clc

%载入数据--二维矩阵按列排列。支出顺序依次为电力，进出口，商业，煤炭平均，所有平均，其他
% electricity, import and export, business, coal, all the average, other
data_CA=cell2mat(struct2cell(load('Price_CA.mat')));

%时间矩阵
t=1970:2009;

%州内六类数据绘制
G=data_CA(:,1);
Y=data_CA(:,2);
S=data_CA(:,3);
J=data_CA(:,4);
T=data_CA(:,5);
O=data_CA(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('按价格分类--加利福尼亚州内六类数据绘制')
title('Classification by price - California');
legend('electricity','import and export','business','coal','all the average','other');
grid on
xlabel('time');
ylabel('MSN');

