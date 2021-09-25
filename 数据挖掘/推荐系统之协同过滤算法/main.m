%% ����ѵ������
clear,clc
load u1.base
%% ����Ԥ���� 
%  ��ȡ���ݵ�ǰ���У����û���š������û����۵�Ӱ��š����۷�ֵ
[m,n]=size(u1);
test=zeros(m,3);
for i=1:3
    test(:,i)=u1(:,i);
end
%% �������־���
number_user=max(test(:,1));
number_movies=max(test(:,2));
score_matrix=zeros(number_user,number_movies);%���־���943*1682ά
for i=1:m
    score_matrix(test(i,1),test(i,2))=test(i,3);
end
Sim_matrix=zeros(number_movies,number_movies);%���ƶȾ���1642*1642ά
tic;
%�������־���
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_ab(score_matrix,i,j);
    end
end
toc;
%% �������ƶȾ���
% function Neibor=neibor_select(Sim_matrix,a,n)
neibor_num=10;%�ھӵĴ�С
Sim_matrix=Sim_matrix'+Sim_matrix;%�����������ƶȾ���
%neibor_sim_matrix_tempΪ�ź�������ƶȾ���
%neibor_matrix_temp�������ƶ�����Ӧ�ĵ�Ӱ��Ҳ��������Ҫ�ҵ��ھ�
value_1_index=find(Sim_matrix>=0.9999);%�ҳ�Sim_matrix�������������ƶ�Ϊ1��ֵ��
                                       %��Ϊ�����Ǵ���ֵ������ѡ���ھӲ�Ӧ���ǡ�
%Ϊʲô����value_1_index=find(Sim_matrix==1)�����в���1������ȷ�ҳ����������Կ�
Sim_matrix(value_1_index)=0;%���������ƶ�Ϊ1��ֵ��0����
% [neibor_sim_matrix_temp,neibor_matrix_temp]=sort(Sim_matrix,2,'descend');
% neibor_sim_matrix=zeros(number_movies,neibor_num);
% neibor_matrix=zeros(number_movies,neibor_num);
% for i=1:neibor_num
%     neibor_sim_matrix(:,i)=neibor_sim_matrix_temp(:,i);%ÿ���ھӶ�Ӧ�����ƶ�
%     neibor_matrix(:,i)=neibor_matrix_temp(:,i);%�ھ�
% end
%% ������Լ���Ԥ��
load u1.test

[m,n]=size(u1);
test=zeros(m,3);
for i=1:3
    test(:,i)=u1(:,i);
end
Predict_score=zeros(m,1);
for j=1:m
P_u=find(score_matrix(test(j,1),:)~=0);%�ҳ����û����۵ĵ�Ӱ����
[~,num]=size(P_u);%������û����۵ĵ�Ӱ����
%%%%%%%%%%%�����ھ�%%%%%%%%%%%%
neibor_num=10;%���Ϊ4
P_u_sim=Sim_matrix(test(j,2),P_u);
[temp,index]=sort(P_u_sim,2,'descend');
[~,num1]=size(index);
if num1>=neibor_num 
neibor=(P_u(index(1:neibor_num)));
else
    neibor=(P_u(index));
    neibor_num=num1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sum_score=sum(score_matrix(test(j,1),:),2);%���û������е�Ӱ��������
aver_score=sum_score/num;%���û��Ե�Ӱ��ƽ������
sum1=0;
sum2=0;
for i=1:neibor_num
    sum1=sum1+Sim_matrix(test(j,2),neibor(i))*(score_matrix(test(j,1),neibor(i))-aver_score);
    sum2=sum2+Sim_matrix(test(j,2),neibor(i));
end
if sum2==0
    Predict_score(j,1)=round(aver_score);%�ų���ĸΪ������
else
Predict_score(j,1)=round(aver_score+sum1/sum2);
%ȷ��Ԥ��ֵΪ1~5��������
if Predict_score(j,1)>5
    Predict_score(j,1)=5;
elseif Predict_score(j,1)<1
    Predict_score(j,1)=1;
end
end
end
%% ����RMSE
Eval=zeros(m,3);
Eval(:,1)=test(:,3);
Eval(:,2)=Predict_score(:,1);
Eval(:,3)=abs(test(:,3)-Predict_score(:,1));
RMSE=sqrt(Eval(:,3)'*Eval(:,3)/m);
