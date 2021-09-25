%% ���ݹ淶��
clear;
% ������ʼ����
data = '../data/normalization_data.xls';

%% ��ȡ����
[data,~] = xlsread(data);

%% ��С-���淶��
data_scatter = mapminmax(data',0,1); % ������Ҫת��
data_scatter = data_scatter';

%% ��-��ֵ�淶��
data_zscore = zscore(data);

%% С������淶��
max_ = max(abs(data));
max_ = power(10,ceil(log10(max_)));
cols = size(max_,2);
data_dot = data;
for i=1:cols
    data_dot(:,i)=data(:,i)/max_(1,i);
end

%% ��ӡ���
disp('ԭʼ����Ϊ��');
disp(data);
disp('��С-���淶���������Ϊ��');
disp(data_scatter);
disp('��-��ֵ�淶���������Ϊ��');
disp(data_zscore);
disp('С������淶���������Ϊ��');
disp(data_dot);