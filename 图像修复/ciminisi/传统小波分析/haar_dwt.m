function [L, H]=haar_dwt(f)%��Ȼ����û�����߽紦��ͼƬ�����2^n*2^n�͵�
    n=length(f);
    n=n/2;
    L=zeros(1,n);   %��Ƶ����
    H=zeros(1,n);   %��Ƶ����
    for i=1:n
        L(i)=(f(2*i-1)+f(2*i))/sqrt(2);
        H(i)=(f(2*i-1)-f(2*i))/sqrt(2);
    end
    
end