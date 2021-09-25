%���������˶��Ķ�����λ��
clear                                  %�������
a=0.2;                                 %Լ�����A/l
xm=1+2*a;                              %ͼ�η�Χ
xx=linspace(0,1+a,1000);               %���ɵĳ�ʼ������
n=20;                                  %�����ߵĸ���
s0=0.02;                               %���ɴ�ϸ
yy=s0*sin(xx/(1+a)*n*2*pi);            %�������߱�ʾ����
figure                                 %����ͼ�δ���
subplot(2,1,1)                         %ѡ��ͼ
plot([1;1],[-2;-4]*s0)                 %��ƽ��λ��
grid on                                %������
axis equal off                         %���������
fs=16;                                 %�����С
title('�������ӵ��˶�','FontSize',fs)  %��ʾ����
hold on                                %����ͼ��
plot([0;0;xm],[1;-1;-1]*2*s0,'LineWidth',3)%������ˮƽ��
ball=plot(1+a,yy(end),'g.','MarkerSize',50);%ȡ��ľ��
spring=plot(xx,yy,'r','LineWidth',2);  %ȡ���ɵľ��
pause(10);                                  %��ͣ
t=0;                                   %��ʼʱ��
dt=0.005;                              %ʱ����(����)
while 1                                %����ѭ��
    if get(gcf,'CurrentCharacter')==char(27) break;end  %��ESC�����ж�ѭ��
    x=a*cos(2*pi*t);                   %����λ��
    set(ball,'xdata',x+1)              %�����������
    xx=linspace(0,1+x,1000);           %���ɵĺ�����
    yy=s0*sin(xx./(1+x)*n*2*pi);       %���ɸ����������
    set(spring,'xdata',xx,'ydata',yy)  %���õ��ɵ�����
    drawnow                            %ˢ��
   if abs(t-5)<1e-6,break,end
    t=t+dt;                            %��һ��ʱ��
end                                    %����ѭ��
t=0:dt:2;                              %ʱ������
x=a*cos(2*pi*t);                       %����λ��
subplot(2,1,2)                         %ѡ��ͼ
plot(t,x,'LineWidth',2)                %������
grid on                                %������
title('�������ӵ�λ��','FontSize',fs)  %��ʾ����
xlabel('\itt/T','FontSize',fs)         %��Ǻ���
ylabel('\itx/l','FontSize',fs)         %�������
text(0,0,'\itT\rm=2\pi(\itm/k\rm)^{1/2}','FontSize',fs)%��������ı�

