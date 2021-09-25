clear;
Lambda=0.0006328;f=64;a=0.02;d=input('光栅常数d=');N=input('光栅总狭缝数N=');
x=linspace(-3*pi,3*pi,1000);
for j=1:1000
   u=(pi*a/Lambda)*(x(j)/(sqrt(x(j)^2+f^2)));
   I(j)=((sin(u)/u).^2)*((sin(d*u*N/a)/sin(d*u/a)).^2);
   
end
NCLevels=255;
Ir=NCLevels*I;
figure
colormap(gray(NCLevels));
subplot(2,1,2),image(x,I,Ir)
subplot(2,1,1),plot(x,I(:)/max(I));
