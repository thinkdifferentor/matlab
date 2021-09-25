PopSize=500;%��Ⱥ��С
CityNum = 14;%������
OldBestFitness=0;%�ɵ�������Ӧ��ֵ
Iteration=0;%��������
MaxIteration =2000;%����������
IsStop=0;%����ֹͣ��־ 
Num=0;%ȡ����ͬ��Ӧ��ֵ�ĵ�������

c1=0.5;%������֪ϵ��
c2=0.7;%���ѧϰϵ��

%===========================Attention=====================================
%�������µ��Ż�--��ռ���������������ŵ������������Ӻͽ�ռ����С�������¼��٣�����㷨��Ч�ʣ�
w=0.96-Iteration/MaxIteration;%����ϵ��,������������Ӷ��ݼ�

%�ڵ�����
node=[16.47 96.10; 16.47 94.44; 20.09 92.54; 22.39 93.37; 25.23 97.24;...
     22.00 96.05; 20.47 97.02; 17.20 96.29; 16.30 97.38; 14.05 98.12;...
     16.53 97.38; 21.52 95.59; 19.41 97.13; 20.09 94.55];

%��ʼ�������ӣ�������·����Ⱥ
Group=ones(CityNum,PopSize);   
for i=1:PopSize
    Group(:,i)=randperm(CityNum)';
end

Group=sort(Group);

%��ʼ�������ٶȣ���������
Velocity =zeros(CityNum,PopSize);   
for i=1:PopSize
    Velocity(:,i)=round(rand(1,CityNum)'*CityNum); %roundȡ��
end

%����ÿ������֮��ľ���
CityBetweenDistance=zeros(CityNum,CityNum);   
for i=1:CityNum
    for j=1:CityNum
        CityBetweenDistance(i,j)=sqrt((node(i,1)-node(j,1))^2+(node(i,2)-node(j,2))^2);
    end
end

%����ÿ��·���ľ���
% EachPathDis=zeros(1,PopSize);%
for i=1:PopSize   
        EachPathDis(i) = PathDistance(Group(:,i)',CityBetweenDistance);
end

IndivdualBest=Group;%��¼�����ӵĸ��弫ֵ��λ��,�������ҵ������·��
IndivdualBestFitness=EachPathDis;%��¼�����Ӧ��ֵ,�������ҵ������·���ĳ���
[GlobalBestFitness,index]=min(EachPathDis);%�ҳ�ȫ������ֵ����Ӧ��� 

%��ʼ�����
figure;
subplot(2,2,1);
PathPlot(node,CityNum,index,IndivdualBest);
title('�����');

%Ѱ��
while(IsStop == 0) && (Iteration < MaxIteration) 
    %������������
    Iteration = Iteration +1;  
    
    %����ȫ�ּ�ֵ��λ��,����ָ·��
    for i=1:PopSize   
        GlobalBest(:,i) = Group(:,index);
      
    end
    
    %��pij-xij ,pgj-xij�����򣬲��Ը���c1��c2�ı���������
    pij_xij=GenerateChangeNums(Group,IndivdualBest);  
    pij_xij=HoldByOdds(pij_xij,c1); 
    pgj_xij=GenerateChangeNums(Group,GlobalBest);
    pgj_xij=HoldByOdds(pgj_xij,c2);
    
    %�Ը���w������һ��������
    Velocity=HoldByOdds(Velocity,w);

    Group = PathExchange(Group,Velocity); %���ݽ��������·������
    Group = PathExchange(Group,pij_xij);
    Group = PathExchange(Group,pgj_xij);
    for i = 1:PopSize    % ���¸�·���ܾ���
          EachPathDis(i) = PathDistance(Group(:,i)',CityBetweenDistance);
    
    end

    IsChange = EachPathDis<IndivdualBestFitness;%���º�ľ������ڸ���ǰ�ģ���¼���
    IndivdualBest(:, find(IsChange)) = Group(:, find(IsChange));%���¸������·��
    IndivdualBestFitness = IndivdualBestFitness.*( ~IsChange) + EachPathDis.*IsChange;%���¸������·������
    [GlobalBestFitness, index] = min(EachPathDis);%����ȫ�����·��,��¼��Ӧ�����
   
    if GlobalBestFitness==OldBestFitness %�Ƚϸ���ǰ�͸��º����Ӧ��ֵ;
        Num=Num+1; %���ʱ��¼��һ;
    else
        OldBestFitness=GlobalBestFitness;%�����ʱ������Ӧ��ֵ������¼����;
        Num=0;
    end    
    if Num >= 20 %��ε�������Ӧ��ֵ���ʱ����ֹͣ
        IsStop=1;
    end

     BestFitness(Iteration) =GlobalBestFitness;%ÿһ����������Ӧ��


end

%���Ž�
subplot(2,2,2);
PathPlot(node,CityNum,index,IndivdualBest);
title('�Ż���');
%��������
subplot(2,2,3);
plot((1:Iteration),BestFitness(1:Iteration));
grid on;
title('��������');
%��С·��ֵ
GlobalBestFitness