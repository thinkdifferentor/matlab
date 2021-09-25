% 多边形的核可以这样理解：这个核为原多边形内部的一个多边形，站在这个叫核的多边形中，我们能看到原多边形的任何一个位置。

clear all;close all;clc;

n=20;
p=rand(n,2);

p=createSimplyPoly(p);
n=n+1;
p(n,:)=p(1,:);

maxX=max(p(:,1));
minX=min(p(:,1));
maxY=max(p(:,2));
minY=min(p(:,2));

core=[minX minY;        %初始化核
      minX maxY;
      maxX maxY;
      maxX minY;
      minX minY];

for i=2:n
    [m ~]=size(core);    
   
    p_pre=p(i-1,:);             %多边形当前点的前一个点    
    p_cur=p(i,:);               %多边形当前点
    if i~=n                     %如果回到第一个点，那么下一个点则为第二个点
        p_nxt=p(i+1,:);
    else
        p_nxt=p(2,:); 
    end
   
    k=(p_nxt(2)-p_cur(2))/(p_nxt(1)-p_cur(1));      %当前点与下一个点构成的多边形的其中一边
    b=p_cur(2)-k*p_cur(1);  
    flag=k*p_pre(1)-p_pre(2)+b;         %标记当前点的前一个点在该边的左边或右边
     
    v1=p_pre-p_cur;                     %计算当期点的凹凸性
    v2=p_nxt-p_cur;    
    r=det([v1;v2]);                     %大于0为凸，反之为凹
    
    re=[];
    for j=1:m-1
        core_cur_flag=core(j,1)*k-core(j,2)+b;          %标记当前核中的点在边的左边或右边
        core_nxt_flag=core(j+1,1)*k-core(j+1,2)+b;      %标记下一个核中的点在边的左边或右边
        if r*core_cur_flag*flag>0                       %当当前多边形点为凸点，且前一个点和核的点同方向或当前多边形点为凹点，且前一个点和核的点是反方向时标记该点为新核的点

            re=[core(j,:);re];                         
        end
        
        if core_cur_flag*core_nxt_flag<=0               %标记多边形边与核的边的交点为新核的点
            if core(j,1)~=core(j+1,1) 
                kbar=(core(j,2)-core(j+1,2))/(core(j,1)-core(j+1,1));
                bbar=core(j,2)-kbar*core(j,1);
                       
                xx=-(b-bbar)/(k-kbar);
                yy=-(-bbar*k+b*kbar)/(k-kbar);
            else
                xx=core(j,1);
                yy=k*xx+b;
            end
            re=[xx yy;re];
        end
        
    end
    
    core=re;  
    core(size(core,1)+1,:)=core(1,:);   %多边形第一个点和最后一个点相同
end

hold on;
plot(p(:,1),p(:,2));
plot(core(:,1),core(:,2),'r')
axis equal; 