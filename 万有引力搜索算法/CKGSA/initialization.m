%This function initializes the position of the agents in the search space, randomly.
% 此函数随机地初始化每物体在搜索空间中的位置。

function [X]=initialization(dim,N,up,down)

if size(up,2)==1
    X=rand(N,dim).*(up-down)+down;
end
if size(up,2)>1
    for i=1:dim
    high=up(i);low=down(i);
    X(:,i)=rand(N,1).*(high-low)+low;
    end
end