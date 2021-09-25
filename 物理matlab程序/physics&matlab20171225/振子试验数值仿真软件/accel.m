function [a,a1,a2]=accel(x0,v0,t,m,k,c,F0,w,w0,beta,t2)
global t x;
g=9.8;
[s,i]=min(abs(t-t2));
a0=subfun(t(i),x(i,:),flag,m,k,c,g,F0,w,beta);
a=a0(2);
a1=a0(1);
a2=100*x(i,1);
