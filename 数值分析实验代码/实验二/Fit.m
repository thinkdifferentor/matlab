% 数据
x=[0   5    10    15    20    25    30    35    40    45    50    55];
y=[0  1.27e-4  2.16e-4  2.86e-4  3.44e-4  3.87e-4  4.15e-4  4.37e-4  4.51e-4  4.58e-4  4.02e-4  4.64e-4];

% figure('name','一次多项式拟合：');
% a=polyfit(x,y,1);
% x1=0:0.01:55;
% y1=a(1)*x1+a(2); 
% plot(x,y,'*',x1,y1,'r');


% Linear model Poly1:
%        f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =  7.276e-006  (4.589e-006, 9.963e-006)
%        p2 =   0.0001322  (4.491e-005, 0.0002194)
% 
% Goodness of fit:
%   SSE: 5.199e-008
%   R-square: 0.7845
%   Adjusted R-square: 0.763
%   RMSE: 7.211e-005


figure('name','二次多项式拟合:');
b=polyfit(x,y,2);
x2=0:0.01:55;
y2=b(1)*x2.^2+b(2)*x2+b(3);
plot(x,y,'*',x2,y2,'r');



% Linear model Poly2:
%        f(x) = p1*x^2 + p2*x + p3
% Coefficients (with 95% confidence bounds):
%        p1 = -2.381e-007  (-2.948e-007, -1.813e-007)
%        p2 =  2.037e-005  (1.713e-005, 2.361e-005)
%        p3 =  2.305e-005  (-1.526e-005, 6.135e-005)
% 
% Goodness of fit:
%   SSE: 4.72e-009
%   R-square: 0.9804
%   Adjusted R-square: 0.9761
%   RMSE: 2.29e-005


figure('name','最小二乘拟合:');
c=polyfit(x,y,3);
x3=0:0.01:55;
y3=c(1)*x3.^3+c(2)*x3.^2+c(3)*x3+c(4);
plot(x,y,'*',x3,y3,'-r');


% Linear model Poly3:
%        f(x) = p1*x^3 + p2*x^2 + p3*x + p4
% Coefficients (with 95% confidence bounds):
%        p1 =  3.436e-009  (3.563e-010, 6.517e-009)
%        p2 = -5.216e-007  (-7.797e-007, -2.634e-007)
%        p3 =  2.634e-005  (2.039e-005, 3.229e-005)
%        p4 =  1.784e-006  (-3.43e-005, 3.787e-005)
% 
% Goodness of fit:
%   SSE: 2.583e-009
%   R-square: 0.9893
%   Adjusted R-square: 0.9853
%   RMSE: 1.797e-005


%误差计算
%通过拟合函数计算
x4=[0   5    10    15    20    25    30    35    40    45    50    55];
y4=c(1)*x4.^3+c(2)*x4.^2+c(3)*x4+c(4);

%与原数据对比
R=y4-y


















