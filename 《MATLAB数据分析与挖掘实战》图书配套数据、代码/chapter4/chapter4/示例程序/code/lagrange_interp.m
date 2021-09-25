function [ yi ] = lagrange_interp (X,Y,xi)
n=length(X);       %�õ���֪���ݳ���
m=length(xi);      %�õ�����ֵ���ݳ���
yi=zeros(size(xi));
for j=1:m          %����ֵ������m��������ÿ����ֵ���
    for i=1:n       %��֪��n�����ݹ����м�ֵ
temp=1;   %temp���ڴ洢�м�ֵ
        for k=1:n
            if(i~=k)  %����������ͬ�Ĳ����
                temp=temp*(xi(j)-X(k))/(X(i)-X(k));
            end
        end
        yi(j)=Y(i)*temp+yi(j);
    end
end
end


