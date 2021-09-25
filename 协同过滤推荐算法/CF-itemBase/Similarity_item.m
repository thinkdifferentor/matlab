%利用Adjusted Cosine法计算电影a和b的相似度
%这个算法虽然可以求出相似度矩阵，但是有个问题就是，当共同评价电影a和b的用户
%只有一个的时候，结果只有两种可能，即1或者是-1。这就需要在找邻居时要避免选择
%这些情况的相似度电影。

function Sim_ab=Similarity_item(score_matrix,a,b)
%找出所有评价所电影a和b的用户集合(标号)
temp=score_matrix(:,a)&score_matrix(:,b);
P_ab=find(temp);

%用行向量存储所有评价电影a和b的用户
P_ab=P_ab';

% 利用Adjusted Cosine法计算相似度
if isempty(P_ab)
    Sim_ab=0;
else
    [~,temp]=size(P_ab);%共同评价电影a和b的用户的数目
    %[~,number_movies]=size(score_matrix);
    sum1=0;
    sum2=0;
    sum3=0;
    for i=1:temp
        [~,m]=size(find(score_matrix(P_ab(i),:)~=0));%计算该用户评价的电影个数
        sum_score=sum(score_matrix(P_ab(i),:),2);%用户对所有电影的总评分
        aver_score=sum_score/m;
        sum1=sum1+(score_matrix(P_ab(i),a)-aver_score)*(score_matrix(P_ab(i),b)-aver_score);
        sum2=sum2+(score_matrix(P_ab(i),a)-aver_score)^2;
        sum3=sum3+(score_matrix(P_ab(i),b)-aver_score)^2;
    end
    if sum2==0||sum3==0
        Sim_ab=0;
    else
        Sim_ab=sum1/sqrt(sum2*sum3);
    end
end