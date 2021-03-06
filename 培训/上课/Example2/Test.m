%求优化函数极小值
function [x,fval,exitflag]=Test()

A=[11];%线性不等式约束左边矩阵
b=[2];%线性不等式约束右边向量
Aeq=[];%线性等式约束左边矩阵
beq=[];%线性等式约束右边向量
lb=[0;0];%自变量下限
ub=[inf;inf];%自变量上限
x0=[1 ;1];%初始值
options=optimset('LargeScale','off','display','iter');
[x,fval,exitflag]=fmincon(@myobj,x0,A,b,Aeq,beq,lb,ub,@mycon,options);
end



%目标函数
function f=myobj(x)
f=2*x(1)^2+2*x(2)^2-2*x(1)*x(2)-4*x(1)-6*x(2);
end

function[c,ceq]=mycon(x)
c(1)=x(1)+5*x(2)^2-5;
ceq=[];
end