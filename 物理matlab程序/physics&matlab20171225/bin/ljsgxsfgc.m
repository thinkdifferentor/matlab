clear;
%%clf;
clc;
Lambad=0.0006328;D=1000;d1=1.0;I0=0.05;
x=linspace(-5,5,1000);
for j=1:1000
   I(j)=4*I0*(cos(pi*d1*x(j)/(Lambad*D)).^2);
end
NCLevels=255;
Ir=NCLevels*I;
figure;
colormap(gray);
subplot(2,1,2),image(x,I,Ir)
subplot(2,1,1),plot(x,I(:)/max(I))