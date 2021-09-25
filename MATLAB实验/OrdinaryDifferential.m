%��΢�ַ���
clear,clc

disp('��ֵ������� ��΢�ַ��� ');
odefun=@(t,y)y-2*t/y;
[t,y]=ode45(odefun,[0,4],1)
figure
plot(t,y,'*-');

disp('���΢�ַ�����');
[t,x]=ode45(@fun,[0 30],[1;0.5])

figure
subplot(1,2,1);
plot(t,x(:,1),t,x(:,2),':');
subplot(1,2,2);
plot(x(:,1),x(:,2));


figure
disp('�߽��������');
sinit=bvpinit(0:4,[-1;0]);
odefun=@(t,y)[y(2);-y(2)*sin(y(1))];
bcfun=@(ya,yb)[ya(1);yb(1)+2];
sol=bvp5c(odefun,bcfun,sinit)
t=linspace(0,4,101);
y=deval(sol,t);
plot(t,y(1,:),sol.x,sol.y(1,:),'o',sinit.x,sinit.y(1,:),'s');
legend('������','���','���Խ�');