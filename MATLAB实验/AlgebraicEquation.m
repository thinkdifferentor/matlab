%��������
clear,clc

syms a b c x;
disp('�󷽳�a*x^2+b*x+c=0��ͨ��:');
r1=solve(a*x^2+b*x+c,x)


disp('��x^2-3*x+exp(x)=2�Ľ�');
r2=solve('x^2-3*x+exp(x)=2','x')


syms x positive;%����x��ֵΪ��
disp('��x^2-3*x+exp(x)=2������');
r4=solve('x^2-3*x+exp(x)=2','x')


% disp('��x^2-3*x+exp(x)=0��������[2,5]�ϵĽ�');
% r5=vpasolve('x^2-3*x+exp(x)=0','x',[2 5])

% syms y z u v w;
% disp('�󷽳���uy^2+vz+w=0,y+z+w=0�Ľ�:');
% r6=solve('u*y^2+v*z+w=0','y+z+w=0','y','z','u','v','w')














