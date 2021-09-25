function solvedown(x0,v0,t,m,k,c,F0,w,w0,beta)
global t x t1;
g=9.8;t1=0:0.05:t;
x1=x0/100;
[t,x]=ode45('subfun',t1,[x1,v0],[],m,k,c,g,F0,w,beta);