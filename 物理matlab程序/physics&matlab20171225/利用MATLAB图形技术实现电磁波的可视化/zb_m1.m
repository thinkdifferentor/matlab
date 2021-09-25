function zb_m1(a,w,k)
z=0:0.01:20;%设定X的取值范围
t=0:20;
for i=1:20;
y1=a*sin(w*t(i)-k*z);
y2=a*sin(w*t(i)+k*z);
y=y1+y2;%合成驻波
r=zeros(length(y1),1);
s=zeros(length(y2),1);
x=zeros(length(y),1);
subplot(2,1,1),plot3(z,r,y1,'b',z,s,y2,'g'),xlabel('z'),ylabel('y');zlabel('x');
hold off
grid on
subplot(2,1,2),plot3(z,x,y),xlabel('z'),ylabel('y');zlabel('x');%产生波形图
hold on
grid on
m(i)=getframe;%得到每一时刻的波形图，即帧
end
movie(m)%动画显示
return