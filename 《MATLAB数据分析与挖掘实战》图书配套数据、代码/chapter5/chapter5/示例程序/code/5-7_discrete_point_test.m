%% ����K-Means�������ɢ����
clear ;
% ������ʼ��
inputfile = '../data/consumption_data.xls'; % ������������������
k = 3; % ��������
iteration =500 ; % �������ѭ������
distance = 'sqEuclidean'; % ���뺯��
threshold = 20; % ��ɢ����ֵ

%% ��ȡ����
[num,txt]=xlsread(inputfile);
data = num(:,2:end);

%% ���ݱ�׼��
data = zscore(data);

%% ����kmeans�㷨
opts = statset('MaxIter',iteration);
[IDX,C,~,D] = kmeans(data,k,'distance',distance,'Options',opts);

%% ��ͼ�鿴���
min_d = min(D,[],2);
x=1:length(min_d);
threshold_=x;
threshold_(:)=threshold;
figure
hold on
plot(x,min_d,'ko');
plot(x,threshold_,'k-');
for i=1:length(min_d)
    if min_d(i)>threshold
        plot(i,min_d(i),'k*')
        text(i+7,min_d(i)+2,num2str(min_d(i)));
    end
end
title('��ɢ����');
ylabel('�������');
xlabel('������');
hold off

disp('����K-Means�������ɢ������ɣ�');