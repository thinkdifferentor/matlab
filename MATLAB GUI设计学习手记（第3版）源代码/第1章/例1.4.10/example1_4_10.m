A = [-5, -4, -3, -2; -1, 0, 1, 2; 3, 4, 5, 6];
%转换方法：a<=-2 ---->0;   -2<a<=3--->1;  a>3------->2。其中a为A中的元素。
sizeA = size(A);
a1 = zeros(sizeA);
a2 = a1;
a3 = a1;
a1(A <= -2) = 0;   %采用逻辑数组作为索引值
a2(A > -2 & A <= 3) = 1; %采用逻辑数组作为索引值
a3(A > 3) = 2;       %采用逻辑数组作为索引值
B = a1 + a2 + a3
