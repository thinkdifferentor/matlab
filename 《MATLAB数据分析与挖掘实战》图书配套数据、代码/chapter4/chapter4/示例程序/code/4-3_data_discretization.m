%% ������ɢ��
clear;
% ������ʼ����
data = '../data/discretization_data.xls';
k = 4; 

%% ��ȡ����
[data,~] = xlsread(data);
rows = size(data,1);
%% �ȿ���ɢ��
% ������Ҫ�Զ���
rules = [0,0.179,0.258,0.35,0.504];
width_data = zeros(rows,2);
width_data(:,1) = data;
width_data(:,2)= arrayfun(@find_type,data);

%% ��Ƶ��ɢ��
frequent_data = zeros(rows,2);
frequent_data(:,1) = data;
end_ =-1;
for i=1:k-1
    start_ = floor((i-1)*rows/k)+1;
    end_ = floor(i*rows/k);
    frequent_data(start_:end_,2) = i;
end
frequent_data(end_+1:end,2) = k;

%% ������ɢ��
[idx,~] = kmeans(data,k);
cluster_data = zeros(rows,2);
cluster_data(:,1) = data;
cluster_data(:,2) = idx;

%% ��ͼչʾ���
figure
cust_subplot(width_data,3,1,1,k,'�ȿ���ɢ��');
cust_subplot(frequent_data,3,1,2,k,'��Ƶ��ɢ��');
cust_subplot(cluster_data,3,1,3,k,'������ɢ��');
disp('������ɢ����ɣ�');