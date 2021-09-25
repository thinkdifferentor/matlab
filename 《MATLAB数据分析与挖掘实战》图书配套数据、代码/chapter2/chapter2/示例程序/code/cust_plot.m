%% ������ͼ
clear;
% ��ʼ������
tsfile = '../data/time_series.xls'; % ʱ����������·����
tspic = '../tmp/time_series.png' ;  % ʱ������ͼ����·����

%% ��ȡʱ������
[num,txt] = xlsread(tsfile);

%% ������ͼ
h=figure ;
set(h,'Visible','off'); % ֱ�ӱ��棬���赯��
plot(num(:,1),num(:,2),'-ok'); % ʹ��-o���ӣ���ɫΪ��ɫ
xlabel(txt{1,1});
ylabel(txt{1,2});
title('ʱ������ͼ');

%% ����ͼƬ
print(h,'-dpng',tspic);