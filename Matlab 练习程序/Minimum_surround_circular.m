% Ritter�㷨���£�
% 
% 1.�ӵ㼯�����ѡ����������Ϊֱ����Բ���г�ʼ����
% 
% 2.�ж���һ����p�Ƿ���Բ�У����������������裬�����������в���3��
% 
% 3.ʹ��p��Ϊ��Բ��һ���߽�㣬��һ���߽��Ϊ����p��Զ��Բ�ϵĵ㣬ʹ������������Ϊֱ��������Բ��
% 
% 4.��������2��ֱ�����������е㡣

clear all;close all;clc;

n=100;
p=rand(n,2);

p1=p(1,:);
p2=p(2,:);
r=sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2)/2;
cenp=(p1+p2)/2;

for i=3:n
    newp=p(i,:);    
    d=sqrt((cenp(1)-newp(1))^2+(cenp(2)-newp(2))^2);  
    if d>r
        r=(r+d)/2;
        cenp=cenp+(d-r)/d*(newp-cenp);
    end    
end

hold on;
plot(p(:,1),p(:,2),'o');
x0=cenp(1);
y0=cenp(2);
theta=0:0.01:2*pi;
x=x0+r*cos(theta);
y=y0+r*sin(theta);
plot(x,y,'-',x0,y0,'.');
axis equal
