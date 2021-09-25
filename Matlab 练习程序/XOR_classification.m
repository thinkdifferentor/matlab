clear all;
close all;
clc;

%���������ѱ������
randn('seed',1);
mu1=[0 0];
S1=[0.5 0;
    0 0.5];     
P1=mvnrnd(mu1,S1,100);

mu2=[0 6];
S2=[0.5 0;
    0 0.5];        
P2=mvnrnd(mu2,S2,100);

mu3=[6 6];
S3=[0.5 0;
    0 0.5];      
P3=mvnrnd(mu3,S3,100);

mu4=[6 0];
S4=[0.5 0;
    0 0.5];        
P4=mvnrnd(mu4,S4,100);

P = [P1;P2;P3;P4]';

%���ñ��
T1 = zeros(100,1);
T2 = ones(100,1);

T11 = [T1;T1;T2;T2]';
T22 = [T1;T2;T2;T1]';
%T11 = [T1;T2;T1;T1]';
%T22 = [T1;T1;T1;T2]';

net1 = newp([1 1; 1 1],1);
net1 = train(net1,P,T11);

net2 = newp([1 1; 1 1],1);
net2 = train(net2,P,T22);

plotpv(P,[T1;T2;T1;T2]');             %��������
plotpc(net1.iw{1,1},net1.b{1,1})      %����������
plotpc(net2.iw{1},net2.b{1})          %����������

%���ɲ�������
mu2=[3 3 ];
S2=[2 0 ;
    0 2];
Q=mvnrnd(mu2,S2,100)';
Y1 = sim(net1,Q) ;                  %Y�����ø�֪��net��Q���з���Ľ��
Y2 = sim(net2,Q);
Y = xor(Y1,Y2);
figure;
plotpv(Q,Y);                    %��������Ľ����ʾ�ĵ�
plotpc(net1.iw{1},net1.b{1})      %����������
plotpc(net2.iw{1},net2.b{1})      %����������
