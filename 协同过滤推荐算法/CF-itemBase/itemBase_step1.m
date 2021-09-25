% ����item��Эͬ�����Ƽ��㷨MATLABʵ�ֵ�һ��
% �����û������������ݵó����ƾ���
clear,clc

% ����������������
Scores_data=importdata('u1.base');

% ����Ԥ����--�õ��û������־���--ע�������� 
% ��ȡ���ݵ�ǰ���У����û���š������û�����ӰƬ��š����۷�ֵ
[m,n]=size(Scores_data);
test=zeros(m,3);
for i=1:3
    test(:,i)=Scores_data(:,i);
end

% �������־���
number_user=max(test(:,1));
number_movies=max(test(:,2));

%���־���943*1682ά
score_matrix=zeros(number_user,number_movies);
for i=1:m
    score_matrix(test(i,1),test(i,2))=test(i,3);
end

%�������ƾ���ÿ����ӰƬ���ƶȾ���1642*1642ά
Sim_matrix=zeros(number_movies,number_movies);

tic;
%ͨ�����־������ÿ����ӰƬ֮������ƶ�
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_item(score_matrix,i,j);
    end
end
toc;

% �������ƶȾ���
Sim_matrix=Sim_matrix'+Sim_matrix;%�����������ƶȾ���(ԭ������Ϊ���Ǿ���)
value_1_index=find(Sim_matrix>=0.9999);%�ҳ�Sim_matrix�������������ƶ�Ϊ1��ֵ��
Sim_matrix(value_1_index)=0;%���������ƶ�Ϊ1��ֵ��0����-�����ƾ��������Լ����Ƶ���Ʒ���ƶ���Ϊ1

%item���ƾ������ݱ���
save('Sim_matrix','Sim_matrix.mat');
