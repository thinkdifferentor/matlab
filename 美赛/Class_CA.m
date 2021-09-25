%按消耗分类--加利福尼亚(CA)
clear,clc

%载入数据--二维矩阵按列排列。顺序依次为工业，商业，运输，住宅，电力，焦化厂
class_CA=cell2mat(struct2cell(load('class_CA.mat')));

%时间矩阵
t=1960:2009;

%州内六类数据绘制
K=class_CA(:,1);
B=class_CA(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
plot(t,a,t,b);
% title('按消耗分类--德克萨斯州内六类数据绘制')
title('Classification by energy type - California');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');
