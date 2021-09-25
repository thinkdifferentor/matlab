%代数方程
clear,clc

syms a b c x;
disp('求方程a*x^2+b*x+c=0的通解:');
r1=solve(a*x^2+b*x+c,x)


disp('求x^2-3*x+exp(x)=2的解');
r2=solve('x^2-3*x+exp(x)=2','x')


syms x positive;%设置x的值为正
disp('求x^2-3*x+exp(x)=2的正解');
r4=solve('x^2-3*x+exp(x)=2','x')


% disp('求x^2-3*x+exp(x)=0的在区间[2,5]上的解');
% r5=vpasolve('x^2-3*x+exp(x)=0','x',[2 5])

% syms y z u v w;
% disp('求方程组uy^2+vz+w=0,y+z+w=0的解:');
% r6=solve('u*y^2+v*z+w=0','y+z+w=0','y','z','u','v','w')














