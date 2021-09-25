% Binary Gravitational Search Algorithm.
% 二进制引力搜索算法

function [Fbest,Lbest,BestChart,MeanChart]=BGSA(F_index,N,max_it,ElitistCheck,min_flag,Rpower)

%V:   Velocity.
%a:   Acceleration.
%M:   Mass.  Ma=Mp=Mi=M;
%m: Dimension of test function.
%n: Dimension of binary search space.
%N:   Number of agents.
%X:   Position of agents. N-by-n matrix.
%R:   Distance between agents in search space.
%[low-up]: Allowable range for search space.
%Rpower: Power of R in eq.2.
 
%Allowable range and the dimension of test function.
[low,up,m]=test_functions_range(F_index); n=m;

%random initialization of agents.
X=Binitialization(n,N); 

%create best so far chart and average fitnesses chart.
BestChart=[];MeanChart=[];

V=zeros(N,n);

for iteration=1:max_it
%     iteration
     
    %Evaluation of agents.
     fitness=evaluateF(X,F_index); 
     
    %%%keep better results
    if iteration>1
        if min_flag==1   %minimization
            afit=find(fitness>fitnessold);
        else             %maximization
            afit=find(fitness<fitnessold);
        end
    X(afit,:)=Xold(afit,:);fitness(afit)=fitnessold(afit);
    end
    %%%
    
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

%Calculation of M. eq.8-12
[M]=massCalculation(fitness,min_flag); 

%Calculation of Gravitational constant. eq.7.
G=BGconstant(iteration,max_it); 

%Calculation of accelaration in the gravitational field. eq.2-4.
a=BGfield(M,X,G,Rpower,ElitistCheck,iteration,max_it);

%%%
Xold=X;fitnessold=fitness;

%Agent movement. eq.13-14
[X,V]=Bmove(X,a,V);


end %iteration

