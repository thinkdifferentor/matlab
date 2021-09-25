% This function checks the search space boundaries for agents.
function X=space_bound(X,up,low)
[N,dim]=size(X);
for i=1:N
    % 对越界值进行重新初始化 Agents that go out of the search space, are reinitialized randomly.
    Tp=X(i,:)>up;
    Tm=X(i,:)<low;
    X(i,:)=(X(i,:).*(~(Tp+Tm)))+((rand(1,dim).*(up-low)+low).*logical((Tp+Tm)));
    % 将越界值重置为边界值 Agents that go out of the search space, are returned to the boundaries.
    % Tp=X(i,:)>up;
    % Tm=X(i,:)<low;
    % X(i,:)=(X(i,:).*(~(Tp+Tm)))+up.*Tp+low.*Tm;
end