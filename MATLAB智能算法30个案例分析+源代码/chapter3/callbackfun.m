clc
%% �������Ŵ��㷨
%% ʹ�����Ȩֵ����ֵ 
inputnum=size(P,1);       % �������Ԫ����
outputnum=size(T,1);      % �������Ԫ����
%% �½�BP����
net=newff(minmax(P),[hiddennum,outputnum],{'tansig','logsig'},'trainlm');
%% �������������ѵ������Ϊ1000��ѵ��Ŀ��Ϊ0.01��ѧϰ����Ϊ0.1
net.trainParam.epochs=1000;
net.trainParam.goal=0.01;
LP.lr=0.1;
%% ѵ��������
net=train(net,P,T);
%% ��������
disp(['1��ʹ�����Ȩֵ����ֵ '])
disp('��������Ԥ������')
Y1=sim(net,P_test)
err1=norm(Y1-T_test);     %���������ķ������
err11=norm(sim(net,P)-T); %ѵ�������ķ������
disp(['���������ķ������:',num2str(err1)])
disp(['ѵ�������ķ������:',num2str(err11)])


%% ʹ���Ŵ��㷨
%% ʹ���Ż����Ȩֵ����ֵ
inputnum=size(P,1);       % �������Ԫ����
outputnum=size(T,1);      % �������Ԫ����
%% �½�BP����
net=newff(minmax(P),[hiddennum,outputnum],{'tansig','logsig'},'trainlm');
%% �������������ѵ������Ϊ1000��ѵ��Ŀ��Ϊ0.01��ѧϰ����Ϊ0.1
net.trainParam.epochs=1000;
net.trainParam.goal=0.01;
LP.lr=0.1;
%% BP�������ʼȨֵ����ֵ
w1num=inputnum*hiddennum; % ����㵽�����Ȩֵ����
w2num=outputnum*hiddennum;% ���㵽������Ȩֵ����
w1=bestX(1:w1num);   %��ʼ����㵽�����Ȩֵ
B1=bestX(w1num+1:w1num+hiddennum);  %��ʼ������ֵ
w2=bestX(w1num+hiddennum+1:w1num+hiddennum+w2num); %��ʼ���㵽��������ֵ
B2=bestX(w1num+hiddennum+w2num+1:w1num+hiddennum+w2num+outputnum); %�������ֵ
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);
%% ѵ��������
net=train(net,P,T);
%% ��������
disp(['2��ʹ���Ż����Ȩֵ����ֵ'])
disp('��������Ԥ������')
Y2=sim(net,P_test)
err2=norm(Y2-T_test);
err21=norm(sim(net,P)-T);
disp(['���������ķ������:',num2str(err2)])
disp(['ѵ�������ķ������:',num2str(err21)])

