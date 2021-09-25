%已知积分结果，求积分上下限
%{
先用
syms x a b
s=int(x^2+x,a,b)
 结果：
s =
 
- a^3/3 - a^2/2 + b^3/3 + b^2/2
将已知的一个限代入，
以上限10为例：
subs(s,b,10)
结果：
ans =
 
- a^3/3 - a^2/2 + 1150/3
令积分结果等于100，便可求出另一个限。
sovle('- a^3/3 - a^2/2 + 1150/3=100')
%}



%L=input('Please input the lenght of fleet:');%140
%disp(['The time is :',t]);

%syms t a b
%s=int('25-(0.008195*t^4-0.2367*t^3+2.275*t^2-7.988*t+25.59)',a,b);
%y=subs(s,b,0);
solve('(0.001639*a^5 - 0.059175*a^4 + 0.758333*a^3 - 3.994*a^2 + 0.59*a) = 140/5 ');
ans

