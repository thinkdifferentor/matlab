%线性规划问题 fmincon函数使用
%function [x,f]Solution()
w=3;
d0=25;
c0=0.05;
a=0.56;
n=3;
x0=zeros(n,1);
v1=25;
v2=40;
A=[];
b=[];
Aeq=[];
beq=[];
vlb=25*zeros(n,1);
vub=40*zeros(n,1);

[x,f]=fmincon(@fun,x0,A,b,Aeq,beq,vlb,vab,@Cond,[],w,d0,c0,a);
