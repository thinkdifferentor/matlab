function err=Bpfun(x,P,T,hiddennum,P_test,T_test)
%% ѵ��&����BP����
%% ����
% x��һ������ĳ�ʼȨֵ����ֵ
% P��ѵ����������
% T��ѵ���������
% hiddennum����������Ԫ��
% P_test:������������
% T_test:���������������
%% ���
% err��Ԥ��������Ԥ�����ķ���

inputnum=size(P,1);       % �������Ԫ����
outputnum=size(T,1);      % �������Ԫ����
%% �½�BP����
net=newff(minmax(P),[hiddennum,outputnum],{'tansig','logsig'},'trainlm');
%% �������������ѵ������Ϊ1000��ѵ��Ŀ��Ϊ0.01��ѧϰ����Ϊ0.1
net.trainParam.epochs=1000;
net.trainParam.goal=0.01;
LP.lr=0.1;
net.trainParam.show=NaN;
% net.trainParam.showwindow=false;  %�߰�MATLAB
%% BP�������ʼȨֵ����ֵ
w1num=inputnum*hiddennum; % ����㵽�����Ȩֵ����
w2num=outputnum*hiddennum;% ���㵽������Ȩֵ����
w1=x(1:w1num);   %��ʼ����㵽�����Ȩֵ
B1=x(w1num+1:w1num+hiddennum);  %��ʼ������ֵ
w2=x(w1num+hiddennum+1:w1num+hiddennum+w2num); %��ʼ���㵽��������ֵ
B2=x(w1num+hiddennum+w2num+1:w1num+hiddennum+w2num+outputnum); %�������ֵ
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);
%% ѵ��������
net=train(net,P,T);
%% ��������
Y=sim(net,P_test);
err=norm(Y-T_test);
