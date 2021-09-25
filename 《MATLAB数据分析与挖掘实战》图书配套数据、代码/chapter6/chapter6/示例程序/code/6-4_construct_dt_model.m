%% ����CART������ģ��

clear;
% ������ʼ��
trainfile = '../data/train_model.xls'; % ѵ������
treefile = '../tmp/tree.mat'; % �����ľ�����ģ�ʹ洢·��
trainoutputfile = '../tmp/dt_train_output_data.xls' ; % ѵ������ģ������ļ�

%% ��ȡ���ݣ�����ȡ�������
[data,txt]=xlsread(trainfile);
input=data(:,1:end-1);
targetoutput=data(:,end);

% ʹ��ѵ�����ݹ���������
tree= fitctree(input,targetoutput);

%% ʹ�ù����õľ�����ģ�Ͷ�ԭʼ���ݽ��в���
output=predict(tree,input);

% �任���ݲ�����������ͼ
output=output';
targetoutput=targetoutput';
output= full(ind2vec(output+1));
targetoutput = full(ind2vec(targetoutput+1));
plotconfusion(targetoutput,output);

%% ��������
save(treefile,'tree'); % ���������ģ��

output = vec2ind(output);
output = output';
xlswrite(trainoutputfile,[txt,'ģ�����';num2cell([data,output-1])]);
disp('CART������ģ�͹�����ɣ�');