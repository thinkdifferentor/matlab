% 多圆求交点，要先对圆两两求交点。
% 有交点的圆分为相切圆和相交圆。
% 相切圆求法：
% 　　1.根据两圆心求直线
% 　　2.求公共弦直线方程
% 　　3.求两直线交点即两圆切点。
% 相交圆求法：
% 　　1.求公共弦方程直线。
% 　　2.公共弦直线方程和其中一个圆方程联立求解即可。
% 公共弦直线方程就是两圆方程的差。

clear all;close all;clc;

n=20;
cic=rand(n,3); %（x,y,r）

hold on;
for i=1:n-1
    for j=i+1:n
        cic1=cic(i,:);
        cic2=cic(j,:);
        p=circleCross(cic1,cic2);
        if ~isempty(p)
            plot(p(:,1),p(:,2),'.');
        end
    end
end

for i=1:n
    theta=0:0.001:2*pi;
    x=cic(i,1)+cic(i,3)*cos(theta);
    y=cic(i,2)+cic(i,3)*sin(theta);
    plot(x,y,'-');
end
axis equal