clear all;close all;clc;

p=rand(3,2);%��x,y��

cen1=(p(1,:)+p(2,:))/2;         %������һ�����е�
cen2=(p(2,:)+p(3,:))/2;         %��һ�����е�

k1=-1/((p(1,2)-p(2,2))/(p(1,1)-p(2,1)));    %һ���ߴ�ֱƽ����
b1=cen1(2)-k1*cen1(1);

k2=-1/((p(2,2)-p(3,2))/(p(2,1)-p(3,1)));    %��һ���ߴ�ֱƽ����
b2=cen2(2)-k2*cen2(1);

x0=-(b1-b2)/(k1-k2);             %����ֱ�߽���
y0=-(-b2*k1+b1*k2)/(k1-k2);
                                    
r=sqrt((y0-p(1,2))^2+(x0-p(1,1))^2); 

hold on;
plot(p(:,1),p(:,2));
p=circshift(p,1);
plot(p(:,1),p(:,2));

theta=0:0.01:2*pi;
x=x0+r*cos(theta);
y=y0+r*sin(theta);
plot(x,y,'-',x0,y0,'.');
axis equal