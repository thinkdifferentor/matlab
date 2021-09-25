
function BestChart = GSA_func(fhd,param,Lb,Ub,dim,funcNum)
format short e

% make copies of parameters ²ÎÊý´«µÝ
NGen = param.NGen;        % Maximum Number of Iterations
NP = param.NP;            % Population Size
G0 = param.G0;            % GSA G0
alfa = param.alfa;        % GSA alfa
Rpower = param.Rpower;    % GSA power of 'R'
ElitistCheck = param.ElitistCheck; 

X = Lb+(Ub-Lb).*rand(NP,dim);
V = zeros(NP, dim);

for j = 1:NP
    fitness(j,1) = feval(fhd,X(j,:),funcNum);
end

[best , bestX]=min(fitness);                  % minimization
Fbest=best;Xbest=X(bestX,:);
BestChart = [];
BestChart=[BestChart; Fbest];

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for it=2:NGen
    [M] = massCalculation(fitness);  % Calculation of M
    G = G0*exp(-alfa*it/NGen);       % Calculation of Gravitational constant
    a = Gfield(M,X,G,Rpower,ElitistCheck,it,NGen); %Calculation of accelaration
    V=rand(NP,dim).*V+a;
    X=X+V;
    for j = 1:NP
        Tp=X(j,:)>Ub;
        Tm=X(j,:)<Lb;
        X(j,:)=(X(j,:).*(~(Tp+Tm)))+((rand(1,dim).*(Ub-Lb)+Lb).*(Tp+Tm));  
        fitness(j,1) = feval(fhd,X(j,1:dim),funcNum);     
    end
    [best , bestX]=min(fitness);                  % minimization
    if best<Fbest  %minimization.
        Fbest=best;Xbest=X(bestX,:);
    end     
    BestChart=[BestChart;Fbest];
end    %iteration

function [M] = massCalculation(fitness)
Fmax=max(fitness); Fmin=min(fitness); 
[N , ~]=size(fitness);
   if Fmax==Fmin
       M=ones(N,1);     
   else
      best=Fmin;worst=Fmax; 
      M=(fitness - worst)./(best - worst);
   end
M=M./sum(M);

function a = Gfield(M,X,G,Rpower,ElitistCheck,it,NGen)
 [N,dim]=size(X);
 final_per=2; %In the last iteration, only 2 percent of agents apply force to the others.

 if ElitistCheck==1
     kbest=final_per+(1-it/NGen)*(100-final_per); %kbest in eq. 21.
     kbest=round(N*kbest/100);
 else
     kbest=N; 
 end
 [~ , ds]=sort(M,'descend');
 for i=1:N
     E(i,:)=zeros(1,dim);
     for ii=1:kbest
         j=ds(ii);
         if j~=i
            R=norm(X(i,:)-X(j,:),2); %Euclidian distanse.
            for k=1:dim 
                E(i,k)=E(i,k)+rand*(M(j))*((X(j,k)-X(i,k))/(R^Rpower+eps)); %note that Mp(i)/Mi(i)=1              
            end
         end
     end
 end
a=E.*G; % acceleration ,note that Mp(i)/Mi(i)=1

