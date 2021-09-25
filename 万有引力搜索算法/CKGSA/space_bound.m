%This function checks the search space boundaries for agents.
% 此函数检查物体的搜索空间边界。

function  X=space_bound(X,up,low)

[N,dim]=size(X);
for i=1:N 
%     %%Agents that go out of the search space, are reinitialized randomly .
% 如果物体跑出搜索空间，重新随机初始化物体的位置
    Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+((rand(1,dim).*(up-low)+low).*(Tp+Tm));
    
%     %%Agents that go out of the search space, are returned to the boundaries.
% 如果物体跑出搜索空间，将物体返回到搜索空间边界
%         Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+up.*Tp+low.*Tm;

end
