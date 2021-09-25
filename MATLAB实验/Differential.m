%应用微积分
clear,clc

x=[1 3 8 7];
disp('一阶差分');
R1=diff(x)

disp('二阶差分');
R2=diff(x,2)

disp('函数的导数');
x1=[1 1.1 1.2 1.3];
y1=x.^3;
dy1=diff(y1)./diff(x1)
dy2=gradient(y1,x1)

disp('梯形积分法 求区间（-1,1）上，exp(-x^2)的积分');
x2=-1:0.05:1;
y2=exp(-x2.^2);
R3=trapz(x2,y2)

disp('高精度数值积分');
R4=quadl(@(x)exp(-x.^2),-1,1)


disp('重积分');
fun=@(x,y)1./(sqrt(x+y).*(1+x+y).^2);
R6=quad2d(fun,0,1,0,@(x)1-x)







