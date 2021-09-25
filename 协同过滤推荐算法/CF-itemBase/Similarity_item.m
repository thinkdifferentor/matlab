%����Adjusted Cosine�������Ӱa��b�����ƶ�
%����㷨��Ȼ����������ƶȾ��󣬵����и�������ǣ�����ͬ���۵�Ӱa��b���û�
%ֻ��һ����ʱ�򣬽��ֻ�����ֿ��ܣ���1������-1�������Ҫ�����ھ�ʱҪ����ѡ��
%��Щ��������ƶȵ�Ӱ��

function Sim_ab=Similarity_item(score_matrix,a,b)
%�ҳ�������������Ӱa��b���û�����(���)
temp=score_matrix(:,a)&score_matrix(:,b);
P_ab=find(temp);

%���������洢�������۵�Ӱa��b���û�
P_ab=P_ab';

% ����Adjusted Cosine���������ƶ�
if isempty(P_ab)
    Sim_ab=0;
else
    [~,temp]=size(P_ab);%��ͬ���۵�Ӱa��b���û�����Ŀ
    %[~,number_movies]=size(score_matrix);
    sum1=0;
    sum2=0;
    sum3=0;
    for i=1:temp
        [~,m]=size(find(score_matrix(P_ab(i),:)~=0));%������û����۵ĵ�Ӱ����
        sum_score=sum(score_matrix(P_ab(i),:),2);%�û������е�Ӱ��������
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