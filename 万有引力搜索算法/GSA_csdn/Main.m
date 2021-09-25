tic % ��ʱ��
%% ��ջ�������
close all
clear
clc
format compact
%% ������ȡ
% �����������wine,���а���������Ϊclassnumber = 3,wine:178*13�ľ���,wine_labes:178*1��������
load wine.mat

% ѡ��ѵ�����Ͳ��Լ�
% ����һ���1-30,�ڶ����60-95,�������131-153��Ϊѵ����
train_wine = [wine(1:30,:);wine(60:95,:);wine(131:153,:)];
% ��Ӧ��ѵ�����ı�ǩҲҪ�������
train_wine_labels = [wine_labels(1:30);wine_labels(60:95);wine_labels(131:153)];
% ����һ���31-59,�ڶ����96-130,�������154-178��Ϊ���Լ�
test_wine = [wine(31:59,:);wine(96:130,:);wine(154:178,:)];
% ��Ӧ�Ĳ��Լ��ı�ǩҲҪ�������
test_wine_labels = [wine_labels(31:59);wine_labels(96:130);wine_labels(154:178)];
%% ����Ԥ����
% ����Ԥ����,��ѵ�����Ͳ��Լ���һ����[0,1]����
[mtrain,ntrain] = size(train_wine);
[mtest,ntest] = size(test_wine);

dataset = [train_wine;test_wine];
% mapminmaxΪMATLAB�Դ��Ĺ�һ������
[dataset_scale,ps] = mapminmax(dataset',0,1);
dataset_scale = dataset_scale';

train_wine = dataset_scale(1:mtrain,:);
test_wine = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%% GSA�Ż����� 
N=20; % Ⱥ���ģ Number of agents.
max_it=30; % ���������� Maximum number of iterations (T).
ElitistCheck=1; % ���ElitistCheck=1,��ʹ�������еĹ�ʽ21�����ElitistCheck=0�����������еĹ�ʽ9.
Rpower=1;% �����й�ʽ7�е�R���ݴ��� power of 'R' in eq.7.
min_flag=1; % ȡ1��⼫Сֵ���⣬ȡ0��⼫��ֵ���� 1: minimization, 0: maximization.
objfun=@objfun_svm; % Ŀ�꺯��
[Fbest,Lbest,BestChart,MeanChart]=GSA_svm(objfun,N,max_it,ElitistCheck,min_flag,Rpower,...
    train_wine_labels,train_wine,test_wine_labels,test_wine);
% Fbest: ����Ŀ��ֵ Best result. 
% Lbest: ���Ž� Best solution. The location of Fbest in search space.
% BestChart: ���Ž�仯���� The best so far Chart over iterations. 
% MeanChart: ƽ����Ӧ�Ⱥ���ֵ�仯���� The average fitnesses Chart over iterations.
%% ��ӡ����ѡ����
bestc=Lbest(1);
bestg=Lbest(2);
disp('��ӡѡ����');
str=sprintf('Best c = %g��Best g = %g',bestc,bestg);
disp(str)
%% ������ѵĲ�������SVM����ѵ��
cmd_gwosvm = ['-c ',num2str(bestc),' -g ',num2str(bestg)];
model_gwosvm = svmtrain(train_wine_labels,train_wine,cmd_gwosvm);
%% SVM����Ԥ��
[predict_label,accuracy] = svmpredict(test_wine_labels,test_wine,model_gwosvm);
% ��ӡ���Լ�����׼ȷ��
total = length(test_wine_labels);
right = sum(predict_label == test_wine_labels);
disp('��ӡ���Լ�����׼ȷ��');
str = sprintf( 'Accuracy = %g%% (%d/%d)',accuracy(1),right,total);
disp(str);
%% �������
% ���Լ���ʵ�ʷ����Ԥ�����ͼ
figure;
hold on;
plot(test_wine_labels,'o');
plot(predict_label,'r*');
xlabel('���Լ�����','FontSize',12);
ylabel('����ǩ','FontSize',12);
legend('ʵ�ʲ��Լ�����','Ԥ����Լ�����');
title('���Լ���ʵ�ʷ����Ԥ�����ͼ','FontSize',12);
grid on
%% ������Ӧ�ȱ仯����
figure('Name','������Ӧ�ȱ仯����')
plot(BestChart,'--k');
title('������Ӧ�ȱ仯����');
xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
legend('\fontsize{10}\bf GSA',1);
%% ��ʾ��������ʱ��
toc