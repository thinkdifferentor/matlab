%%非均匀磁场粒子运动的function
function ydot=dccfun(t,y,flag,m,q,mu,I)
ydot=[y(2);
   -q*mu*I*y(4)/(2*pi*m*y(1));
   y(4);
   q*mu*I*y(2)/(2*pi*m*y(1))];
