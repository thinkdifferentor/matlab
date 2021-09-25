tic;
x = 5 : 100000;
y = mod(x.^2, 10.^(1 + floor(log10(x)))); 
x(x == y)   %采用逻辑数组作为索引值，比find函数运算速度更快
toc
