% ͨ���Ŵ��㷨���㺯�� y*sin(2*pi*x)+x*cos(2*pi*y) �ڸ��������ϵ���ֵ 

clc
clear all
close all
%% ��������ͼ
figure(1);
lbx=-2;ubx=2; %�����Ա���x��Χ��-2,2��
lby=-2;uby=2; %�����Ա���y��Χ��-2,2��
ezmesh('y*sin(2*pi*x)+x*cos(2*pi*y)',[lbx,ubx,lby,uby],50);   %������������
hold on;
%% �����Ŵ��㷨����
NIND=40;        %������Ŀ
MAXGEN=50;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.7;         %�������
pm=0.01;        %�������
trace=zeros(3,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];                      %����������
Chrom=crtbp(NIND,PRECI*2);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
XY=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X=XY(:,1);Y=XY(:,2);
ObjV=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);        %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(-ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   XY=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   X=XY(:,1);Y=XY(:,2);
   ObjVSel=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);             %�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %������������
   %��ȡÿ�������Ž⼰����ţ�YΪ���Ž�,IΪ��������
   [Y,I]=max(ObjV);
   trace(1:2,gen)=XY(I,:);                       %����ÿ��������ֵ
   trace(3,gen)=Y;                               %����ÿ��������ֵ
end
plot3(trace(1,:),trace(2,:),trace(3,:),'bo');    %����ÿ�������ŵ�
grid on;
plot3(XY(:,1),XY(:,2),ObjV,'bo');  %�������һ������Ⱥ
hold off
%% ������ͼ
figure(2);
plot(1:MAXGEN,trace(3,:));
grid on
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
bestZ=trace(3,end);
bestX=trace(1,end);
bestY=trace(2,end);
fprintf(['���Ž�:\nX=',num2str(bestX),'\nY=',num2str(bestY),'\nZ=',num2str(bestZ),'\n'])
