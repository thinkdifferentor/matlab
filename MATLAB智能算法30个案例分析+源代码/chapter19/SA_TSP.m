clc;
clear;
close all;
%%
tic
T0=1000;   % ��ʼ�¶�
Tend=1e-3;  % ��ֹ�¶�
L=500;    % ���¶��µĵ���������������
q=0.9;    %��������

%% ��������
load CityPosition1;
%%
D=Distanse(X);  %����������
N=size(D,1);    %���еĸ���
%% ��ʼ��
S1=randperm(N);  %�������һ����ʼ·��

%% ����������·��ͼ
DrawPath(S1,X)
pause(0.0001)
%% ���������·�����ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ:')
OutputPath(S1);
Rlength=PathLength(D,S1);
disp(['�ܾ��룺',num2str(Rlength)]);

%% ��������Ĵ���Time
Time=ceil(double(solve(['1000*(0.9)^x=',num2str(Tend)])));
count=0;        %��������
Obj=zeros(Time,1);         %Ŀ��ֵ�����ʼ��
track=zeros(Time,N);       %ÿ��������·�߾����ʼ��
%% ����
while T0>Tend
    count=count+1;     %���µ�������
    temp=zeros(L,N+1);
    for k=1:L
        %% �����½�
        S2=NewAnswer(S1);
        %% Metropolis�����ж��Ƿ�����½�
        [S1,R]=Metropolis(S1,S2,D,T0);  %Metropolis �����㷨
        temp(k,:)=[S1 R];          %��¼��һ·�ߵļ���·��
    end
    %% ��¼ÿ�ε������̵�����·��
    [d0,index]=min(temp(:,end)); %�ҳ���ǰ�¶�������·��
    if count==1 || d0<Obj(count-1)
        Obj(count)=d0;           %�����ǰ�¶�������·��С����һ·�����¼��ǰ·��
    else
        Obj(count)=Obj(count-1);%�����ǰ�¶�������·�̴�����һ·�����¼��һ·��
    end
    track(count,:)=temp(index,1:end-1);  %��¼��ǰ�¶ȵ�����·��
    T0=q*T0;     %����
    fprintf(1,'%d\n',count)  %�����ǰ��������
end
%% �Ż����̵���ͼ
figure
plot(1:count,Obj)
xlabel('��������')
ylabel('����')
title('�Ż�����')

%% ���Ž��·��ͼ
DrawPath(track(end,:),X)

%% ������Ž��·�ߺ��ܾ���
disp('���Ž�:')
S=track(end,:);
p=OutputPath(S);
disp(['�ܾ��룺',num2str(PathLength(D,S))]);
disp('-------------------------------------------------------------')
toc