%��⺯��
clc;
x0 = [0 0];      % starting point
A = [0.038 -1]; b = 0;  % matrix and rhs vector for linear inequality 
options = optimset('Display','iter'); % show progress after each iteration
x = fmincon('fun1',x0,A,b,[],[],[-Inf; 1],[1.8; Inf],'nonlcon1',options);

%{
��������˵����
x=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)��options����ָ���Ĳ���������С����
fun���Ŀ�꺯�����ʽ
x0, ��ʾ��ʼ�Ĳ²�ֵ����СҪ�������Ŀ��ͬ
A b Ϊ���Բ���Լ����A*x <= b�� AӦΪn*n�׾���ѧ�����Դ���Ӧ����д��A��b
Aeq beqΪ�������Լ����Aeq*x = beq�� Aeq beqͬ�Ͽ���
lb ubΪ���������±߽磬 ���������� -Inf��Inf��ʾ�� lb ubӦΪN������
nonlcon Ϊ������Լ�����ɷ�Ϊ�����֣������Բ���Լ�� c�����������Լ����ceq
%}


