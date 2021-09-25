A=input('A=');B=input('B=');
w1=input('w1=');w2=input('w2=');
Q1=input('Q1=');Q2=input('Q2=');
t=0:0.01:20;
x=A*sin(w1*t+Q1);
y=B*sin(w2*t+Q2);
plot(x,y,'r')
