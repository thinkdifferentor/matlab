function Dfys_m(Lambda,f,a)
x=linspace(-3*pi,3*pi,1000);
for j=1:1000
   u=(pi*a/Lambda)*(x(j)/(sqrt(x(j)^2+f^2)));
   I(j)=((sin(u)/u).^2); 
end
NCLevels=255;
Ir=NCLevels*I;
colormap(gray(NCLevels));
plot(x,I(:)/max(I));
return