%% ����ѵ������
clear,clc
score_matrix=importdata('Rating_test.mat');

%% �������־���
[number_user,number_movies]=size(score_matrix);

%ÿ����ӰƬ���ƶȾ���1642*1642ά
Sim_matrix=zeros(number_movies,number_movies);

tic;
%ͨ�����־������ÿ����ӰƬ֮������ƶ�
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_ab(score_matrix,i,j);
    end
end
toc;
%% �������ƶȾ���
Sim_matrix=Sim_matrix'+Sim_matrix;%�����������ƶȾ���(ԭ������Ϊ���Ǿ���)
value_1_index=find(Sim_matrix>=0.9999);%�ҳ�Sim_matrix�������������ƶ�Ϊ1��ֵ��
Sim_matrix(value_1_index)=0;%���������ƶ�Ϊ1��ֵ��0����-self

save('Sim_matrix.mat','Sim_matrix');