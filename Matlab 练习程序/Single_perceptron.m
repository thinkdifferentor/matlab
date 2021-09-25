clear all;
close all;
clc;

%生成两组已标记数据
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

%设置标记
T1 = zeros(100,1);
T2 = ones(100,1);
T = [T1;T2]';

net=newp([1 1;1 1;1 1],1);      %生成感知器，net是返回参数
net.trainParam.epochs=10;       %设置训练次数最大是10
net=train(net,P,T);             %利用训练集对感知器进行训练

plotpv(P,T);                    %画出数据
plotpc(net.iw{1},net.b{1})      %画出分类线

%生成测试数据
mu2=[2 2 2];
S2=[1.2 0 0;
    0 1.85 0;
    0 0 1.9];
Q=mvnrnd(mu2,S2,100)';
Y=sim(net,Q) ;                  %Y是利用感知器net对Q进行分类的结果
figure;
plotpv(Q,Y);                    %画出输入的结果表示的点
plotpc(net.iw{1},net.b{1})      %画出分类线