%按支出分类--德克萨斯州
clear,clc

%载入数据--二维矩阵按列排列。支出顺序依次为工业，运输，商业，焦化厂，总支出,其他 Industry,
%transportation,commerce，coking plant, total, other than
% data_TX=struct2cell(load('Pay_TX.mat'));
data_TX=cell2mat(struct2cell(load('Pay_TX.mat')));



%时间矩阵
t=1970:2009;

%州内六类数据绘制
G=data_TX(:,1);
Y=data_TX(:,2);
S=data_TX(:,3);
J=data_TX(:,4);
T=data_TX(:,5);
O=data_TX(:,6);

plot(t,G,t,Y,t,S,t,J,t,T,t,O);
% title('按支出分类--加利福尼亚州内六类数据绘制')
title('Classification by expenditure - Texas');
legend('industry','transportation','business','coking plant','total','other');
grid on
xlabel('time');
ylabel('MSN');

