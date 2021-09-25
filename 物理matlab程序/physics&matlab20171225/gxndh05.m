length=input('length=');
R=input('R=');
range=4;n=500;ny=linspace(-range,range,n);
nx=ny;
[X,Y]=meshgrid(nx,ny);
flag=(X.^2+Y.^2)>=range^2;
h=image(nx,ny,255);
axis equal;axis([-range,range,-range,range]);
I=4*cos(pi/length*((X.^2+Y.^2)/R+length/2)).^2;
colormap(gray(255));
Br=(I/4.0)*255;
Br(flag)=NaN;
subplot(1,2,1),
image(nx,ny,Br);
r=sqrt(X.^2+Y.^2);
subplot(1,2,2),plot(r,Br);
%%set(h,'xdata',nx,'ydata',ny,'cdata',Br)
