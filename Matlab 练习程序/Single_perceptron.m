clear all;
close all;
clc;

%���������ѱ������
randn('seed',0);
mu1=[0 0 0];
S1=[0.3 0 0;
    0 0.35 0;
    0 0 0.4];  
P1=mvnrnd(mu1,S1,100);

mu2=[4 4 4];
S2=[1.2 0 0;
    0 1.85 0;
    0 0 1.9];
P2=mvnrnd(mu2,S2,100);
P = [P1;P2]';

%���ñ��
T1 = zeros(100,1);
T2 = ones(100,1);
T = [T1;T2]';

net=newp([1 1;1 1;1 1],1);      %���ɸ�֪����net�Ƿ��ز���
net.trainParam.epochs=10;       %����ѵ�����������10
net=train(net,P,T);             %����ѵ�����Ը�֪������ѵ��

plotpv(P,T);                    %��������
plotpc(net.iw{1},net.b{1})      %����������

%���ɲ�������
mu2=[2 2 2];
S2=[1.2 0 0;
    0 1.85 0;
    0 0 1.9];
Q=mvnrnd(mu2,S2,100)';
Y=sim(net,Q) ;                  %Y�����ø�֪��net��Q���з���Ľ��
figure;
plotpv(Q,Y);                    %��������Ľ����ʾ�ĵ�
plotpc(net.iw{1},net.b{1})      %����������