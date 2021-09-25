%�����ķ���--��ī������(NM)
clear,clc

%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
data_NM=cell2mat(struct2cell(load('data_NM.mat')));

%ʱ�����
t=1960:2009;

%�����������ݻ���
G=data_NM(:,1);
S=data_NM(:,2);
Y=data_NM(:,3);
Z=data_NM(:,4);
D=data_NM(:,5);


plot(t,G,t,S,t,Y,t,Z,t,D);
% title('�����������ݻ���')
title('Classification by consumption - New Mexico');
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


%��Դ�ſ��������ʽ  ��ҵ����ҵ�����䣬סլ������
%NM=0.288926100938835*G+0.092557280220480*S+0.030616255457361*Y+0.095309237403934*Z+0.203665025040556*D;

%�������
n=length(G);
NM=zeros(n,1);
for i=1:n
   NM(i,1)=0.406323592133399*G(i,1)+0.130165486797762*S(i,1)+0.043056362352470*Y(i,1)+0.134035629109396*Z(i,1)+0.286418929606974*D(i,1);
end

%ԭʼ����
for i=4:4:40
    Tr(i,1)=0.406323592133399*G(i,1)+0.130165486797762*S(i,1)+0.043056362352470*Y(i,1)+0.134035629109396*Z(i,1)+0.286418929606974*D(i,1);
end
Tr=Tr'

figure,
plot(t,NM);grid on
xlabel('time');
ylabel('index of energy distribution');
title('index of energy distribution - New Mexico');

NM1=NM(1:20,1);
t1=1960:1979;

NM2=NM(21:50,1);
t2=1980:2009;

