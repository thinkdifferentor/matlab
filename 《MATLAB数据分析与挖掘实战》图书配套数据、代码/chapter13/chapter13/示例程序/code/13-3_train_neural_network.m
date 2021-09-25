%% ѵ��BP������
clear;
% ��ʼ������
inputfile = '../data/neural_network_data.xls';   % ѵ������
netfile = '../tmp/net.mat'; % ѵ���õ������籣��·��
ywind=6:16;                   % ��¼��ѡ��������Ϊ���������
nlayer=[17,10];
trainfun='trainlm';
performfun='mse';

%% ��ȡ���ݣ������������������ѵ������
[num,~,~]=xlsread(inputfile);   % ����ѵ������(����־����¼��Ƿ�Ϊϴԡ)
inputdata=num(:,ywind)'; 
outputdata=num(:,5)';           % ��¼��ʦ�ź�������
net = patternnet(nlayer,trainfun,performfun);
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net.trainParam.lr=0.05;
net.trainParam.showWindow=0;                 % ����ʾѵ��GUI
disp('ѵ��BP��������...')
[net,tr]=train(net,inputdata,outputdata);      % ע��tr�������ѵ����Ϣ���˴�Ϊһ�����

%% ����ѵ���õ�BP������
save(netfile,'net');                  % ��ѵ���õ������籣�浽net.mat��
disp('ѵ���õ�BP������ģ�ʹ��뵽net.mat�У�')
