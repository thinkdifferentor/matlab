a = randn(1000,1); %随机产生1000个标准正态分布的数据
x = -3 : 0.1 : 3;  %数据的X值
hist(a, x)         %绘制X值对应的正态数据的统计分布
