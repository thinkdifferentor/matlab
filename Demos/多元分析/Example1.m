% ���� 5 ������Ա w1, w2, w3, w4, w5 �����ǵ�����ҵ���ɶ�ά���� (v1,v2) ����
% �� 1 ����Աҵ����
% ����Ա v1 �����������ټ� v2 �����տ����Ԫ
% w1 1 0
% w2 1 1
% w3 3 2
% w4 4 3
% w5 2 5


clc,clear
%ԭʼ����
a=[1,0; 1,1; 3,2; 4,3; 2,5];

%mΪԱ���ĸ���
[m,n]=size(a);

%�������
d=zeros(m,m);

%����ԭʼ��������������֮��ľ���
for i=1:m
    for j=i+1:m
        d(i,j)=mandist(a(i,:),a(j,:)');
    end
end

%�������
d;

%ȡ����ķ���Ԫ��-��þ��������
nd=nonzeros(d);

%��ndȡ������-��ȥnd����ͬ�ľ���õ���ͬ���������
nd=union(nd,nd);

for i=1:m-1
    %�ҵ���С��������
    nd_min=min(nd);
    
    %��С����������������
    [row,col]=find(d==nd_min);
    tm=union(row,col);
    tm=reshape(tm,1,length(tm));
    %���������{}����������
    s(i)={char(['��',int2str(i),'�κϳɣ�ƽ̨�߶�Ϊ',num2str(nd_min),'ʱ�ķ�����Ϊ�� ',int2str(tm)])};
    
    %ɾȥ���������С����
    nd(find(nd==nd_min))=[];
    
    %û��������
    if (length(nd)==0)
        break
    end
end

%���������
s(:)




%ͳ�ƹ�����
clc,clear
a=[1,0;1,1;3,2;4,3;2,5];

% Y=pdist(X)���� m �� n ����X�������� m ����СΪ n ��������������������ŷ�Ͼ��롣
y=pdist(a,'cityblock');

% squareform������һά����任Ϊ��Ӧ��M*N����ʽ
yc=squareform(y);

 
% Z=linkage(Y,��method��)ʹ���ɡ�method��ָ�����㷨�������ɾ���������method����ȡ���������ַ���ֵ�� 
% 
%          ��method��ȡֵ������ 
%        �ַ���          ��  �� 
%     ��single��       ��̾��루ȱʡ�� 
%     ��complete��      ������ 
%     ��average��      ƽ������ 
%     ��centroid��      ���ľ��� 
%     ��ward��      ���ƽ���ͷ�����Ward������
z=linkage(y);


% ����ֻ�ж���p���ڵ�ı���ͼ����ϵͼ��
[h,t]=dendrogram(z)



