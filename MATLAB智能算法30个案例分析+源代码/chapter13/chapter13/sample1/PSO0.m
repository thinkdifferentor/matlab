%% ��ջ���
clc
clear

%% ������ʼ��
%����Ⱥ�㷨�е���������
c1 = 1.49445;
c2 = 1.49445;

maxgen=300;    %��������  
sizepop=20;   %��Ⱥ��ģ
Vmax=0.5;
Vmin=-0.5;
popmax=2;
popmin=-2;

for k=1:100
    %% ������ʼ���Ӻ��ٶ�
    k
    for i=1:sizepop
        %�������һ����Ⱥ
        pop(i,:)=2*rands(1,2);    %��ʼ��Ⱥ
        V(i,:)=0.5*rands(1,2);  %��ʼ���ٶ�
        %������Ӧ��
        fitness(i)=fun(pop(i,:));   %Ⱦɫ�����Ӧ��
    end

    %% ���弫ֵ��Ⱥ�弫ֵ
    [bestfitness bestindex]=max(fitness);
    zbest=pop(bestindex,:);   %ȫ�����
    gbest=pop;    %�������
    fitnessgbest=fitness;   %���������Ӧ��ֵ
    fitnesszbest=bestfitness;   %ȫ�������Ӧ��ֵ

    %% ����Ѱ��
    for i=1:maxgen
    
        for j=1:sizepop
        
            %�ٶȸ���
            V(j,:) = V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(zbest - pop(j,:));
            V(j,find(V(j,:)>Vmax))=Vmax;
            V(j,find(V(j,:)<Vmin))=Vmin;

            %��Ⱥ����
            pop(j,:)=pop(j,:)+V(j,:);
            pop(j,find(pop(j,:)>popmax))=popmax;
            pop(j,find(pop(j,:)<popmin))=popmin;
        
            %��Ӧ��ֵ
            fitness(j)=fun(pop(j,:)); 

        end

        for j=1:sizepop

            %�������Ÿ���
            if fitness(j) > fitnessgbest(j)
                gbest(j,:) = pop(j,:);
                fitnessgbest(j) = fitness(j);
            end

            %Ⱥ�����Ÿ���
            if fitness(j) > fitnesszbest
                zbest = pop(j,:);
                fitnesszbest = fitness(j);
            end
        end 
        yy(i)=fitnesszbest;    

    end
    s(k,:)=yy;
end
%% �������
for m=1:300
    s(101,m)=sum( s(:,m) )/100;
end
plot(s(101,:),'k')
title('���Ÿ�����Ӧ��','fontsize',12);
xlabel('��������','fontsize',12);ylabel('��Ӧ��','fontsize',12);

