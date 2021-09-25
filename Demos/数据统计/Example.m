% 载入同文件夹在的文本文件并以文件名作为参数读取数据
clc
clear

load Data.txt;

% 获取身高数据
high=Data(:,1:2:9);
% 将获取的身高数据变成一列
high2=high(:);


weight=Data(:,2:2:10);
weight2=weight(:);

 
% [N,X] = hist(Y,M)
% 得到数组（行、列均可） Y 的频数表。它将区间[min(Y),max(Y)]等分为 M 份（缺省时
% M 设定为 10）， N 返回 M 个小区间的频数， X 返回 M 个小区间的中点。
[n1,x1]=hist(high);
[n2,x2]=hist(weight);

figure;
subplot(1,2,1);
hist(high);
title('身高');

subplot(1,2,2);
hist(weight);
title('体重');


%   x = linspace(0,10);
% 
%   y1 = sin(x);
% 
%   y2 = sin(2*x);
% 
%   y3 = sin(4*x);
% 
%   y4 = sin(8*x);
% 
%    figure
% 
%   subplot(2,2,1);
% 
%   plot(x,y1);
% 
%   title('Subplot 1: sin(x)')
% 
%   xlabel('x'),ylabel('y1')
% 
%   subplot(2,2,2);
% 
%   plot(x,y2);
% 
%   title('Subplot 2: sin(2x)')
% 
%   xlabel('x'),ylabel('y2')
% 
%   subplot(2,2,3)
% 
%   plot(x,y3);
% 
%   title('Subplot 3: sin(4x)')
% 
%   xlabel('x'),ylabel('y3')
% 
%   subplot(2,2,4)
% 
%   plot(x,y4);
% 
%   title('Subplot 4: sin(8x)')
% 
%   xlabel('x'),ylabel('y4')