% ����ͬ�ļ����ڵ��ı��ļ������ļ�����Ϊ������ȡ����
clc
clear

load Data.txt;

% ��ȡ�������
high=Data(:,1:2:9);
% ����ȡ��������ݱ��һ��
high2=high(:);


weight=Data(:,2:2:10);
weight2=weight(:);

 
% [N,X] = hist(Y,M)
% �õ����飨�С��о��ɣ� Y ��Ƶ������������[min(Y),max(Y)]�ȷ�Ϊ M �ݣ�ȱʡʱ
% M �趨Ϊ 10���� N ���� M ��С�����Ƶ���� X ���� M ��С������е㡣
[n1,x1]=hist(high);
[n2,x2]=hist(weight);

figure;
subplot(1,2,1);
hist(high);
title('���');

subplot(1,2,2);
hist(weight);
title('����');


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