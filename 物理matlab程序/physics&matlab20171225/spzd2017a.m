%������ƽ���Ӿ�ֹ��ʼ������������(��΢�ַ��̵���ֵ��)
clear                                  %�������
b=input('������Լ����������(0~1):');   %��������Լ����������
if b<=0|b>=1 return,end                %����������������ִ�г���
w=sqrt(1-b^2);                         %Լ������ԲƵ��
s=['������Լ��������ԲƵ��(Լ������ԲƵ��Ϊ',num2str(w),'):'];%��ʾ�ַ���
W=input(s);                            %��������Լ��������ԲƵ��
if W==1 W=1-eps;end                    %���Ϊ1���Сһ��
tm=30;                                 %���ʱ��
t=0:0.001:tm;                          %ʱ������
[tm,XV]=ode45('spzdfun',t,[0;0],[],b,W);%����λ�ƺ��ٶ�
x=real(XV(:,1));                             %ȡλ��
v=real(XV(:,2));                             %ȡ�ٶ�
%-----------------------------------------------------------
figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ѡ��ͼ
plot(t,x,'LineWidth',2)                %��λ������
grid on                                %������
fs=15;                                 %�����С
txt='\itA\rm_0=\itF\rm_0/\itm\omega\rm_0^2';%����ı�
xm=max(abs(x));                        %λ�����ֵ
text(0,xm,txt,'FontSize',fs)           %�������ı�
title('�����񶯵�λ��ʱ������','FontSize',fs)%����
xlabel('\it\omega\rm_0\itt','FontSize',fs)%��Ǻ�����
ylabel('\itx/A\rm_0','FontSize',fs)    %���������
subplot(2,1,2)                         %ѡ��ͼ
plot(t,v,'LineWidth',2)                %���ٶ�����
grid on                                %������
txt='\itv\rm_0=\itF\rm_0/\itm\omega\rm_0';%����ı�
vm=max(abs(v));                        %�ٶ����ֵ
text(0,vm,txt,'FontSize',fs)           %�������ı�
title('�����񶯵��ٶ�ʱ������','FontSize',fs)%����
xlabel('\it\omega\rm_0\itt','FontSize',fs)%��Ǻ�����
ylabel('\itv/v\rm_0','FontSize',fs)    %���������

