function yfgs_m(Lambda,D,d1,I0)
%%clf;
clc;
x=linspace(-5,5,1000);
for j=1:1000
   I(j)=4*I0*(cos(pi*d1*x(j)/(Lambda*D)).^2);
end
NCLevels=255;
Ir=NCLevels*I;
colormap(gray);
plot(x,I(:)/max(I))
return