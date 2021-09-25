function main2
clear,clc

X=[1 	2 	3 	4 	5 	6 	7 ];
Y=[0.368 	0.135 	0.050 	0.018 	0.007 	0.002 	0.001 ];

[C,L] = Lagrange(X,Y);

%输出拉格朗日插住多项式系数
C

%输出拉格朗日插住多项式
L

%定义符号变量x
syms x;

% 使用变量精度算法(VPA)去计算A中每个元素为d小数位精度，其中d是当前设置的位数，结果的每个元素是符号表达式。 
% R = vpa(A, d) 用d个位数代替当前设置的位数。 比如：vpa pi 75来计算pi的75位精度。 
% 系数按精度输出拉格朗日插住多项式
Result=vpa(L,6)

%数值计算
f1=vpa(subs(Result,x,1.8),6)


f2=vpa(subs(Result,x,6.15),6)

end
