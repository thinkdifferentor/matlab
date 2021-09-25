function ydot=znxpydfun(t,y,flag,b,p,m)
ydot=[y(2);
   -b/m*y(2)*(y(2).^2+y(4).^2)^(p/2);
   y(4);
   -9.8-b/m*y(4)*(y(2).^2+y(4).^2)^(p/2)];
