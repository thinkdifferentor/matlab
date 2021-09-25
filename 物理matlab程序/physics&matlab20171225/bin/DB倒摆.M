%%function db(hc,hs)
x0=0.1;
v0=0.1;hc=1;
%%d=get(hs,'value');
[t,u]=ode45('dbljs',[0:2*pi/300:100],[x0,v0],[],0.78);

figure
set(gcf,'unit','normalized','Position',[0.04 0.04 0.94 0.8]);

subplot(2,2,1) %\fs{位移曲线}
plot(t,u(:,1))
title('位移曲线');
axis([0,150,-2.5,2.5]);
xlabel('x');ylabel('t');


subplot(2,2,2)  %\fs{相图(奇怪吸引子)}
plot(u(:,1),u(:,2))
title('相图');
axis([-2 2 -1.5 1.5])
xlabel('x');ylabel('v');

Y=fft(u(:,1));  %\fs{傅里叶功率分析}
Y(1)=[];
n=length(Y);
power=abs(Y(1:n/2)).^2/n^2; %\fs{功率}
freq=100*(1:n/2)./n; %\fs{频率}
subplot(2,3,4)
plot(freq,power)
axis([0 0.6 0 0.3])
title('功率谱');
xlabel('频率/Hz');ylabel('功率/w');

subplot(2,3,5)  %\fs{庞加莱截面}
plot(u(2000:300:4700,1),u(2000:300:4700,2),'r.');
axis([-2 2 -1.5 1.5])
title('彭加莱截面图');

subplot(2,3,6)%\fs{实物模拟图}
L=1;
axis([-L L -L L])
axis square
title('倒摆运动模拟');
hold on
plot(0,0,'r.')
ball=line(L*sin(x0),L*cos(x0),'color','r','marker','.',...
   'markersize',40,'erasemode','xor');
gan=line([0,L*sin(x0)],[0,L*cos(x0)],'color','b','linewidth',2,...
   'erasemode','xor');
for i=1:2:4770
   set(ball,'xData',L*sin(u(i,1)),'yData',L*cos(u(i,1)))
   set(gan,'xData',[0,L*sin(u(i,1))],'yData',[0,L*cos(u(i,1))])
   drawnow
end
%%if get(hc,'value')==1
   [t,u]=ode45('dbljs',[0:0.01:100],[x0,v0],[],0.78);
   [t1,u1]=ode45('dbljs',[0:0.01:100],[x0,v0-0.001],[],0.78);
   figure
   plot(t,u(:,1),'r',t1,u1(:,1),'g')
   xlabel('时间');
   ylabel('摆角');
   title('初条件有微小差异时的位移曲线');
%%end
