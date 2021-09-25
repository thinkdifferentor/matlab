% f为输入的图片，必须是灰度图像。因为纹理特征提取是灰度的纹理特征。
% matlab中建立一个function的M文件拷贝上面的代码运行就可以了。

function [t]=Texture(f,scale)  
if nargin==1  
    scale(1:6)=1;  
else  
    scale=scale(1:6)';  
end  
p=imhist(f);                  %p是256*1的列向量  
p=p./numel(f);  
L=length(p);  
[v,mu]=statmoments(p,3);  
%计算六个纹理特征  
t(1)=mu(1);                   %平均值  
t(2)=mu(2).^0.5;              %标准差   
varn=mu(2)/(L-1)^2;       
t(3)=1-1/(1+varn);            %平滑度首先为（0~1）区间通过除以（L-1）^2将变量标准化  
t(4)=mu(3)/(L-1)^2;           %三阶矩（通过除以（L-1）^2将变量标准化）  
t(5)=sum(p.^2);               %一致性  
t(6)=-sum(p.*(log2(p+eps)));  %熵  
T=[t(1) t(2) t(3) t(4) t(5) t(6)];  
%缩放值，默认为1  
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