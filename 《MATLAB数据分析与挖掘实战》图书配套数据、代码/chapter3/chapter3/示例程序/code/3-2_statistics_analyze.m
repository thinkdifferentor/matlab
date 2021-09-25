%% ������������ͳ��������
clear;
% ��ʼ������
catering_sale = '../data/catering_sale.xls'; % ��������
index = 1; % �������������� 

%% ��������
[num,txt] = xlsread(catering_sale);
sales = num(2:end,index);
sales = de_missing_abnormal(sales,index);

%% ͳ��������
% ��ֵ
mean_ = mean(sales);
% ��λ��
median_ = median(sales);
% ����
mode_ = mode(sales);
% ����
range_ = range(sales);
% ��׼��
std_ = std(sales);
% ����ϵ��
variation_ = std_/mean_;
% �ķ�λ�����
q1 = prctile(sales,25);
q3 = prctile(sales,75);
distance = q3-q1;

%% ��ӡ���
disp(['�������ݾ�ֵ��' num2str(mean_) ',��λ����' num2str(median_) ',����:' ...
    num2str(mode_) ',���' num2str(range_) ',��׼�' num2str(std_) ...
    ',����ϵ����' num2str(variation_) ',�ķ�λ��ࣺ' num2str(distance)]);
disp('��������ͳ����������ɣ�');