%按支出分类--亚利桑那州
clear,clc

%载入数据--二维矩阵按列排列。支出顺序依次为工业，运输，商业，焦化厂，总支出,其他 industry,
%transportation,business，coking plant, total, other than
data_AZ=cell2mat(struct2cell(load('Pay_AZ.mat')));

%时间矩阵
t=1970:2009;

%州内六类数据绘制
G=data_AZ(:,1);
Y=data_AZ(:,2);
S=data_AZ(:,3);
J=data_AZ(:,4);
T=data_AZ(:,5);
O=data_AZ(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('按支出分类--亚利桑那州内六类数据绘制');
title('Classification by expenditure - Arizona');
legend('industry','transportation','business','coking plant','total','other');
grid on
xlabel('time');
ylabel('MSN');