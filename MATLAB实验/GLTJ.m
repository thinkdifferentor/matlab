%概率统计
clear,clc

data=[11 57 291;13 54 278; 10 66 278;10 66 253;9 46 307;16 75 244; 15 70 256];
disp('返回向量均值 注意mean和median的差别')
a=mean(data)
b=median(data)

disp('标准差和方差')
c=std(data)
d=sqrt(var(data))

