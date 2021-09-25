%% LM������ģ�Ͳ���
clear;
% ������ʼ��
testfile = '../data/test_moment.xls'; % ѵ������
netfile = '../tmp/net.mat';   % ������ģ�ʹ洢·��
testoutputfile = '../tmp/test_output_data.xls' ; % ��������ģ������ļ�

%% ���ݶ�ȡ
[data,txt] = xlsread(testfile);
input=data(:,3:end);
target=data(:,1);

%% ʹ�ù����õ�������ģ�Ͷ�ԭʼ���ݽ��в���
load(netfile);  % ����������ģ��
output_lm = sim(net,input');

% �����������ݱ任�Լ���������������ͼ 
targetoutput = full(ind2vec(target'));
plotconfusion(targetoutput,output_lm);

%% д������
output_lm=vec2ind(output_lm);
output_lm = output_lm';
xlswrite(testoutputfile,[txt,'ģ�����';num2cell([data,output_lm])]);

disp('LM������ģ�Ͳ�����ɣ�');