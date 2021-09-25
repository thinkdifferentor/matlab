%This function calculates the accelaration of each agent in gravitational field.
% 这个函数计算重力场中各物体的加速度。

function a=ckGfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it,Variant)

[N,dim]=size(X);
final_per=2; %In the last iteration, only 2 percent of agents apply force to the others.

%%%%total force calculation
if ElitistCheck==1
   
    if Variant ==1  %%%% Kbest as per CKGSA (eq. 15)
        z=rand;
        z=4*z*(1-z);
        kbest= (N - 2)*((max_it - iteration)/max_it)+2*z;
    else %%%% Kbest as per original GSA (eq. 3)
        kbest=final_per+(1-iteration/max_it)*(100-final_per); 
    end
    kbest=round(N*kbest/100);
else
    kbest=N; 
end
[Ms ds]=sort(M,'descend');

for i=1:N
    E(i,:)=zeros(1,dim);
    for ii=1:kbest
        j=ds(ii);
        if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); %Euclidian distanse. 计算距离
            for k=1:dim
                E(i,k)=E(i,k)+rand*(M(j))*((X(j,k)-X(i,k))/(R^Rpower+eps));
                %note that Mp(i)/Mi(i)=1
            end
        end
    end
end

%%acceleration
a=E.*G; %note that Mp(i)/Mi(i)=1


