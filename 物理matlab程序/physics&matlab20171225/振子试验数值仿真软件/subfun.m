function ydot=subfun(t,x,flag,m,k,c,g,F0,w,beta);
ydot=[x(2);(-c*x(2)-k*(x(1)-0.4+beta*(x(1)-0.4)^3)+F0*sin(w*t))/m];