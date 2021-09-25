function [v,unv]=statmoments(p,n)
Lp=length(p);
if (Lp~=256)&(Lp~=65536)
    error('p must be a 256- or 65536-element vector.');
end
G=Lp-1;
p=p/sum(p);p=p(:);
z=0:G;
z=z./G;
m=z*p;
z=z-m;
v=zeros(1,n);
v(1)=m;
for j=2:n
    v(j)=(z.^j)*p;
end
if nargout>1
    unv=zeros(1,n);
    unv(1)=m.*G;
    for j=2:n
        unv(j)=((z*G).^j)*p
    end
end