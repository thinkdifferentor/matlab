tic % 计时器
%% 清空环境变量
close all
clear
clc
format compact
%% 数据提取
% 载入测试数据wine,其中包含的数据为classnumber = 3,wine:178*13的矩阵,wine_labes:178*1的列向量
load wine.mat

% 选定训练集和测试集
% 将第一类的1-30,第二类的60-95,第三类的131-153做为训练集
train_wine = [wine(1:30,:);wine(60:95,:);wine(131:153,:)];
% 相应的训练集的标签也要分离出来
train_wine_labels = [wine_labels(1:30);wine_labels(60:95);wine_labels(131:153)];
% 将第一类的31-59,第二类的96-130,第三类的154-178做为测试集
test_wine = [wine(31:59,:);wine(96:130,:);wine(154:178,:)];
% 相应的测试集的标签也要分离出来
test_wine_labels = [wine_labels(31:59);wine_labels(96:130);wine_labels(154:178)];
%% 数据预处理
% 数据预处理,将训练集和测试集归一化到[0,1]区间
[mtrain,ntrain] = size(train_wine);
[mtest,ntest] = size(test_wine);

dataset = [train_wine;test_wine];
% mapminmax为MATLAB自带的归一化函数
[dataset_scale,ps] = mapminmax(dataset',0,1);
dataset_scale = dataset_scale';

train_wine = dataset_scale(1:mtrain,:);
test_wine = dataset_scale( (mtrain+1):(mtrain+mtest),: );
%% GSA优化参数 
N=20; % 群体规模 Number of agents.
max_it=30; % 最大迭代次数 Maximum number of iterations (T).
ElitistCheck=1; % 如果ElitistCheck=1,则使用文献中的公式21；如果ElitistCheck=0，则用文献中的公式9.
Rpower=1;% 文献中公式7中的R的幂次数 power of 'R' in eq.7.
min_flag=1; % 取1求解极小值问题，取0求解极大值问题 1: minimization, 0: maximization.
objfun=@objfun_svm; % 目标函数
[Fbest,Lbest,BestChart,MeanChart]=GSA_svm(objfun,N,max_it,ElitistCheck,min_flag,Rpower,...
    train_wine_labels,train_wine,test_wine_labels,test_wine);
% Fbest: 最优目标值 Best result. 
% Lbest: 最优解 Best solution. The location of Fbest in search space.
% BestChart: 最优解变化趋势 The best so far Chart over iterations. 
% MeanChart: 平均适应度函数值变化趋势 The average fitnesses Chart over iterations.
%% 打印参数选择结果
bestc=Lbest(1);
bestg=Lbest(2);
disp('打印选择结果');
str=sprintf('Best c = %g，Best g = %g',bestc,bestg);
disp(str)
%% 利用最佳的参数进行SVM网络训练
cmd_gwosvm = ['-c ',num2str(bestc),' -g ',num2str(bestg)];
model_gwosvm = svmtrain(train_wine_labels,train_wine,cmd_gwosvm);
%% SVM网络预测
[predict_label,accuracy] = svmpredict(test_wine_labels,test_wine,model_gwosvm);
% 打印测试集分类准确率
total = length(test_wine_labels);
right = sum(predict_label == test_wine_labels);
disp('打印测试集分类准确率');
str = sprintf( 'Accuracy = %g%% (%d/%d)',accuracy(1),right,total);
disp(str);
%% 结果分析
% 测试集的实际分类和预测分类图
figure;
hold on;
plot(test_wine_labels,'o');
plot(predict_label,'r*');
xlabel('测试集样本','FontSize',12);
ylabel('类别标签','FontSize',12);
legend('实际测试集分类','预测测试集分类');
title('测试集的实际分类和预测分类图','FontSize',12);
grid on
%% 最优适应度变化曲线
figure('Name','最优适应度变化曲线')
plot(BestChart,'--k');
title('最优适应度变化曲线');
xlabel('\fontsize{12}\bf Iteration');ylabel('\fontsize{12}\bf Best-so-far');
legend('\fontsize{10}\bf GSA',1);
%% 显示程序运行时间
toc