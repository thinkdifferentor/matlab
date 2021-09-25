%�����ķ���--��ī����
clear,clc

%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
class_NM=cell2mat(struct2cell(load('class_NM.mat')));

%ʱ�����
t=1960:2009;

%�����������ݻ���
K=class_NM(:,1);
B=class_NM(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
plot(t,a,t,b);
title('Classification by energy type - new mexico');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');