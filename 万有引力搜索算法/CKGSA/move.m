%This function updates the velocity and position of agents.
% 此函数更新物体的速度和位置。

function [X,V]=move(X,a,V)

    [N,dim]=size(X);
    V=rand(N,dim).*V+a; 
    X=X+V; 
end