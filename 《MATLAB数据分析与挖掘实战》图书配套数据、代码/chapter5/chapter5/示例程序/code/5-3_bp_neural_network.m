%% ʹ��BP�������㷨Ԥ�������ߵ�
clear ;
% ������ʼ��
inputfile = '../data/sales_data.xls'; % ������������������

%% ����Ԥ����
disp('���ڽ�������Ԥ����...');
[matrix,~] =  bp_preprocess(inputfile);

%% �������ݱ任
input = matrix(:,1:end-1);
target = matrix(:,end);
input=input';
target=target';
target=full(ind2vec(target+1));

%% �½�BP�����磬�����ò��� 
% net = feedforwardnet(10);
net = patternnet(10);
net.trainParam.epochs=1000;
net.trainParam.show=25;
net.trainParam.showCommandLine=0;
net.trainParam.showWindow=1; 
net.trainParam.goal=0;
net.trainParam.time=inf;
net.trainParam.min_grad=1e-6;
net.trainParam.max_fail=5;
net.performFcn='mse';
% ѵ��������ģ��
net= train(net,input,target);
disp('BP������ѵ����ɣ�');

%% ʹ��ѵ���õ�BP���������Ԥ��
y= sim(net,input);
plotconfusion(target,y);
disp('����Ԥ����ɣ�');