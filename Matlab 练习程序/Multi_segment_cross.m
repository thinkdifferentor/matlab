% 这里的方法如下：
% 
% 1.根据线段的端点求两条直线的交点。
% 
% 2.判断直线的交点是否在两条线段上。

clear all;close all;clc;

n=20;
p=rand(n,4);        %（x1,y1,x2,y2）线段两端点

for i=1:n
    pbar=p(i,:);
    pbar=reshape(pbar,[2,2]);
    line(pbar(1,:),pbar(2,:));
end

hold on;
for i=1:n-1
    p1=p(i,:); 
    k1=(p1(2)-p1(4))/(p1(1)-p1(3));
    b1=p1(2)-k1*p1(1);
    for j=i+1:n
        p2=p(j,:);
        k2=(p2(2)-p2(4))/(p2(1)-p2(3));
        b2=p2(2)-k2*p2(1);
       
        x=-(b1-b2)/(k1-k2);             %求两直线交点
        y=-(-b2*k1+b1*k2)/(k1-k2);
                                        %判断交点是否在两线段上
        if min(p1(1),p1(3))<=x && x<=max(p1(1),p1(3)) && ...
           min(p1(2),p1(4))<=y && y<=max(p1(2),p1(4)) && ...
           min(p2(1),p2(3))<=x && x<=max(p2(1),p2(3)) && ...
           min(p2(2),p2(4))<=y && y<=max(p2(2),p2(4))    
            plot(x,y,'.');
        end
    end
end

