%州际可再生能源，不可再生能源对比--两张图
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为工业，商业，运输，住宅，电力， Industry, commerce,transportation,housing, electric,;
data_TX=cell2mat(struct2cell(load('class_TX.mat')));
data_CA=cell2mat(struct2cell(load('class_CA.mat')));
data_NM=cell2mat(struct2cell(load('class_NM.mat')));
data_AZ=cell2mat(struct2cell(load('class_AZ.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
G_TX=data_TX(:,1);
G_CA=data_CA(:,1);
G_NM=data_NM(:,1);
G_AZ=data_AZ(:,1);
n=length(G_TX);
a=zeros(n,1);
b=zeros(n,1);
c=zeros(n,1);
d=zeros(n,1);
for i=1:n
    a(i,1)=G_TX(i,1)/(G_TX(i,1)+G_CA(i,1)+G_NM(i,1)+G_AZ(i,1));
    b(i,1)=G_CA(i,1)/(G_TX(i,1)+G_CA(i,1)+G_NM(i,1)+G_AZ(i,1));
    c(i,1)=G_NM(i,1)/(G_TX(i,1)+G_CA(i,1)+G_NM(i,1)+G_AZ(i,1));
    d(i,1)=G_AZ(i,1)/(G_TX(i,1)+G_CA(i,1)+G_NM(i,1)+G_AZ(i,1));
end
figure,
plot(t,a,t,b,t,c,t,d);
title('renewable energy')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('renewable energy rate');

S_TX=data_TX(:,2);
S_CA=data_CA(:,2);
S_NM=data_NM(:,2);
S_AZ=data_AZ(:,2);
for i=1:n
    a(i,1)=S_TX(i,1)/(S_TX(i,1)+S_CA(i,1)+S_NM(i,1)+S_AZ(i,1));
    b(i,1)=S_CA(i,1)/(S_TX(i,1)+S_CA(i,1)+S_NM(i,1)+S_AZ(i,1));
    c(i,1)=S_NM(i,1)/(S_TX(i,1)+S_CA(i,1)+S_NM(i,1)+S_AZ(i,1));
    d(i,1)=S_AZ(i,1)/(S_TX(i,1)+S_CA(i,1)+S_NM(i,1)+S_AZ(i,1));
end
figure,
plot(t,a,t,b,t,c,t,d);
title('non-renewable energy')
legend('Texas','California','New Mexico','Arizona');
grid on
xlabel('time');
ylabel('non-renewable energy rate');


