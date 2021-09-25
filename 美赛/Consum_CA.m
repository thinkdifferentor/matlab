%�����ķ���--����������(CA)
clear,clc

%��������--��ά���������С�˳������Ϊ��ҵ����ҵ�����䣬סլ��������������
data_CA=cell2mat(struct2cell(load('data_CA.mat')));

%ʱ�����
t=1960:2009;

%�����������ݻ���
G=data_CA(:,1);
S=data_CA(:,2);
Y=data_CA(:,3);
Z=data_CA(:,4);
D=data_CA(:,5);

plot(t,G,t,S,t,Y,t,Z,t,D);
% title('�����������ݻ���')
title('Classification by consumption - California');
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
% CA=0.067871516793364*G+0.231622126488632*S+0.067553709646550*Y+0.307440610875571*Z+0.257640519402519*D

%�������
n=length(G);
CA=zeros(n,1);
for i=1:n
   CA(i,1)=0.072813477987366*G(i,1)+0.248487339097100*S(i,1)+0.072472530196864*Y(i,1)+0.329826431027982*Z(i,1)+0.276400221690688*D(i,1);
end

%ԭʼ����
for i=4:4:40
    Tr(i,1)=0.072813477987366*G(i,1)+0.248487339097100*S(i,1)+0.072472530196864*Y(i,1)+0.329826431027982*Z(i,1)+0.276400221690688*D(i,1);
end
Tr=Tr'

figure,
plot(t,CA);grid on
xlabel('time');
ylabel('index of energy distribution');
title('index of energy distribution - California');

CA1=CA(1:20,1);
t1=1960:1979;

CA2=CA(21:50,1);
t2=1980:2009;

