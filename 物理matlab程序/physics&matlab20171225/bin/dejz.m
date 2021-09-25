%电偶极子的场
q=2e-6;k=9e+9;a=1.5;b=-1.5;
x=-6:0.6:6;y=x;
[X,Y]=meshgrid(x,y);
rp=sqrt((X-a).^2+(Y-b).^2);
rm=sqrt((X+a).^2+(Y+b).^2);
V=q*k*(1./rp-1./rm);
[Ex,Ey]=gradient(-V);
AE=sqrt(Ex.^2+Ey.^2);
Ex=Ex./AE;Ey=Ey./AE;
cv=linspace(min(min(V)),max(max(V)),49);
contourf(X,Y,V,cv,'k-'),hold on
quiver(X,Y,Ex,Ey,0.7)
plot(a,b,'wo',a,b,'w+')
plot(-a,-b,'wo',-a,-b,'w-')
