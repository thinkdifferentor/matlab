clear all;close all;clc
%��ʼ���ڽ�ѹ����
b=[1 2 6;
   1 4 7 
   2 3 5;
   2 4 8;
   2 5 -4;
   3 2 -2;
   4 3 -3;
   4 5 9;
   5 1 2;
   5 3 7];

m=max(max(b(:,1:2)));            %ѹ���������ֵ�����ڽӾ���Ŀ����
A=compresstable2matrix(b);  %���ڽ�ѹ������ͼ�ľ����ʾ
netplot(A,1)                %�����ʾ

S=inf(1,m);                 %Դ�������ڵ����̾��룬��ʼΪinf
S(1)=0;                     %Դ�㵽�Լ��ľ���Ϊ0
pa=zeros(1,m);              %Ѱ�ҵ��Ľڵ��ǰ��
pa(1)=1;                    %Դ���ǰ�����Լ�

pre_pa=ones(1,m);
while sum(pre_pa==pa)~=m    %��ֹ�������ж���ֹ�ķ����ܶ࣬���Ӧ�ò������ʵ��
    pre_pa=pa;
    for k=1:m
        if pre_pa(k)~=0                 %��ÿһ������Ѱ���Ľڵ㣬�Ӵ˽ڵ�Ѱ�Һ�̽ڵ�
            i=k;                
            for j=1:m
                if A(i,j)~=inf
                    if S(j)>S(i)+A(i,j)
                        S(j)=S(i)+A(i,j);       %��Ե�ɳڣ�ȡ���ڵ����СȨֵ��Ϊʵ��Ȩֵ
                        pa(j)=i;                %Ѱ��ǰ��
                    end
                end
            end
         end
    end
end
%����������Ҫ�ľ���������ֵ
S       %Դ�㵽����ÿһ��ľ���
pa      %����ÿһ�ڵ��ǰ��

%�㷨���˽���������ֻ��Ϊ������ı�ʾ��д�ġ�
re=[];
for i=2:m
    re=[re;pa(i) i A(pa(i),i)];
end
A=compresstable2matrix(re);  %���ڽ�ѹ������ͼ�ľ����ʾ
figure;
netplot(A,1)                %�����ʾ