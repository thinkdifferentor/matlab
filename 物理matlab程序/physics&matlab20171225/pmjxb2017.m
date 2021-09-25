%ƽ�沨����������
clear                                  %�������
%rand('state',0)
n=2.5;                                 %���ڵĸ���
t=0:0.05:n;                            %ʱ������(���ڵı���)
m=3;                                   %���ĸ���
x=0:0.01:m;                            %λ������(��������)
[X,T]=meshgrid(x,t);                   %ʱ���λ�þ���
a=0.2;                                 %���(�����ı���)
U=a*cos(2*pi*(T-X));                   %��������
figure                                 %����ͼ�δ���
waterfall(x,t,U)                       %���ٲ�����
%mesh(x,t,U)                            %����������
alpha(0.1)                             %ʹ����͸��
box on                                 %�ӿ��
axis equal                             %ʹ���������
fs=16;                                 %�����С
title('ƽ�沨�����̵�����','FontSize',fs)%����
xlabel('\itx/\lambda','FontSize',fs)   %x��ǩ
ylabel('\itt/T','FontSize',fs)         %y��ǩ
zlabel('\itu/\lambda','FontSize',fs)   %z��ǩ
i=floor(rand*length(x))+1;             %���ȡ������±�
x0=x(i);                               %ĳһ����
u1=a*cos(2*pi*(t-x0));                 %λ�Ʒ���
hold on                                %����ͼ��
plot3(ones(size(t))*x0,t,u1,'LineWidth',2)%����άλ������
i=floor(rand*length(t))+1;             %���ȡ������±�
t0=t(i);                               %ĳһʱ��
u2=a*cos(2*pi*(t0-x));                 %���η���
plot3(x,ones(size(x))*t0,u2,'r','LineWidth',2)%����ά��������

figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ȡ��ͼ
plot(t,u1,'LineWidth',2)               %���ʵ��λ������
grid on                                %������
title('ĳ�ʵ��������','FontSize',fs)%����
xlabel('\itt/T','FontSize',fs)         %x��ǩ
ylabel('\itu/\lambda','FontSize',fs)   %y��ǩ
text(0,a,['\itA\rm=',num2str(a),'\it\lambda'],'FontSize',fs)%����ı�
text(0,-a,['\itx\rm_0=',num2str(x0),'\it\lambda'],'FontSize',fs)%�������
subplot(2,1,2)                         %ȡ��ͼ
plot(x,u2,'LineWidth',2)               %����ʱ�̵Ĳ�������
grid on                                %������
title('ĳʱ�̵Ĳ�������','FontSize',fs)%����
xlabel('\itx/\lambda','FontSize',fs)   %x��ǩ   
ylabel('\itu/\lambda','FontSize',fs)   %y��ǩ
text(0,-a,['\itt\rm_0=',num2str(t0),'\itT'],'FontSize',fs)%���ʱ��

