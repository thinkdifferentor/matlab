% ����item��Эͬ�����Ƽ��㷨MATLABʵ�ֵ�����
% �����Ƽ�������ÿ���û����Ƽ�ϵ����������Ƽ����
clc,clear;

% �����Ƽ�����
Predict_score=importdata('Predict_score.mat');

%ȷ������Ƽ�ӰƬ��Ŀ
top=10;

% ��ȡ�û�����ӰƬ��
[usersNum,itemNum] = size(Predict_score);

% ����ӰƬ�Ƽ�����
Predict={};

% ��¼�Ƽ�ָ��
Recommend=[];

% ��ʼ��ѯ�Ƽ�
for i=1:usersNum
    [Recommend(i,:),index]=Top_N(Predict_score(i,:),top);
    Predict{i}=Find(index);
end


%���ݴ洢
save('Recommend.mat','Recommend');
save('Predict.mat','Predict');
