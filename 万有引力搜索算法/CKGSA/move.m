%This function updates the velocity and position of agents.
% �˺�������������ٶȺ�λ�á�

function [X,V]=move(X,a,V)

    [N,dim]=size(X);
    V=rand(N,dim).*V+a; 
    X=X+V; 
end