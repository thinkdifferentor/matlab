%���ᶨ����ϵͳ�ļ��ٶȺ�����
clear                                  %�������
m2=0.5;R1=0.1;R2=0.05;J=0.005;g=10;    %��֪����
m1=0:0.1:1;                            %��������
m=m1*R1^2+m2*R2^2+J;                   %��ĸ
a1=(m1*R1-m2*R2)*R1*g./m;              %���ٶ�a1
a2=(m1*R1-m2*R2)*R2*g./m;              %���ٶ�a2
T1=(m2*R2*(R1+R2)+J).*m1*g./m;         %����T1
T2=(m1*R1*(R1+R2)+J).*m2*g./m;         %����T2
figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ѡ��ͼ
%plot(m1,[a1;a2])                       %�����ٶ�����
plot(m1,a1,m1,a2,'--','LineWidth',2)   %�����ٶ�����
fs=16;                                 %�����С
title('���ᶨ����ϵͳ�ļ��ٶ�','FontSize',fs)%�ӱ���
xlabel('\itm\rm_1/kg','FontSize',fs)   %�������ǩ
legend('\ita\rm_1/m\cdots^2','\ita\rm_2/m\cdots^2',4)%ͼ��
grid on                                %������
subplot(2,1,2)                         %ѡ��ͼ
%plot(m1,[T1;T2])                       %����������
plot(m1,T1,m1,T2,'--','LineWidth',2)   %����������
title('���ᶨ����ϵͳ������','FontSize',fs)%�ӱ���
xlabel('\itm\rm_1/kg','FontSize',fs)   %�������ǩ
legend('\itT\rm_1/N','\itT\rm_2/N',4)  %ͼ��
grid on                                %������
pause                                  %��ͣ
s1='m1*g-T1=m1*R1*alpha';              %��1������
s2='T2-m2*g=m2*R2*alpha';              %��2������
s3='T1*R1-T2*R2=J*alpha';              %��3������
% s1='m1*g-T1-m1*R1*alpha';              %��1������
% s2='T2-m2*g-m2*R2*alpha';              %��2������
% s3='T1*R1-T2*R2-J*alpha';              %��3������
s=solve(s1,s2,s3,'alpha','T1','T2')    %�󷽳���ķ��Ž�
alpha=s.alpha                          %��ʾ�Ǽ��ٶ�alpha
T1=s.T1                                %��ʾ����T1
T2=s.T2                                %��ʾ����T2
alpha=subs(alpha,{'m2','J','R1','R2','g'},{m2,J,R1,R2,g});%�滻��ֵ
T1=subs(T1,{'m2','R1','R2','J','g'},{m2,R1,R2,J,g});%T1�滻��ֵ
T2=subs(T2,{'m2','R1','R2','J','g'},{m2,R1,R2,J,g});%T2�滻��ֵ
alpha=subs(alpha,'m1',m1);             %�滻����
T1=subs(T1,'m1',m1);                   %�滻����������T1
T2=subs(T2,'m1',m1);                   %�滻����������T2
subplot(2,1,1)                         %ѡ��ͼ
hold on                                %����ͼ��
plot(m1,[alpha*R1;alpha*R2],'.')       %�ٻ����ٶ�����
subplot(2,1,2)                         %ѡ��ͼ
hold on                                %����ͼ��
plot(m1,[T1;T2],'.')                   %�ٻ���������

alpha=[];                              %�Ǽ��ٶ��������
T1=[];                                 %����T1�������
T2=[];                                 %����T2�������
for i=1:length(m1)                     %������m1ѭ��
    A=[m1(i)*R1,1,0;m2*R2,0,-1;J,-R1,R2];%ϵ������
    b=[m1(i)*g;-m2*g;0];               %��������
    x=A\b;                             %���̵Ľ�
    alpha=[alpha,x(1)];                %���ӽǼ��ٶ�
    T1=[T1,x(2)];                      %��������T1
    T2=[T2,x(3)];                      %��������T2
end                                    %����ѭ��
subplot(2,1,1)                         %ѡ��ͼ
plot(m1,[alpha*R1;alpha*R2],'o')       %�ٻ����ٶ�����
subplot(2,1,2)                         %ѡ��ͼ
plot(m1,[T1;T2],'o')                   %�ٻ���������

