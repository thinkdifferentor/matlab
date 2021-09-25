%按消耗分类--德克萨斯州
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为工业，商业，运输，住宅，电力，焦化厂
class_TX=cell2mat(struct2cell(load('class_TX.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
K=class_TX(:,1);
B=class_TX(:,2);
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


