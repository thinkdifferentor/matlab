%利用遗传算法计算函数f(x)=xcos(5*pi*x+3.5)在区间【-1，2.5】上的最大值
function value=fun(x)
    value=x.*cos(5*pi*x)+3.5;
end