%This function checks the search space boundaries for agents.
% �˺����������������ռ�߽硣

function  X=space_bound(X,up,low)

[N,dim]=size(X);
for i=1:N 
%     %%Agents that go out of the search space, are reinitialized randomly .
% ��������ܳ������ռ䣬���������ʼ�������λ��
    Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+((rand(1,dim).*(up-low)+low).*(Tp+Tm));
    
%     %%Agents that go out of the search space, are returned to the boundaries.
% ��������ܳ������ռ䣬�����巵�ص������ռ�߽�
%         Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+up.*Tp+low.*Tm;

end
