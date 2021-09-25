%按消耗分类--亚利桑那州(AZ)
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为可再生，不可再生能源 renewable energy non-renewable energy
class_AZ=cell2mat(struct2cell(load('class_AZ.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
K=class_AZ(:,1);
B=class_AZ(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
plot(t,a,t,b);
% title('按消耗分类--德克萨斯州内六类数据绘制')
title('Classification by energy type - Arizona');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');