% ������
clear,clc;

%��ȡ�û�id�б�
users = load('u.user');
%��ȡ�û���
[userNum,v]=size(users);

%��ÿһλ�û��Ƽ���Ӱ
for i=1:2
    recommendMatrix{:,i}=recommend(i);
end

%�Ƽ����ݱ���
save('recommendMatrix.mat','recommendMatrix');