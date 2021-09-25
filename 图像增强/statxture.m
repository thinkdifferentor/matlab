function [t]=statxture(f,scale)
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
T=[t(1) t(2) t(3) t(4) t(5) t(6)]
%缩放值，默认为1
t=t.*scale;