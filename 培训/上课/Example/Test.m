%��⺯��
function [x]=Test()
x0 = [0 0];      % starting point
A = [0.038 -1]; b = 0;  % matrix and rhs vector for linear inequality 
options = optimset('Display','iter'); % show progress after each iteration
x = fmincon(@fun1,x0,A,b,[],[],[-Inf; 1],[1.8; Inf],@nonlcon1,options);

end

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


%Ŀ�꺯��
function y=fun1(x)
y=x(1)-0.25*x(2)+0.6;
end

%�����Բ���ʽԼ������
function [c,ce] = nonlcon1(x)
c = 0.038-x(2)/x(1);
ce = [];%û�����Բ���ʽԼ��
end





