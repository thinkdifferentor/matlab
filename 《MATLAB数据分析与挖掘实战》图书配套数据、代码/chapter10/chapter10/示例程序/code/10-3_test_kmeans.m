%% �û����ݾ������
clear ;
% ������ʼ��
inputfile = '../data/cluster_data.xls';
data_type = '../tmp/cluster_data_type.xls';
picoutput_prefix = '../tmp/pd_'; % �����ܶ�ͼ�ļ���ǰ׺
k=3; % �������

%% ��ȡ����
[num,txt,raw] = xlsread(inputfile);
data = num(:,2:end);
data_ = zscore(data); % ���ݱ�׼��

%% K-Means����
[idx,center] = kmeans(data_,k);

%% ��������
all_data = [data,idx];

%% ��ӡ���������������ܶ�ͼ��ԭʼ�����������
for i=1:k
   data_i = all_data(all_data(:,end)==i,:);
   rows = size(data_i,1);
   disp(['�ͻ�Ⱥ' num2str(i) ', �û�����' num2str(rows) ', �������ģ�' num2str(center(i,:))]);
   % �������ܶ�ͼ,�Զ��庯��
   cust_ksdensity(data_i(:,1:end-1),i,picoutput_prefix,txt(1,2:end));
end
xlswrite(data_type,[raw,['�������';num2cell(idx)]]);
disp('�û����������ɣ�');