function Mikeson_m(Lambda,f,k)
xmax=10; ymax=10;
n=1.0;
N=150;
x=linspace(-xmax,xmax,N);
y=linspace(-ymax,ymax,N);
d=0.39-0.00005*k;
for i=1:N
   for j=1:N
      r(i,j)=sqrt(x(i)*x(i)+y(j)*y(j));
B(i,j)=cos(pi*(2*n*d*cos(asin(n*sin(atan(r(i,j)/f)))))/Lambda).^2;
   end
end
figure(gcf);
NClevels=255; Br=2.5*B*NClevels; image(x,y,Br);
colormap(gray(NClevels));
set(gca,'XTick',[]);
set(gca,'YTick',[]);
drawnow
return
