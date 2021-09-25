%按支出分类--加利福尼亚
clear,clc

%载入数据--二维矩阵按列排列。支出顺序依次为工业，运输，商业，焦化厂，总支出 Industry,
%transportation,commerce，coking plant, total, other than
data_CA=cell2mat(struct2cell(load('Pay_CA.mat')));

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
% title('按支出分类--加利福尼亚州内六类数据绘制');
title('Classification by expenditure - California');
legend('industry','transportation','business','coking plant','total','other');
grid on
xlabel('time');
ylabel('MSN');
