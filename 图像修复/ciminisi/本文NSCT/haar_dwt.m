function [L, H]=haar_dwt(f)%显然，我没有做边界处理，图片最好是2^n*2^n型的
    n=length(f);
    n=n/2;
    L=zeros(1,n);   %低频分量
    H=zeros(1,n);   %高频分量
    for i=1:n
        L(i)=(f(2*i-1)+f(2*i))/sqrt(2);
        H(i)=(f(2*i-1)-f(2*i))/sqrt(2);
    end
    
end