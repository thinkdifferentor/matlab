%% ѵ��BP������
clear;
% ��ʼ������
inputfile='../data/neural_network_data.xls';   %ѵ������
ywind=6:16;                   %��¼��ѡ��������Ϊ���������
nlayer=[11,17,10,1];            %11�����룬2�����㣬�ֱ�Ϊ17��10���ڵ㣬һ�����
passfun={'tansig','tansig','tansig','tansig','tansig'};  %���ô��ݺ���
trainfun='trainlm';

%% �������ݣ������������������ѵ������
% warning off ;
[num,~,~]=xlsread(inputfile);   %����ѵ������(����־����¼��Ƿ�Ϊϴԡ)
inputdata=num(:,ywind)'; 
outputdata=num(:,5)';           %��¼��ʦ�ź�������
net=newff(minmax(inputdata),nlayer,passfun,trainfun);  %����BP������
% warning on;
net.trainParam.epochs=500;
net.trainParam.goal=1e-5;
net.trainParam.lr=0.05;
% net.trainParam.showWindow=0;                 %����ʾѵ��GUI
disp('ѵ��BP�������У�')
[net,tr]=train(net,inputdata,outputdata);      %ע��tr�������ѵ����Ϣ���˴�Ϊһ�����

%% ����ѵ���õ�BP������
save('../tmp/net.mat','net');                  %��ѵ���õ������籣�浽net.mat��
disp('ѵ���õ�BP������ģ�ʹ��뵽net.mat�У�')




