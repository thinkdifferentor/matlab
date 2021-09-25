clc;clear;
close;
xa=-2:0.02:2;
ya=xa;

%生成x-y平面上的网格数据
[x y]=meshgrid(xa,xa);
z=x.*exp(-x.^2-y.^2);

%绘制网格面
mesh(x,y,z);pause;

%绘制曲线面
surf(x,y,z);pause;

%绘制等高线图
contour(x,y,z);pause;

%z=0.1一条等高线
contour(x,y,z,[0.1 0.1]);pause;



