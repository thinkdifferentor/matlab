clear
clc
fitnessfcn = @GA_demo;           % ��Ӧ�Ⱥ������
nvars = 2;         % ����ı�����Ŀ
options = gaoptimset('PopulationSize',100,'EliteCount',10,'CrossoverFraction',0.75,'Generations',500,'StallGenLimit',500,'TolFun',1e-100,'PlotFcns',{@gaplotbestf,@gaplotbestindiv}); %��������
[x_best,fval] =ga(fitnessfcn,nvars,[],[],[],[],[],[],[],options);   % ����ga����

