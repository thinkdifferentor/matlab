clear all;close all;clc;

p=rand(3,2);    %（x,y）

v12=(p(2,:)-p(1,:))/norm(p(2,:)-p(1,:));    %一个顶点两边的归一化向量
v13=(p(3,:)-p(1,:))/norm(p(3,:)-p(1,:));

v21=(p(1,:)-p(2,:))/norm(p(1,:)-p(2,:));    %另一个顶点两边的归一化向量
v23=(p(3,:)-p(2,:))/norm(p(3,:)-p(2,:));

v1=v12+v13;             %过顶点一的角平分线
k1=v1(2)/v1(1);
b1=p(1,2)-k1*p(1,1);

v2=v21+v23;             %过顶点二的角平分线
k2=v2(2)/v2(1);
b2=p(2,2)-k2*p(2,1);

x0=-(b1-b2)/(k1-k2);             %求两直线交点，圆心
y0=-(-b2*k1+b1*k2)/(k1-k2);

k=(p(1,2)-p(2,2))/(p(1,1)-p(2,1));  
b=p(1,2)-k*p(1,1);
r=(k*x0-y0+b)/sqrt(k^2+1);      %求圆心到一条边的距离，半径

hold on;
plot(p(:,1),p(:,2));
p=circshift(p,1);
plot(p(:,1),p(:,2));

theta=0:0.01:2*pi;
x=x0+r*cos(theta);
y=y0+r*sin(theta);
plot(x,y,'-',x0,y0,'.');
axis equal