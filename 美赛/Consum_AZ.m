%�����ķ���--����ɣ����(AZ)
clear,clc

%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ�������������� industry,commerce,transportation,housing, electric,coking plant;
data_AZ=cell2mat(struct2cell(load('data_AZ.mat')));

%ʱ�����
t=1960:2009;

%�����������ݻ���
G=data_AZ(:,1);
S=data_AZ(:,2);
Y=data_AZ(:,3);
Z=data_AZ(:,4);
D=data_AZ(:,5);

plot(t,G,t,S,t,Y,t,Z,t,D);
% title('�����ķ���--�¿���˹�����������ݻ���')
title('Classification by consumption - Arizona');
legend('industrial','commercial','transportation','re sident','electric');
grid on
xlabel('time');
ylabel('MSN');

%ÿ����Դƽ��ֵ���
avg_G=mean(G);
avg_S=mean(S);
avg_Y=mean(Y);
avg_Z=mean(Z);
avg_D=mean(D);
sum=avg_G+avg_S+avg_Y+avg_Z+avg_D;


%ÿ����Դ�ı�׼��
std_G=std(G);
std_S=std(S);
std_Y=std(Y);
std_Z=std(Z);
std_D=std(D);

%ÿ����Դ������Դ��Ȩֵ
wet_G=avg_G/sum; 
wet_S=avg_S/sum;
wet_Y=avg_Y/sum;
wet_Z=avg_Z/sum;
wet_D=avg_D/sum;

All=zeros(5,3);
All(1,1)=avg_G;All(2,1)=avg_S;All(3,1)=avg_Y;All(4,1)=avg_Z;All(5,1)=avg_D;
All(1,2)=std_G;All(2,2)=std_S;All(3,2)=std_Y;All(4,2)=std_Z;All(5,2)=std_D;
All(1,3)=wet_G;All(2,3)=wet_S;All(3,3)=wet_Y;All(4,3)=wet_Z;All(5,3)=wet_D;


%�������
n=length(G);
AZ=zeros(n,1);
for i=1:n
    AZ(i,1)=0.177687203899316*G(i,1)+0.142275618712050*S(i,1)+2.240537793669364e-05*Y(i,1)+0.410580220972879*Z(i,1)+0.269434551037819*D(i,1);
end

%ԭʼ����
for i=4:4:40
    Tr(i,1)=0.177687203899316*G(i,1)+0.142275618712050*S(i,1)+2.240537793669364e-05*Y(i,1)+0.410580220972879*Z(i,1)+0.269434551037819*D(i,1);
end
Tr=Tr'


figure,
plot(t,AZ);grid on
xlabel('time');
ylabel('index of energy distribution');
title('index of energy distribution - Arizona');

AZ1=AZ(1:20,1);
t1=1960:1979;

AZ2=AZ(21:50,1);
t2=1980:2009;