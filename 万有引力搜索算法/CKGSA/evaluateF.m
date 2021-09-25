%This function Evaluates the agents.
% 物体适应度评价函数-返回每个物体的适应度数值

function   fitness=evaluateF(X,F_index)

    [N,dim]=size(X);
    for i=1:N 
        %L is the location of agent number 'i'
        L=X(i,:); 
        
        %calculation of objective function for agent number 'i'
        fitness(i)=test_functions(L,F_index,dim);
        
    end

end