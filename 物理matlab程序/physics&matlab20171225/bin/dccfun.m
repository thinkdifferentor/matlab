%%�Ǿ��ȴų������˶���function
function ydot=dccfun(t,y,flag,m,q,mu,I)
ydot=[y(2);
   -q*mu*I*y(4)/(2*pi*m*y(1));
   y(4);
   q*mu*I*y(2)/(2*pi*m*y(1))];
