%�Ŵ��㷨��⺯�� sin(10*pi*X)/X ������[1,2]����Сֵ

clc
clear all
close all

%% ��������ͼ
figure(1);
hold on;
lb=1;ub=2; %�����Ա�����Χ��1,2��
ezplot('sin(10*pi*X)/X',[lb,ub]);   %������������
xlabel('�Ա���/X')
ylabel('����ֵ/Y')

%% �����Ŵ��㷨����
NIND=40;        %������Ŀ
MAXGEN=20;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.7;         %�������
pm=0.01;        %�������
trace=zeros(2,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI;lb;ub;1;0;1;1];                 %����������
Chrom=crtbp(NIND,PRECI);                      %��ʼ��Ⱥ

%% �Ż�
gen=0;                                  %��������
X=bs2rv(Chrom,FieldD);                  %�����ʼ��Ⱥ��ʮ����ת��
ObjV=sin(10*pi*X)./X;                   %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(ObjV);                               %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   X=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   
   ObjVSel=sin(10*pi*X)./X;             %�����Ӵ���Ŀ�꺯��ֵ
   
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   X=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %������������
   %��ȡÿ�������Ž⼰����ţ�YΪ���Ž�,IΪ��������
   [Y,I]=min(ObjV);
   trace(1,gen)=X(I);                            %����ÿ��������ֵ
   trace(2,gen)=Y;                               %����ÿ��������ֵ
end
plot(trace(1,:),trace(2,:),'bo');                            %����ÿ�������ŵ�
grid on;
plot(X,ObjV,'b*');   %�������һ������Ⱥ
hold off

%% ������ͼ
figure(2);
plot(1:MAXGEN,trace(2,:));
grid on
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
bestY=trace(2,end);
bestX=trace(1,end);
fprintf(['���Ž�:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\n'])
