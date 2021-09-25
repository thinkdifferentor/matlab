m = input('请输入一个大于2的整数：\n');
f = zeros(m); %分配变量内存空间，变量初始化
f([1,2]) = [1,2];%赋初值：f(1)=1,f(2)=2
if (m>2)&& (m==floor(m))
    for i = 3 : m
        f(i) = f(i-1) + f(i-2);
    end
end
sprintf('f(%d)=%d',[m f(m)]) %将运算结果输出到命令行

