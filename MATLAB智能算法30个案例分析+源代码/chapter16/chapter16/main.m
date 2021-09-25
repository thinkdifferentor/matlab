%% ��̬����Ⱥ�㷨

%% ��ջ���
clear
clc

%% ����˫�����
% ����con1����
X1 = 25;
Y1 = 25;
H1 =410;

%����con2����
H2=zeros(1,1200);
i=1:200;
H2(i)=450-fix(i/5);
i=201:700;
H2(i)=410;
i=701:1000;
H2(i)=350 + fix((i-500)/10)*3;
i=1001:1200;
H2(i) = 500;

X2=zeros(1,1200);
i=1:1200;
Y2(i)=-25;
i=1:500;
X2(i)=-25 + (i-1)*25/500;
i=501:1000;
X2(i)=0;
i=1001:1200;
X2(i)=(i-1000)*25/200;

%% ��ʼ�����Ӻ���������
% ��Ⱥ��ģ
n = 20;
% ���Ӻ���������
pop = unidrnd(501,[n,2]);
popTest = unidrnd(501,[5*n,2]);
% ���ָ߶�
h = DF1function(X1,Y1,H1,X2(1),Y2(1),H2(1));
V = unidrnd(100,[n,2])-50;
Vmax=25;Vmin=-25;

%% ���Ӻ�����������Ӧ��ֵ
fitness=zeros(1,n);
fitnessTest=zeros(1,n);
for i=1:n
    fitness(i)=h(pop(i,1),pop(i,2));
    fitnessTest(i)=h(popTest(i,1),popTest(i,2));
end
oFitness=sum(fitnessTest); %��������
[value,index]=max(fitness);
popgbest=pop;
popzbest=pop(index,:);
fitnessgbest=fitness;
fitnesszbest=fitness(index);

%% �㷨����
vmax = 10;
vmin = -10;
popMax=501;
popMin=1;
m = 2;
nFitness = oFitness;
Tmax=100; %ÿ�ε�������
fitnessRecord=zeros(1,1200);
%% ѭ��Ѱ�����ŵ�
for k = 1:1200
    k

    % �����ֵ�ͼ
    h = DF1function(X1,Y1,H1,X2(k),Y2(k),H2(k));
    
    % �������ӱ仯
    for i=1:5*n
        fitnessTest(i)=h(popTest(i,1),popTest(i,2));
    end
    oFitness=sum(fitnessTest);
    
    % �仯������ֵ�����³�ʼ��
    if abs(oFitness - nFitness)>1
        index=randperm(20);
        pop(index(1:10),:)=unidrnd(501,[10,2]);
        V(index(1:10),:)=unidrnd(100,[10,2])-50;
    end
    
    % ��������
    for i=1:Tmax
    
        for j=1:n
            % �ٶȸ���
            V(j,:)=V(j,:)+floor(rand*(popgbest(j,:)-pop(j,:)))+floor(rand*(popzbest - pop(j,:)));
            index1=find(V(j,:)>Vmax);
            V(j,index1)=Vmax;
            index2=find(V(j,:)<Vmin);
            V(j,index2)=Vmin;
            
            % �������
            pop(j,:)=pop(j,:)+V(j,:);
            index1=find(pop(j,:)>popMax);
            pop(j,index1)=popMax;
            index2=find(pop(j,:)<popMin);
            pop(j,index2)=popMin;
            
            % ����Ӧ��ֵ
            fitness(j)=h(pop(j,1),pop(j,2));
            
            % ���弫ֵ����
            if fitness(j) > fitnessgbest(j)
                popgbest(j,:) = pop(j,:);
                fitnessgbest(j) = fitness(j);
            end   
            
            % Ⱥ�弫ֵ����
            if fitness(j) > fitnesszbest
                popzbest= pop(j,:);
                fitnesszbest = fitness(j);
            end
            
        end
    end
    
    fitnessRecord(k)=fitnesszbest;
    fitnesszbest=0;
    fitnessgbest=zeros(1,20);
end

figure
plot(fitnessRecord(1:1200),'*-')
title('��̬����ֵ')