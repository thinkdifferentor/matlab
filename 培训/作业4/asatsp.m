function [R_best,L_best,L_ave,Shortest_Route,Shortest_Length]=asatsp(C,NC_max,m,Alpha,Beta,Rho,Q)
%%  ��Ҫ����˵��
%%  C  n�����е����꣬n*2�ľ���
%%  NC_max  ��Ⱥ�㷨MATLAB��������������
%%  m  ���ϸ���
%%  Alpha  ������Ϣ����Ҫ�̶ȵĲ���
%%  Beta  ��������ʽ������Ҫ�̶ȵĲ���
%%  Rho  ��Ϣ������ϵ��
%%  Q  ��ʾ��Ⱥ�㷨MATLAB������Ϣ������ǿ��ϵ��
%%  R_best  �������·��
%%  L_best  �������·�ߵĳ���

%%  ��Ⱥ�㷨MATLAB�����һ����������ʼ��
n=size(C,1);% n��ʾ����Ĺ�ģ�����и�����
D=zeros(n,n);% D��ʾ��ȫͼ�ĸ�Ȩ�ڽӾ���
for i=1:n
    for j=1:n
        if i~=j
            D(i,j)=((C(i,1)-C(j,1))^2+(C(i,2)-C(j,2))^2)^0.5;
        else
            D(i,j)=eps;
        end
        D(j,i)=D(i,j);
    end
end
Eta=1./D;  %%  EtaΪ�������ӣ�������Ϊ����ĵ���
Tau=ones(n,n);  %%  TauΪ��Ϣ�ؾ���
Tabu=zeros(m,n);  %%  �洢����¼·��������
NC=1;  %%  ��������������¼��������
R_best=zeros(NC_max,n);  %%  �������·��
L_best=inf.*ones(NC_max,1);  %%  �������·�ߵĳ���
L_ave=zeros(NC_max,1);  %%  ����·�ߵ�ƽ������

while NC<=NC_max  %%  ֹͣ����֮һ���ﵽ������������ֹͣ
    %%  ��Ⱥ�㷨MATLAB����ڶ�������mֻ���Ϸŵ�n��������
    
    Randpos=[];  %%  �����ȡ
    for i=1:ceil(m/n)
        Randpos=[Randpos,randperm(n)];
    end
    Tabu(:,1)=Randpos(1,1:m)';
    
    %%  ��Ⱥ�㷨MATLAB��������mֻ���ϰ����ʺ���ѡ����һ�����У���ɸ��Ե�����
    
    for j=2:n
        for i=1:m
            visited=Tabu(i,1:(j-1));  %%  ��¼�ѷ��ʵĳ��У������ظ�����
            J=zeros(1,n-j+1);  %%  �����ʵĳ���
            P=J;  %%  �����ʳ��е�ѡ����ʷֲ�
            Jc=1;
            for k=1:n
                if length(find(visited==k))==0
                    J(Jc)=k;
                    Jc=Jc+1;
                end
            end
            
            %%  ���������Ⱥ�㷨MATLAB�����ѡ���еĸ��ʷֲ�
            
            for k=1:length(J)
                P(k)=Tau(visited(end),J(k))^Alpha*(Eta(visited(end),J(k))^Beta);
            end
            P=P/sum(P);
            
            %%  ������ԭ��ѡȡ��һ������
            
            Pcum=cumsum(P);  %%  cumsum:Ԫ���ۼ����
            Select=find(Pcum>=rand);
            to_visit=J(Select(1));
            Tabu(i,j)=to_visit;
        end
    end
    if NC>=2
        Tabu(1,:)=R_best(NC-1,:);
    end
    
    %%  ��Ⱥ�㷨MATLAB������Ĳ�����¼���ε������·��
    
    L=zeros(m,1);
    for i=1:m
        R=Tabu(i,:);
        for j=1:(n-1)
            L(i)=L(i)+D(R(j),R(j+1));
        end
        L(i)=L(i)+D(R(1),R(n));
    end
    L_best(NC)=min(L);
    pos=find(L==L_best(NC));
    R_best(NC,:)=Tabu(pos(1),:);
    L_ave(NC)=mean(L);
    NC=NC+1;
    
    %%  ��Ⱥ�㷨MATLAB������岽��������Ϣ��
    
    Delta_Tau=zeros(n,n);
    for i=1:m
        for j=1:(n-1)
            Delta_Tau(Tabu(i,j),Tabu(i,j+1))=Delta_Tau(Tabu(i,j),Tabu(i,j+1))+Q/L(i);
            %%  �˴�ѭ����·�� (i,j) �ϵ���Ϣ������
        end
        Delta_Tau(Tabu(i,n),Tabu(i,1))=Delta_Tau(Tabu(i,n),Tabu(i,1))+Q/L(i);
        %%  �˴�ѭ��������·���ϵ���Ϣ������
    end
    Tau=(1-Rho).*Tau+Delta_Tau;  %%  ������Ϣ�ػӷ������º����Ϣ��
    
    %%  ��Ⱥ�㷨MATLAB��������������ɱ�����
    
    Tabu=zeros(m,n);
end
NC
%% ��Ⱥ�㷨MATLAB������߲���������

Pos=find(L_best==min(L_best));
Shortest_Route=R_best(Pos(1),:)
Shortest_Length=L_best(Pos(1))
subplot(1,2,1)
DrawRoute(C,Shortest_Route)  %%  ��·��ͼ
subplot(1,2,2)
plot(L_best)
hold on
plot(L_ave,'r')
title('ƽ���������̾���')

%%  ��Ⱥ�㷨MATLAB�����Ӻ���

function DrawRoute(C,R)

N=length(R);
scatter(C(:,1),C(:,2));
hold on
plot([C(R(1),1),C(R(N),1)],[C(R(1),2),C(R(N),2)],'g')
hold on
for ii=2:N
    plot([C(R(ii-1),1),C(R(ii),1)],[C(R(ii-1),2),C(R(ii),2)],'g')
    hold on
end
title('�����������Ż����')