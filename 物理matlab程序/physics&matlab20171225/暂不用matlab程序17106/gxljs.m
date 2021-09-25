L=0.0005;
d=0.042;
b=0.014;
f=1000;
N=4;
ymax=5*L*f/d;xs=ymax;
Ny=300;ys=linspace(-ymax,ymax,Ny);
for i=1:Ny
    l1=(pi*b*ys(i))/(L*sqrt(ys(i).^2+f.^2));
    l2=(pi*d*ys(i))/(L*sqrt(ys(i).^2+f.^2));
    I(i,:)=(sin(l1)/l1).^2*(sin(N*l2)/sin(l2)).^2;
end
clf;figure(gcf);
NClevels=230;
Ir=(I/1.0)*NClevels;
subplot(1,2,1),image(xs,ys,Ir);
colormap(gray(NClevels));
%%subplot(1,2,2),plot(I(:),ys)