%% ������������ȱʧֵ���쳣ֵ���
clear;
% ��ʼ������
catering_sale = '../data/catering_sale.xls'; % ��������
index = 1; % �������������� 

%% ��������
[num,txt] = xlsread(catering_sale);
sales =num(2:end,index);
rows = size(sales,1);

%% ȱʧֵ��� ����ӡ���
nanvalue = find(isnan( sales));
if isempty(nanvalue) %  û��ȱʧֵ
    disp('û��ȱʧֵ��');
else
    rows_ = size(nanvalue,1);
    disp(['ȱʧֵ����Ϊ��' num2str(rows_) ',ȱʧ��Ϊ��' num2str(rows_/rows) ]);
end

%% �쳣ֵ��� 
% ����ͼ���½�
q_= prctile(sales,[25,75]);
p25=q_(1,1);
p75=q_(1,2);
upper = p75+ 1.5*(p75-p25);
lower = p25-1.5*(p75-p25);
upper_indexes = sales(sales>upper);
lower_indexes = sales(sales<lower);
indexes =[upper_indexes;lower_indexes];
indexes = sort(indexes);
% ����ͼ
figure
hold on;
boxplot(sales,'whisker',1.5,'outliersize',6);
rows = size(indexes,1);
flag =0;
for i =1:rows
  if flag ==0
    text(1+0.01,indexes(i,1),num2str(indexes(i,1)));
    flag=1;
  else
      text(1-0.017*length(num2str(indexes(i,1))),indexes(i,1),num2str(indexes(i,1)));
    flag=0;
  end
end
hold off;
disp('������������ȱʧֵ���쳣ֵ�����ɣ�');