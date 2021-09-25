function [Fbest,Lbest,BestChart,MeanChart]=GSA_svm(objfun,N,max_it,ElitistCheck,min_flag,Rpower,...
    train_wine_labels,train_wine,test_wine_labels,test_wine)
% ˵��
% Main function for Gravitational Search Algorithm.
% V: �ٶ� Velocity.
% a: ���ٶ� Acceleration.
% M: �������� Mass. Ma=Mp=Mi=M;
% dim: �Ա���ά�� Dimension of the test function.
% N: ��Ⱥ��ģ Number of agents.
% X: ����λ�ü���һ��N*dim���� Position of agents. dim-by-N matrix.
% R: ������� Distance between agents in search space.
% [low-up]: ������Χ Allowable range for search space.
% Rnorm: �������ο����׹�ʽ8 Norm in eq.8.
% Rpower: �ο����׹�ʽ7 Power of R in eq.7.

Rnorm=2; % ʹ�ö��׷��� 
% ��ȡĿ�꺯���������ޡ�ά�� get allowable range and dimension of the test function.
low=0.01;
up=100;
dim=2;
% �����ʼ����Ⱥ random initialization for agents.
X=initialization(dim,N,up,low); 
% ���ڱ��浱ǰ����ֵ��ƽ����Ӧ��ֵ�仯��� create the best so far chart and average fitnesses chart.
BestChart=zeros(1,max_it);
MeanChart=zeros(1,max_it);
% ��ʼ�������
V=zeros(N,dim);
for iteration=1:max_it
    % ����Ƿ�Խ�� Checking allowable range. 
    X=space_bound(X,up,low);
    % ���������Ӧ�Ⱥ���ֵ Evaluation of agents.
    fitness=zeros(1,N);
    for agent=1:N
        fitness(1,agent)=objfun(X(agent,:),train_wine_labels,train_wine,test_wine_labels,test_wine);
    end
    % Ѱ�ҵ�ǰ�������Ÿ���
    if min_flag==1
        [best,best_X]=min(fitness); % ��С����� minimization.
    else
        [best,best_X]=max(fitness); % ������ maximization.
    end
    if iteration==1
       Fbest=best;
       Lbest=X(best_X,:);
    end
    % ����ĿǰΪֹ���Ÿ���
    if min_flag==1
        if best<Fbest % ��С����� minimization.
            Fbest=best;
            Lbest=X(best_X,:);
        end
    else
        if best>Fbest % ������ maximization
            Fbest=best;
            Lbest=X(best_X,:);
        end
    end
    BestChart(iteration)=Fbest;
    MeanChart(iteration)=mean(fitness);
    % �����������M�����׹�ʽ14��20�� Calculation of M. eq.14-20
    M=massCalculation(fitness,min_flag);
    % �����������������׹�ʽ13�� Calculation of Gravitational constant. eq.13.
    G=Gconstant(iteration,max_it);
    % ������ٶ� Calculation of accelaration in gravitational field. eq.7-10,21.
    a=Gfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it);
    % �����ƶ� Agent movement. eq.11-12
    [X,V]=move(X,a,V);
end