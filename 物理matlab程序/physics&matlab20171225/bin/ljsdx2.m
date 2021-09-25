clear;clc
u=zeros(21,21);
w=0;
for j=1:21;
   u(1,j)=sin((j-1)*pi/20);
   w=w+u(1,j);
end
for i=20:20
  for j=2:20
      u(i,j)=w./20;
   end
end
u
h=1.98;     %%超松驰因子
n=1000;     %%超松驰迭代次数
for k=1:n;
   for i=2:20;
      for j=2:20;
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
u(11,11)
x=0:0.05*pi:pi;
y=0:0.05*pi:pi;
[X,Y]=meshgrid(x,y);
subplot(1,2,1), mesh(x,y,u);   %%画三维曲面图
grid on
xlabel('0<x<3.14')
ylabel('0<y<3.14')
zlabel('0<z<1')
subplot(1,2,2),contour(u)  %%画等位线图

