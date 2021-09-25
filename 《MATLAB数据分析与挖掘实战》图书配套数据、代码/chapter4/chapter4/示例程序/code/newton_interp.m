function yi=newton_interp(X,Y,xi)
syms t;             %�����Ա���t�������ַ���ʽ
if(length(X)==length(Y))
    n=length(X);
    c(1:n)=0.0;
else
    disp('X��Y��ά������ȣ�');
    return;
end
f=Y(1);             %f������¼�õ���ţ�ٲ�ֵ��ʽ���ַ������ʽ
l=1;
for i=1:n-1
    y1=zeros(1,n-i);
    for j=i+1:n
        y1(j)=(Y(j)-Y(i))/(X(j)-X(i));
    end
    c(i)=y1(i+1);   %c��¼���
    l=l*(t-X(i));    %l��¼(x-x0)(x-x1)������ֵ 
    f=f+c(i)*l;     %�ۼӵõ���ֹ�ʽ
    Y=y1;
end
f=simplify(f);       %�򻯵õ���ţ�ٲ�ֵ��ʽ
m=length(xi);       %��ʼ���

for i=1:m
    yi(i)=subs(f,'t',xi(i));   % ���ݹ�ʽ������Ҫ��ֵ
end
yi=double(yi);     % ת��Ϊ��ֵ�ͣ�Ϊ����ֵ

end


