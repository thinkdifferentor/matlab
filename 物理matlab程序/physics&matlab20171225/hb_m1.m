function hb_m1(a,w,k)
z=0:0.01:20;%设定Z的取值范围
o=0;t=0:20;
for i=1:20;
y=a*sin(w*t(i)-k*z+o);
x=zeros(length(y),1);
plot3(z,x,y,'b',z,y,x,'g'),title('行波的动态模拟'),xlabel('z'),ylabel('y');zlabel('x');
hold off
grid on
end
return