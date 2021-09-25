%采用高精度Lobatto积分法，格式： z = quadl(Fun,a,b)
clc;clear;

% P_1 =0.0014 t^4-0.0381t^3+0.261t^2+0.2935 t+15.11;
% P_2 =0.0031 t^4-0.1013 t^3+1.009 t^2-2.765 t+13.19;
%?P=-0.0017 t^4+0.0631 t^3-0.7484 t^2-3.0585 t+1.9255;
%L = quadl('-0.0017*t^4+0.0631*t^3-0.7484*t^2+3.0585*t+1.9255 ',0,x);
%fun=inline('-0.0017*t^4+0.0631*t^3-0.7484*t^2+3.0585*t+1.9255 ','t');
%L = quadl(fun,0,x);

%P=-0.0103 t^4+0.212 t^3-1.474 t^2+5.9591 t-1.8636

m=4.5;
x=input('Please input time:');
syms t
y =- 0.00034*t^5 + 0.015775*t^4 - 0.249467*t^3 + 1.52925*t^2 + 1.9255*t;

L1=subs(y,t,0);
L2=subs(y,t,x);

L=(L2-L1)*m;
disp(['The lenght of fleet is :',L]);