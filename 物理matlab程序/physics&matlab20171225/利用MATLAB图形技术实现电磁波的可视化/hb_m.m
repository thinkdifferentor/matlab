function hb_m(a,w,k)
z=0:0.01:20;%�趨Z��ȡֵ��Χ
o=0;t=0:20;
for i=1:20;
y=a*sin(w*t(i)-k*z+o);
x=zeros(length(y),1);
plot3(z,x,y,'b',z,y,x,'g'),title('�в��Ķ�̬ģ��'),xlabel('z'),ylabel('y');zlabel('x');
hold off
grid on
m(i)=getframe;%�õ�ÿһʱ�̵Ĳ���ͼ����֡
end
movie(m)%������ʾ
return