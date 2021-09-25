% 北方某城市 1986～1992 年道路交通噪声平均声级数据见表 6
% 序号 年份
% 1 1986 71.1 5 1990 71.4
% 2 1987 72.4 6 1991 72.0
% 3 1988 72.4 7 1992 71.6
% 4 1989 72.1


clc,clear
x0=[71.1 72.4 72.4 72.1 71.4 72.0 71.6];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n);
range=minmax(lamda);
x1=cumsum(x0);
for i=2:n
z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)];
Y=x0(2:n)';
u=B\Y;
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=subs(x,'t',[0:n-1]);
digits(6),y=vpa(x); %为提高预测精度，先计算预测值，再显示微分方程的解
yuce=[x0(1),diff(yuce1)];%预测值输出
epsilon=x0-yuce; %计算残差
delta=abs(epsilon./x0); %计算相对误差
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda; %计算级比偏差值

fprintf('预测值:');
yuce

disp('计算残差:');
epsilon

disp('计算相对误差:');
delta

disp('计算级比偏差值:');
rho



