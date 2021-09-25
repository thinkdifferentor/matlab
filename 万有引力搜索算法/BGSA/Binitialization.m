% This function initializes the position of agents in the binary search space, randomly.
function [X]=Binitialization(dimb,N)
    X=rand(N,dimb)>.5;  
end