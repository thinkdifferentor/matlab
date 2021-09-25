%载流线圈的磁场，毕沙定律应用
clear all
R=input('请输入园环的半径，R=');
I0=input('请输入电流,I0=');
mu0=4*pi*1e-7;C0=mu0/(4*pi);
N=20;                       %电流环分段数
x=linspace(-3,3,N);y=x;
theta0=linspace(0,2*pi,N+1);
theta1=theta0(1:N);
y1=R*cos(theta1);
z1=R*sin(theta1);
theta2=theta0(2:N+1);
y2=R*cos(theta2);z2=R*sin(theta2);
xc=0;yc=(y2+y1)./2;zc=(z2+z1)./2;
dlx=0;dly=y2-y1;dlz=z2-z1;
NGx=N;NGy=NGx;
for i=1:NGy
    for j=1:NGx
        rx=x(j)-xc;ry=y(i)-yc;rz=0-zc;
        r3=sqrt(rx.^2+ry.^2+rz.^2).^3;
        dlXr_x=dly.*rz-dlz.*ry;
        dlXr_y=dlz.*rx-dlx.*rz;
        Bx(i,j)=sum(C0*I0.*dlXr_x./r3);
        By(i,j)=sum(C0*I0.*dlXr_y./r3);
        B=(Bx.^2+By.^2).^0.5;
    end
end
subplot(1,2,1),quiver(x,y,Bx,By),
hold on
plot(0,1,'ro',0,-1,'bo'),
xlabel('x'),ylabel('y'),
axis([-3,3,-3,3]),
subplot(1,2,2)
mesh(x,y,B);axis([-3,3,-3,3,0,1e-4])
xlabel('X'),ylabel('y'),zlabel('B')
