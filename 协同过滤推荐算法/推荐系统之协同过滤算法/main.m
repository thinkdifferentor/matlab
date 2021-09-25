%% 载入训练数据
clear,clc
load u1.base
%% 数据预处理 
%  提取数据的前三列，即用户序号、被该用户评价电影序号、评价分值
[m,n]=size(u1);
test=zeros(m,3);
for i=1:3
    test(:,i)=u1(:,i);
end
%% 建立评分矩阵
number_user=max(test(:,1));
number_movies=max(test(:,2));
score_matrix=zeros(number_user,number_movies);%评分矩阵943*1682维
for i=1:m
    score_matrix(test(i,1),test(i,2))=test(i,3);
end
Sim_matrix=zeros(number_movies,number_movies);%相似度矩阵1642*1642维
tic;
%计算评分矩阵
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_ab(score_matrix,i,j);
    end
end
toc;
%% 建立相似度矩阵
% function Neibor=neibor_select(Sim_matrix,a,n)
neibor_num=10;%邻居的大小
Sim_matrix=Sim_matrix'+Sim_matrix;%求完整的相似度矩阵
%neibor_sim_matrix_temp为排好序的相似度矩阵
%neibor_matrix_temp各个相似度所对应的电影，也就是我们要找的邻居
value_1_index=find(Sim_matrix>=0.9999);%找出Sim_matrix矩阵中所有相似度为1的值，
                                       %因为可能是错误值，后期选择邻居不应考虑。
%为什么不是value_1_index=find(Sim_matrix==1)这样有部分1不能正确找出，可以试试看
Sim_matrix(value_1_index)=0;%将所有相似度为1的值用0代替
% [neibor_sim_matrix_temp,neibor_matrix_temp]=sort(Sim_matrix,2,'descend');
% neibor_sim_matrix=zeros(number_movies,neibor_num);
% neibor_matrix=zeros(number_movies,neibor_num);
% for i=1:neibor_num
%     neibor_sim_matrix(:,i)=neibor_sim_matrix_temp(:,i);%每个邻居对应的相似度
%     neibor_matrix(:,i)=neibor_matrix_temp(:,i);%邻居
% end
%% 载入测试集作预测
load u1.test

[m,n]=size(u1);
test=zeros(m,3);
for i=1:3
    test(:,i)=u1(:,i);
end
Predict_score=zeros(m,1);
for j=1:m
P_u=find(score_matrix(test(j,1),:)~=0);%找出该用户评价的电影集合
[~,num]=size(P_u);%计算该用户评价的电影个数
%%%%%%%%%%%计算邻居%%%%%%%%%%%%
neibor_num=10;%最大为4
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
sum_score=sum(score_matrix(test(j,1),:),2);%该用户对所有电影的总评分
aver_score=sum_score/num;%该用户对电影的平均评分
sum1=0;
sum2=0;
for i=1:neibor_num
    sum1=sum1+Sim_matrix(test(j,2),neibor(i))*(score_matrix(test(j,1),neibor(i))-aver_score);
    sum2=sum2+Sim_matrix(test(j,2),neibor(i));
end
if sum2==0
    Predict_score(j,1)=round(aver_score);%排除分母为零的情况
else
Predict_score(j,1)=round(aver_score+sum1/sum2);
%确保预测值为1~5的评分数
if Predict_score(j,1)>5
    Predict_score(j,1)=5;
elseif Predict_score(j,1)<1
    Predict_score(j,1)=1;
end
end
end
%% 计算RMSE
Eval=zeros(m,3);
Eval(:,1)=test(:,3);
Eval(:,2)=Predict_score(:,1);
Eval(:,3)=abs(test(:,3)-Predict_score(:,1));
RMSE=sqrt(Eval(:,3)'*Eval(:,3)/m);
