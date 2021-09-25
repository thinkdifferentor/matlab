%州际是六类数据是对比绘制-六张图
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为工业，商业，运输，住宅，电力， Industry, commerce,transportation,housing, electric,;
data_TX=cell2mat(struct2cell(load('data_TX.mat')));
data_CA=cell2mat(struct2cell(load('data_CA.mat')));
data_NM=cell2mat(struct2cell(load('data_NM.mat')));
data_AZ=cell2mat(struct2cell(load('data_AZ.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
G_TX=data_TX(:,1);
G_CA=data_CA(:,1);
G_NM=data_NM(:,1);
G_AZ=data_AZ(:,1);
figure,
plot(t,G_TX,t,G_CA,t,G_NM,t,G_AZ);
title('Industry')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('Industry');

S_TX=data_TX(:,2);
S_CA=data_CA(:,2);
S_NM=data_NM(:,2);
S_AZ=data_AZ(:,2);
figure,
plot(t,S_TX,t,S_CA,t,S_NM,t,S_AZ);
title('business')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('business');

Y_TX=data_TX(:,3);
Y_CA=data_CA(:,3);
Y_NM=data_NM(:,3);
Y_AZ=data_AZ(:,3);
figure,
plot(t,Y_TX,t,Y_CA,t,Y_NM,t,Y_AZ);
title('transportation')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('transportation');

Z_TX=data_TX(:,4);
Z_CA=data_CA(:,4);
Z_NM=data_NM(:,4);
Z_AZ=data_AZ(:,4);
figure,
plot(t,Z_TX,t,Z_CA,t,Z_NM,t,Z_AZ);
title('housing')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('housing');

D_TX=data_TX(:,5);
D_CA=data_CA(:,5);
D_NM=data_NM(:,5);
D_AZ=data_AZ(:,5);
figure,
plot(t,D_TX,t,D_CA,t,D_NM,t,D_AZ);
title('electric')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('electric');







