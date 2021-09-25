% fΪ�����ͼƬ�������ǻҶ�ͼ����Ϊ����������ȡ�ǻҶȵ�����������
% matlab�н���һ��function��M�ļ���������Ĵ������оͿ����ˡ�

function [t]=Texture(f,scale)  
if nargin==1  
    scale(1:6)=1;  
else  
    scale=scale(1:6)';  
end  
p=imhist(f);                  %p��256*1��������  
p=p./numel(f);  
L=length(p);  
[v,mu]=statmoments(p,3);  
%����������������  
t(1)=mu(1);                   %ƽ��ֵ  
t(2)=mu(2).^0.5;              %��׼��   
varn=mu(2)/(L-1)^2;       
t(3)=1-1/(1+varn);            %ƽ��������Ϊ��0~1������ͨ�����ԣ�L-1��^2��������׼��  
t(4)=mu(3)/(L-1)^2;           %���׾أ�ͨ�����ԣ�L-1��^2��������׼����  
t(5)=sum(p.^2);               %һ����  
t(6)=-sum(p.*(log2(p+eps)));  %��  
T=[t(1) t(2) t(3) t(4) t(5) t(6)];  
%����ֵ��Ĭ��Ϊ1  
t=t.*scale;  
end  
  
function [v,unv]=statmoments(p,n)  
Lp=length(p);  
if (Lp~=256)&&(Lp~=65536)  
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
        unv(j)=((z*G).^j)*p;  
    end  
end  
end  