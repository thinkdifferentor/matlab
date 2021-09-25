% Chaotic Kbest Gravitational Search Algorithm.
% ����K�������������㷨

function [Fbest,Lbest,BestChart,MeanChart]=CKGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower,Variant)

%V:   Velocity. �ٶ�
%a:   Acceleration. ���ٶ�
%M:   Mass.  Ma=Mp=Mi=M; ����
%dim: Dimension of the test function. ���Ժ�����ά��
%N:   Number of agents. ���������
%X:   Position of agents. dim-by-N matrix. λ�þ���
%R:   Distance between agents in search space. ������ŷʽ����
%[low-up]: Allowable range for search space. �����ռ�߽�

%Rnorm:  Norm
%Rpower: Power of R
 
Rnorm=2; 
 
%get allowable range and dimension of the test function.
% ��ȡ���Ժ�����ά�Ⱥͱ߽硣
[low,up,dim]=test_functions_range(F_index); 

%random initialization for agents.
% �����ʼ�������λ��
X=initialization(dim,N,up,low); 

%create the best so far chart and average fitnesses chart.
% ��������Ϊֹ��õ�ͼ���ƽ�����ͼ��
BestChart=[];MeanChart=[];
V=zeros(N,dim);

for iteration=1:max_it
%     iteration ��ʼ����
    
    %Checking allowable range. �߽��� 
    X=space_bound(X,up,low); 

    %Evaluation of agents. ���۴�ʱÿ���������Ӧ��
    fitness=evaluateF(X,F_index); 
    
    if min_flag==1
    [best best_X]=min(fitness); %minimization.
    else
    [best best_X]=max(fitness); %maximization.
    end        
    
    if iteration==1
       Fbest=best;Lbest=X(best_X,:);
    end
    
    if min_flag==1
      if best<Fbest  %minimization.
       Fbest=best;Lbest=X(best_X,:);
      end
    else 
      if best>Fbest  %maximization
       Fbest=best;Lbest=X(best_X,:);
      end
    end
      
BestChart=[BestChart Fbest];
MeanChart=[MeanChart mean(fitness)];

%Calculation of M. ����ÿ���������Ӧ�����¼������������
[M]=massCalculation(fitness,min_flag); 

%Calculation of Gravitational constant. ����������������
G=Gconstant(iteration,max_it); 

%Calculation of accelaration in gravitational field. ����ÿ������ļ��ٶ�
a=ckGfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it,Variant);

%Agent movement. �ƶ�ÿ������
[X,V]=move(X,a,V);

end %iteration

