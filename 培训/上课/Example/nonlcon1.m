%非线性不等式约束函数
function [c,ce] = nonlcon1(x)
c = 0.038-x(2)/x(1);
ce = [];%没有线性不等式约束
end
