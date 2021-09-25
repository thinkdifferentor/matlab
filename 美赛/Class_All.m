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
subplot(2,2,1);
plot(t,a,t,b);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by energy type - Arizona');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');


%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
class_CA=cell2mat(struct2cell(load('class_CA.mat')));


%�����������ݻ���
K=class_CA(:,1);
B=class_CA(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
subplot(2,2,2);
plot(t,a,t,b);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by energy type - California');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');



%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
class_NM=cell2mat(struct2cell(load('class_NM.mat')));


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
subplot(2,2,3);
plot(t,a,t,b);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by energy type - new mexico');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');



%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
class_TX=cell2mat(struct2cell(load('class_TX.mat')));


%�����������ݻ���
K=class_TX(:,1);
B=class_TX(:,2);
n=length(K);
a=zeros(n,1);
b=zeros(n,1);
for i=1:n
    a(i,1)=K(i,1)/(K(i,1)+B(i,1));
    b(i,1)=B(i,1)/(K(i,1)+B(i,1));
end
subplot(2,2,4);
plot(t,a,t,b);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by energy type - Arizona');
legend('renewable energy','non-renewable energy');
grid on
xlabel('time');
ylabel('Energy type rate');



