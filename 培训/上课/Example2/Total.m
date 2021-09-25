function [c,ceq]=Cond(x,w,d0,c0,a)
c=prod(do*w./(w+a*w))-c0;
ceq=[];
end

function f=fun(v,w,d0,c0,a)
f=sum(v);

end


%线性规划问题 fmincon函数使用
function [x,f]=Solution()
w=3;
d0=25;
c0=0.05;
a=0.56;
n=3;
x0=zeros(n,1);
v1=25;
v2=40;
A=[];
b=[];
Aeq=[];
beq=[];
vlb=25*zeros(n,1);
vub=40*zeros(n,1);

[x,f]=fmincon(@fun,x0,A,b,Aeq,beq,vlb,vub,@Cond,[],w,d0,c0,a);
end

