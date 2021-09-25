%常微分方程
clear,clc

disp('初值问题求解 解微分方程 ');
odefun=@(t,y)y-2*t/y;
[t,y]=ode45(odefun,[0,4],1)
figure
plot(t,y,'*-');

disp('求解微分方程组');
[t,x]=ode45(@fun,[0 30],[1;0.5])

figure
subplot(1,2,1);
plot(t,x(:,1),t,x(:,2),':');
subplot(1,2,2);
plot(x(:,1),x(:,2));


figure
disp('边界问题求解');
sinit=bvpinit(0:4,[-1;0]);
odefun=@(t,y)[y(2);-y(2)*sin(y(1))];
bcfun=@(ya,yb)[ya(1);yb(1)+2];
sol=bvp5c(odefun,bcfun,sinit)
t=linspace(0,4,101);
y=deval(sol,t);
plot(t,y(1,:),sol.x,sol.y(1,:),'o',sinit.x,sinit.y(1,:),'s');
legend('解曲线','解点','粗略解');