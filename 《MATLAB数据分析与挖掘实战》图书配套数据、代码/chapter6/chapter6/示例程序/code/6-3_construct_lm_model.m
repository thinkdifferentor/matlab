%% LM ������ģ�͹���
clear;
% ������ʼ��
trainfile = '../data/train_model.xls'; % ѵ������
netfile = '../tmp/net.mat'; % ������������ģ�ʹ洢·��
trainoutputfile = '../tmp/lm_train_output_data.xls' ; % ѵ������ģ������ļ�

%% ��ȡ���ݲ�ת��
[data,txt] = xlsread(trainfile);
input=data(:,1:end-1);
targetoutput=data(:,end);
targetoutput = targetoutput+1; % �������ݶ���1,�������ind2vec

% �������ݱ任
input=input';
targetoutput=targetoutput';
targetoutput=full(ind2vec(targetoutput));

%% �½�LM�����磬�����ò��� 
net = patternnet(10,'trainlm');
net.trainParam.epochs=1000;
net.trainParam.show=25;
net.trainParam.showCommandLine=0;
net.trainParam.showWindow=0; 
net.trainParam.goal=0;
net.trainParam.time=inf;
net.trainParam.min_grad=1e-6;
net.trainParam.max_fail=5;
net.performFcn='mse';

% ѵ��������ģ��
net= train(net,input,targetoutput);

%% ʹ��ѵ���õ����������ԭʼ����
output = sim(net,input);

%% ����������ͼ
plotconfusion(targetoutput,output);

%% ����д�뵽�ļ�
save(netfile,'net'); % ����������ģ��

output = vec2ind(output);
output = output';
xlswrite(trainoutputfile,[txt,'ģ�����';num2cell([data,output-1])]);
disp('LM������ģ�͹�����ɣ�');