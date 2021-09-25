%符号计算
clear,clc

disp('符号对象定义');
n=pi^2

disp('转换为符号对象')
a=sym(n)

disp('符号对象转换为十进制对象')
b=sym(n,'d')

disp('字符串转换为符号对象');
c=sym('pi^2')

disp('定义符号表达式')
syms x y z;
d=x^3+2*y+y^2+c

disp('计算精度和数据类型转换')
a=2^10000
a=sym(2);
b=a^10000
c=vpa(b)
d=sym('pi^2');
f=vpa(d,16)
g=double(d)


disp('符号矩阵操作')
A=sym('[a,b;c,d]')

disp('符号矩阵转置')
B=inv(A)

disp('求解符号方程组的解')
C=A.\B

D=A\B

disp('求解符号矩阵的特征向量与特征值')
E=eig(A)


disp('符号函数计算 f(x,y)=(x-y)^3 g(x,y)=(x+y)^3')
syms x y;
f=(x-y)^3;
g=(x+y)^3;

disp('符号函数相乘')
h=f*g

disp('符号函数的展开')
he=expand(h)

disp('符号函数的因式分解')
hf=factor(he)

disp('符号函数中的符号对象替换')
s=subs(h,y,x^2+x+1)

% disp('定义符号函数')
% fun=symfun(f*g,[x,y])

disp('合并同类项')
scol=collect(s,x)

disp('符号函数化简')
ssim=simplify(scol)

disp('极限和级数')
syms n x;

disp('符号函数求极限')
a=limit((1+x/n)^n,n,inf)

disp('符号函数求和')
sum=symsum((-1)^n*x^n/n,n,1,inf)

disp('求解符号代数方程')
syms a b c x;
solve(a*x^2+b*x+c,x)

disp('求解符号微分方程')
r=dsolve('Dy==a*y+b')










