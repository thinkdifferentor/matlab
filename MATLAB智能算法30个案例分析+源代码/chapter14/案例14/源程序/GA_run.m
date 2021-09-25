clear
clc
fitnessfcn = @ PSO_PID;    % ��Ӧ�Ⱥ������
nvars=3;                   % ���������Ŀ
LB = [0 0 0];              % ����
UB = [300 300 300];        % ����
options=gaoptimset('PopulationSize',100,'PopInitRange',[LB;UB],'EliteCount',10,'CrossoverFraction',0.6,'Generations',100,'StallGenLimit',100,'TolFun',1e-100,'PlotFcns',{@gaplotbestf,@gaplotbestindiv});   % �㷨��������
[x_best,fval]=ga(fitnessfcn,nvars, [],[],[],[],LB,UB,[],options);      % �����Ŵ��㷨
