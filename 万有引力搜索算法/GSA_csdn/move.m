% This function updates the velocity and position of agents.
function [X,V]=move(X,a,V)
% movement.
[N,dim]=size(X);
V=rand(N,dim).*V+a; % eq.11.
X=X+V; % eq.12.