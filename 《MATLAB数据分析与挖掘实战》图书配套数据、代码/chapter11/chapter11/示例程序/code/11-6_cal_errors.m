%% ����Ԥ�����
clear;
% ������ʼ��
file = '../data/predictdata.xls';

%% ��ȡ����
[num,txt] = xlsread(file);

%% �������
abs_ =abs(num(:,2)-num(:,3));
% mae
mae_=mean(abs_);
% rmse
rmse_ = mean(power(abs_,2));
% mape
mape_ = mean(abs_./num(:,3));

%% ��ӡ���
disp(['ƽ���������Ϊ��' num2str(mae_) ', ���������Ϊ��' num2str(rmse_) ...
    ', ƽ�����԰ٷ����Ϊ��' num2str(mape_)]);
disp('��������ɣ�');

