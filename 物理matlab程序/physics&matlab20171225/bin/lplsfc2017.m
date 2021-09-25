%拉普拉斯场的计算
clear;clc
u=zeros(7,12);
%%j=2:11;
%%u(7,j)=100;
for i=1:7
   for j=2:11
      u(i,j)=100/6*(i-1);    %%赋初值
   end
end
u
h=1.98;                     %%超松驰迭代因子
w=1000;
for n=1:w;
   for i=2:6;
      for j=2:11;
         a=u(i,j);
         b=u(i,j+1);
         c=u(i+1,j);
         d=u(i-1,j);
         e=u(i,j-1);
         f=0.25.*(b+c+d+e);
         u(i,j)=a+h.*(f-a);
      end
   end
end
u
y=1:7;
x=1:12;
[X,Y]=meshgrid(x,y);
 subplot(1,2,1),mesh(x,y,u)    %%画电势分布三维曲面图
subplot(1,2,2),contour(u)      %%画等势线图