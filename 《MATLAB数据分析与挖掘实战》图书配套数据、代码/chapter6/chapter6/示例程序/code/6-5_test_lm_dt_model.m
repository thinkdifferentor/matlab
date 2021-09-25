%% LM�������CART������ģ�Ͳ���
clear;
% ������ʼ��
testfile = '../data/test_model.xls'; % ѵ������
treefile = '../tmp/tree.mat'; % ������ģ�ʹ洢·��
netfile = '../tmp/net.mat';   % ������ģ�ʹ洢·��
dttestoutputfile = '../tmp/dt_test_output_data.xls' ; % ��������ģ������ļ�
lmtestoutputfile = '../tmp/lm_test_output_data.xls' ; % ��������ģ������ļ�

[data,txt] = xlsread(testfile);
input = data(:,1:end-1);
target = data(:,end);

%% ʹ�ù����õľ�����ģ�Ͷ�ԭʼ���ݽ��в���
load(treefile); % ���������ģ��
output_tree=predict(tree,input);

% ������������ݱ任�Լ���ROC����ͼ
output_tree= full(ind2vec(output_tree'+1));
targetoutput = full(ind2vec(target'+1));
figure(1)
plotroc(targetoutput,output_tree);

%% ʹ�ù����õ�������ģ�Ͷ�ԭʼ���ݽ��в���
load(netfile);  % ����������ģ��
output_lm = sim(net,input');

% �����������ݱ任�Լ���ROC����ͼ 
figure(2)
plotroc(targetoutput,output_lm);

%% д������
output_lm=vec2ind(output_lm);
output_lm = output_lm'-1;
output_tree=vec2ind(output_tree);
output_tree=output_tree'-1;
xlswrite(lmtestoutputfile,[txt,'ģ�����';num2cell([data,output_lm])]);
xlswrite(dttestoutputfile,[txt,'ģ�����';num2cell([data,output_tree])]);
disp('CART������ģ�ͺ�LM������ģ�Ͳ�����ɣ�');