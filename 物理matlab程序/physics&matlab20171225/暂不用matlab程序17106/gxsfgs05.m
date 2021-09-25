length=input('length=');
d=input('d=');
D=input('D=');
xmax=5*length*D/d;ys=xmax;
nx=input('nx=');
xs=linspace(-xmax,xmax,nx);
for i=1:nx
    r12=xs(i)*d/D;
     p=2*pi*r12/length;
     I(i,:)=4*cos(p/2).^2;
 end
 Br=(I/4.0)*255;
 subplot(1,2,1),image(xs,ys,Br)
 colormap(gray(255));
subplot(1,2,2),plot(I(:),xs)