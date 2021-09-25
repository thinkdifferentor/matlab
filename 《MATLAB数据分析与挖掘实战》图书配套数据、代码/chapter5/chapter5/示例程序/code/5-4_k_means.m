%% ʹ��K-Means�㷨����������Ϊ��������
clear ;
% ������ʼ��
inputfile = '../data/consumption_data.xls'; % ������������������
k = 3; % ��������
iteration =500 ; % �������ѭ������
distance = 'sqEuclidean'; % ���뺯��

%% ��ȡ����
[num,txt]=xlsread(inputfile);
data = num(:,2:end);

%% ���ݱ�׼��
data = zscore(data);

%% ����kmeans�㷨
opts = statset('MaxIter',iteration);
[IDX,C,~,D] = kmeans(data,k,'distance',distance,'Options',opts);

%% ��ӡ���
for i=1:k
   disp(['��' num2str(i) '���������Ϊ��']);
   disp(C(i,:));
end

disp('K-Means�����㷨��ɣ�');