function zb_m1(a,w,k)
z=0:0.01:20;%�趨X��ȡֵ��Χ
t=0:20;
for i=1:20;
y1=a*sin(w*t(i)-k*z);
y2=a*sin(w*t(i)+k*z);
y=y1+y2;%�ϳ�פ��
r=zeros(length(y1),1);
s=zeros(length(y2),1);
x=zeros(length(y),1);
subplot(2,1,1),plot3(z,r,y1,'b',z,s,y2,'g'),xlabel('z'),ylabel('y');zlabel('x');
hold off
grid on
subplot(2,1,2),plot3(z,x,y),xlabel('z'),ylabel('y');zlabel('x');%��������ͼ
hold on
grid on
m(i)=getframe;%�õ�ÿһʱ�̵Ĳ���ͼ����֡
end
movie(m)%������ʾ
return