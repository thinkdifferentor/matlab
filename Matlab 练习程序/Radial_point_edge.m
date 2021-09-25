% 射线法判断点与多边形关系原理如下：
% 
% 从待判断点引出一条射线，射线与多边形相交，如果交点为偶数，则点不在多边形内，如果交点为奇数，则点在多边形内。
% 
% 原理虽是这样，有些细节还是要注意一下，比如射线过多边形顶点或射线与多边形其中一边重合等情况还需特别判断。

clear all;close all;clc;

polyn=20;
poly=rand(polyn,2);
poly=createSimplyPoly(poly);  %创建简单多边形

polyn=polyn+1;                %连线方便，把第一个点添加到最后一个点后面
poly(polyn,:)=poly(1,:);

pn=500;
p=rand(pn,2);

hold on;
for i=1:pn
   
    flag=0;
    for j=2:polyn
        x1=poly(j-1,1);         %多边形前后两个点
        y1=poly(j-1,2);
        x2=poly(j,1);
        y2=poly(j,2);
       
        k=(y1-y2)/(x1-x2);      %多边形一条边直线
        b=y1-k*x1;
        x=p(i,1);               %过当前点直线和多边形交点
        y=k*x+b;          
               
        if min([x1 x2])<=x && x<=max([x1 x2]) && ...        %点同时在射线和多边形边上
           min([y1 y2])<=y && y<=max([y1 y2]) &&  y>=p(i,2)
               flag=flag+1;
        end
    end
   
    if mod(flag,2)==0               %偶数则在外部
        plot(p(i,1),p(i,2),'r.');
    else                            %奇数则在内部
        plot(p(i,1),p(i,2),'g.');        
    end
end

plot(poly(:,1),poly(:,2));