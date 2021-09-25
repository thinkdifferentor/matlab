% This function calculates the accelaration of each agent in gravitational field. eq.7-10,21.
function a=Gfield(M,X,G,Rnorm,Rpower,ElitistCheck,iteration,max_it)
[N,dim]=size(X);
% In the last iteration, only 2 percent of agents apply force to the others.
% 在最后一次迭代中，只有百分之二的个体对其它个体有引力？？？
final_per=2; 
% 计算总引力 total force calculation
if ElitistCheck==1
    kbest=final_per+(1-iteration/max_it)*(100-final_per); % 参考文献公式21中kbest的计算 kbest in eq.21.
    kbest=round(N*kbest/100);
else
    kbest=N; % eq.9.
end
[~,ds]=sort(M,'descend');
E=zeros(N,dim);
for i=1:N % 遍历种群
    E(i,:)=zeros(1,dim);
    for ii=1:kbest
        j=ds(ii);
        if j~=i
            R=norm(X(i,:)-X(j,:),Rnorm); % 欧氏距离 Euclidian distanse.
            for k=1:dim
                E(i,k)=E(i,k)+rand*(M(j))*((X(j,k)-X(i,k))/(R^Rpower+eps));
                % note that Mp(i)/Mi(i)=1
            end
        end
    end
end
% 加速度 acceleration
a=E.*G; % note that Mp(i)/Mi(i)=1