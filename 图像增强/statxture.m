function [t]=statxture(f,scale)
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
T=[t(1) t(2) t(3) t(4) t(5) t(6)]
%����ֵ��Ĭ��Ϊ1
t=t.*scale;