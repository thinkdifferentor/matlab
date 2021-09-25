% 生成简单多边形后，有时还需要对多边形各顶点的凹凸性做判断。
% 先计算待处理点与相邻点的两个向量，再计算两向量的叉乘，根据求得结果的正负可以判断凹凸性。
% 结果为负则为凹顶点，为正则为凸顶点。 
% 凹顶点用o表示，凸顶点用*表示。
clear all;close all;clc;

n=20;
p=rand(n,2);

p=createSimplyPoly(p);  %创建简单多边形

hold on;
for i=1:n    
    if i==1                     %处理第一个点
        v1=p(n,:)-p(1,:);       %当前点到前一点向量
        v2=p(2,:)-p(1,:);       %当前点到后一点向量
    elseif i==n                 %最后一个点
        v1=p(n-1,:)-p(n,:);    
        v2=p(1,:)-p(n,:);        
    else                        %其他点
        v1=p(i-1,:)-p(i,:);     
        v2=p(i+1,:)-p(i,:);
    end
    r=det([v1;v2]);                 %叉乘后第三个向量的方向
    if r>0
        plot(p(i,1),p(i,2),'*');       
    elseif r<0
        plot(p(i,1),p(i,2),'o');         
    end
end

plot(p(:,1),p(:,2));
p=circshift(p,1);
plot(p(:,1),p(:,2));
