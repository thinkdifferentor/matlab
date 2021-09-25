%求解函数
function [x]=Test()
x0 = [0 0];      % starting point
A = [0.038 -1]; b = 0;  % matrix and rhs vector for linear inequality 
options = optimset('Display','iter'); % show progress after each iteration
x = fmincon(@fun1,x0,A,b,[],[],[-Inf; 1],[1.8; Inf],@nonlcon1,options);

end

%{
函数参数说明：
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)用options参数指定的参数进行最小化。
fun求解目标函数表达式
x0, 表示初始的猜测值，大小要与变量数目相同
A b 为线性不等约束，A*x <= b， A应为n*n阶矩阵，学过线性代数应不难写出A和b
Aeq beq为线性相等约束，Aeq*x = beq。 Aeq beq同上可求
lb ub为变量的上下边界， 正负无穷用 -Inf和Inf表示， lb ub应为N阶数组
nonlcon 为非线性约束，可分为两部分，非线性不等约束 c，非线性相等约束，ceq
%}


%目标函数
function y=fun1(x)
y=x(1)-0.25*x(2)+0.6;
end

%非线性不等式约束函数
function [c,ce] = nonlcon1(x)
c = 0.038-x(2)/x(1);
ce = [];%没有线性不等式约束
end





