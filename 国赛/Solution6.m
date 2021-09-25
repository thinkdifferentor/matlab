%绘制问题二中的几何图形

%椭圆图像绘制==参数方程
t = linspace(0,2*pi,90);
x = 21.6684*cos(t);
y = 41.1144*sin(t);

plot(x,y)
title('几何形状解析式：x^2/1690.4+y^2/469.5196=1')
hold on
fill(x,y,'b');
axis image
