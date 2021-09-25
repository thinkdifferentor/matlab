%% ���������
clear;
% ������ʼ��
scorefile = '../data/score.xls' ; 
userinfo= '../data/user_information.xls' ;
correlationfile = '../tmp/correlation.xls';
filesnum = 7818 ; % �ļ���

%% ��ȡ����
[score,score_txt] = xlsread(scorefile);
[user,user_txt] = xlsread(userinfo);
[rows,cols] = size(score);
[user_rows,user_cols] = size(user);
%% ���������
%���ĵ����з���
score_trans= zeros(rows,1);
for i=1:rows
    if score(i,19)>10^(-4);  % ��ֵ��Ϊ10^(-4)
        score_trans(i,1)=score(i,20);
    else
        score_trans(i,1)=0;
    end
end
%����ÿ���û���������ĵ�ƪ��
sum_user = zeros(user_rows,1);
for i=1:user_rows     
    k=0;
    for j=1:rows
        if score_trans(j,1)==user(i,1)
            k=k+1;
        end
    end
    sum_user(i,1)=k;
end
%������û���������Դ�Ĺ�����
d=sum_user/filesnum;
corr=[user(:,1) sum_user d];
corr=sortrows(corr,-3); % ����

%% ����д��
xlswrite(correlationfile,[{'ID','�����ĵ���','������'};num2cell(corr)]);
disp('�����ȼ�����ɣ�');
