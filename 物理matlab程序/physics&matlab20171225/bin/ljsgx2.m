lambda=0.0005;
d=0.002;
z=1;
Ymax=5*lambda*z/d;
Xs=Ymax;
Ny=101;
Ys=linspace(-Ymax,Ymax,Ny);
for i=1:Ny
   L1=sqrt((Ys(i)-d/2).^2+z^2);
   L2=sqrt((Ys(i)+d/2).^2+z^2);
   Phi=2*pi*(L2-L1)/lambda;
   B(i,:)=4*cos(Phi/2).^2;
end
clf;
figure(gcf);
Nclevels=255;
Br=(B/4.0)*Nclevels;
subplot(1,2,1),image(Xs,Ys,Br);
colormap(gray(Nclevels));
subplot(1,2,2),plot(B(:),Ys)