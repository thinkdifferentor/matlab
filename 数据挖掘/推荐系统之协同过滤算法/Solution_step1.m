%% 载入训练数据
clear,clc
score_matrix=importdata('Rating_test.mat');

%% 建立评分矩阵
[number_user,number_movies]=size(score_matrix);

%每两个影片相似度矩阵1642*1642维
Sim_matrix=zeros(number_movies,number_movies);

tic;
%通过评分矩阵计算每两个影片之间的相似度
for i=1:number_movies-1
    for j=i+1:number_movies
        Sim_matrix(i,j)=Similarity_ab(score_matrix,i,j);
    end
end
toc;
%% 建立相似度矩阵
Sim_matrix=Sim_matrix'+Sim_matrix;%求完整的相似度矩阵(原本矩阵为三角矩阵)
value_1_index=find(Sim_matrix>=0.9999);%找出Sim_matrix矩阵中所有相似度为1的值，
Sim_matrix(value_1_index)=0;%将所有相似度为1的值用0代替-self

save('Sim_matrix.mat','Sim_matrix');