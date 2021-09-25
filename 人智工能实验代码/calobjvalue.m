% 2.2.3 计算目标函数值
% calobjvalue.m函数的功能是实现目标函数的计算，其公式采用本文示例仿真，可根据不同优化问题予以修改。
%遗传算法子程序
%Name: calobjvalue.m
%实现目标函数的计算，将 二值域 中的数转化为 变量域的数
function [objvalue]=calobjvalue(pop)
temp1=decodechrom(pop,1,10);   %将pop每行转化成十进制数
x=temp1*10/1023;                         %在精度不大于0.01时，最小整数为1023，即需要10位二进制
objvalue=10*sin(5*x)+7*cos(4*x);   %计算目标函数值
