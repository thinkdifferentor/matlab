%迭代求解
'12112.6873*t=0.625*2*lup*12*12'
'12112.6873*sqrt(1-t^2)+9.8*1000=31541.3*(2-lup)'  


t=zeros(1,20);
T=zeros(1,20);
int cnt=1;

syms lup t  T;
fun1=T*t-0.625*2*lup*12*12;
fun2=T*sqrt(1-t^2)+9.8*1000-31541.3*(2-lup);
fun3=subs(fun1,'lup',10);
fun4=subs(fun2,'lup',12);



for l=0:0.01:2
    subs(fun1,'lup',l);
    subs(fun2,'lup',l);
    [t(cnt),T(cnt)]=solve(fun1,fun2,'t','T'); 
    cnt=cnt+1;
end

syms x y;
fun=x+y-1;
fun2=subs(fun,x,2);
fun2;

syms x1 x2;
s=3*x1-x2-2;
x1=2;x2=3;
s2=subs(s,'x1,x2',{x1,x2});  % 用 subs 替换