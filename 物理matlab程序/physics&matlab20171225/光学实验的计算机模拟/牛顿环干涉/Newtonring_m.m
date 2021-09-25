function Newtonring_m(R,A)%%Newton's Rings
xM=4; %%mm
xs=xM;
N=500;
x=linspace(-xM+0.000001,xM,N);
y=linspace(-xM+0.0000001,xM,N);
for i=1:N
   for j=1:N
      r(i,j)=sqrt(x(i)*x(i)+y(j)*y(j));
      Bc(i,j)=(cos(((2*pi/A)*(r(i,j).^2/R+A/2))/2)).^2;
   end
end
NClevels=255;
Brc=1*Bc*NClevels;
subplot(2,2,1),image(x,y,Brc)
colormap(gray(255));
xlabel('x/mm');
ylabel('y/mm');
r=0.0:0.004:4;
B=(cos(((2*pi/A)*(r.^2/R+A/2))/2)).^2;
subplot(2,2,2),plot(r,B)
xlabel('r/mm');
ylabel('I/I0');
return