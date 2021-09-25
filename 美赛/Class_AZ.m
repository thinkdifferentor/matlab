%�����ķ���--����ɣ����(AZ)
clear,clc

%��������--��ά���������С�˳������Ϊ������������������Դ renewable energy non-renewable energy
class_AZ=cell2mat(struct2cell(load('class_AZ.mat')));

%ʱ�����
t=1960:2009;

%�����������ݻ���
K=class_AZ(:,1);
B=class_AZ(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
plot(t,a,t,b);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by energy type - Arizona');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');