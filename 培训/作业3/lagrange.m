%Matlab 中没有现成的 Lagrange 插值函数，必须编写一个 M 文件实现 Lagrange 插值。
%设 n 个节点数据以数组 x0, y0 输入（注意 Matlat 的数组下标从 1 开始）， m 个插值
%点以数组 x 输入，输出数组 y 为 m 个插值。
%针对多项式插值
function y=lagrange(x0,y0,x)
n=length(x0);
m=length(x);
for i=1:m
z=x(i);
s=0.0;
    for k=1:n
    p=1.0;
        for j=1:n
            if j~=k
            p=p*(z-x0(j))/(x0(k)-x0(j));
            end
        end
    s=p*y0(k)+s;
    end
y(i)=s;
end