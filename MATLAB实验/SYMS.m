%���ż���
clear,clc

disp('���Ŷ�����');
n=pi^2

disp('ת��Ϊ���Ŷ���')
a=sym(n)

disp('���Ŷ���ת��Ϊʮ���ƶ���')
b=sym(n,'d')

disp('�ַ���ת��Ϊ���Ŷ���');
c=sym('pi^2')

disp('������ű��ʽ')
syms x y z;
d=x^3+2*y+y^2+c

disp('���㾫�Ⱥ���������ת��')
a=2^10000
a=sym(2);
b=a^10000
c=vpa(b)
d=sym('pi^2');
f=vpa(d,16)
g=double(d)


disp('���ž������')
A=sym('[a,b;c,d]')

disp('���ž���ת��')
B=inv(A)

disp('�����ŷ�����Ľ�')
C=A.\B

D=A\B

disp('�����ž������������������ֵ')
E=eig(A)


disp('���ź������� f(x,y)=(x-y)^3 g(x,y)=(x+y)^3')
syms x y;
f=(x-y)^3;
g=(x+y)^3;

disp('���ź������')
h=f*g

disp('���ź�����չ��')
he=expand(h)

disp('���ź�������ʽ�ֽ�')
hf=factor(he)

disp('���ź����еķ��Ŷ����滻')
s=subs(h,y,x^2+x+1)

% disp('������ź���')
% fun=symfun(f*g,[x,y])

disp('�ϲ�ͬ����')
scol=collect(s,x)

disp('���ź�������')
ssim=simplify(scol)

disp('���޺ͼ���')
syms n x;

disp('���ź�������')
a=limit((1+x/n)^n,n,inf)

disp('���ź������')
sum=symsum((-1)^n*x^n/n,n,1,inf)

disp('�����Ŵ�������')
syms a b c x;
solve(a*x^2+b*x+c,x)

disp('������΢�ַ���')
r=dsolve('Dy==a*y+b')










