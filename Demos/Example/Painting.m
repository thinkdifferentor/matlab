clc;clear;
close;
xa=-2:0.02:2;
ya=xa;

%����x-yƽ���ϵ���������
[x y]=meshgrid(xa,xa);
z=x.*exp(-x.^2-y.^2);

%����������
mesh(x,y,z);pause;

%����������
surf(x,y,z);pause;

%���Ƶȸ���ͼ
contour(x,y,z);pause;

%z=0.1һ���ȸ���
contour(x,y,z,[0.1 0.1]);pause;



