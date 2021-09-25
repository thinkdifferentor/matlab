function yy=volum(beta,x)
a=beta(1);
b=beta(2);
c=beta(3);
d=beta(4);
e=beta(5);
f=beta(6);

x1=x(:,6);
x2=x(:,5);
x3=x(:,4);
x4=x(:,3);
x5=x(:,2);
x6=x(:,1);

yy=a*x1+b*x2+c*x3+d*x4+e*x5+f*x6;
