% GM(1,1)模型适用于具有较强指数规律的序列，只能描述单调的变化过程，而 Verhulst 模型则适用于非单
% 调的摆动发展序列或具有饱和状态的 S 形序列。
% GM(1,1)模型适用于具有较强指数规律的序列，只能描述单调的变化过程，对于非
% 单调的摆动发展序列或有饱和的 S 形序列，可以考虑建立 GM(2,1)， DGM 和 Verhulst模型。


% 上海市上网户数的 GM(2,1)模型。 1996～2001 年上海市上网户数数据序列为

clc,clear
x0=[41,49,61,78,96,104];
n=length(x0);
x1=cumsum(x0);
a_x0=diff(x0);
a_x0=[0,a_x0];
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-x0(2:end)',-z(2:end)',ones(n-1,1)];
Y=a_x0(2:end)';
u=B\Y;
x=dsolve('D2x+a1*Dx+a2*x=b','x(0)=c1,x(5)=c2');
x=subs(x,{'a1','a2','b','c1','c2'},{u(1),u(2),u(3),x1(1),x1(6)});
yuce=subs(x,'t',0:n-1);
digits(6),x=vpa(x);
x0_hat=[yuce(1),diff(yuce)];
epsilon=x0-x0_hat;
delta=abs(epsilon./x0);

yuce


