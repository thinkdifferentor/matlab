%% ��Ʒӯ������ ������ͼ
clear;
% ��ʼ������
dish_profit = '../data/catering_dish_profit.xls'; % ������Ʒӯ������

%% ��������
[num,txt,raw] = xlsread(dish_profit);

%% ������ͼ��ͼ
rows = size(num,1);
hold on;
% �����ۼ�ϵ��
yy_ = cumsum(num(:,end));
yy=yy_/yy_(end)*100;
[hAx,hLine1,hLine2]=plotyy(1:rows,num(:,end),1:rows,yy,'bar','plot');
set(hAx(1),'XTick',[])%ȥ��x��Ŀ̶�
set(hLine1,'BarWidth',0.5);
set(hAx(2), 'XTick', 1:rows);  
set(hAx(2),'XTickLabel',raw(2:end,2));
ylabel(hAx(1),'ӯ����Ԫ') % left y-axis
ylabel(hAx(2),'�ۼưٷֱȣ�%') % right y-axis
set(hLine2,'LineStyle','-')
set(hLine2,'Marker','d')
% ��� 80% ��
index = find(yy>=80);
plot(index(1),yy(index(1))*100,'d', 'markerfacecolor', [ 1, 0, 0 ] );
text(index(1),yy(index(1))*93,[num2str(yy(index(1))) '%'] );
hold off;

disp('������Ʒӯ������������ͼ��ͼ��ɣ�');