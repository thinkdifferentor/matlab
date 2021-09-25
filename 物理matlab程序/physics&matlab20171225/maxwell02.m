%本程序给出同一气体（氢气）在不同温度下的麦克斯韦分布率
m=3.35e-27;
k=1.38e-23 ;
v=0:10:8000 ;
T1=300
T2=600
T3=900
T4=1200;
f1=4*pi*(v.^2).*(m/(2*pi*k*T1))^1.5.*exp(-m*(v.^2)/(2*k*T1))
f2=4*pi*(v.^2).*(m/(2*pi*k*T2))^1.5.*exp(-m*(v.^2)/(2*k*T2))
f3=4*pi*(v.^2).*(m/(2*pi*k*T3))^1.5.*exp(-m*(v.^2)/(2*k*T3))
f4=4*pi*(v.^2).*(m/(2*pi*k*T4))^1.5.*exp(-m*(v.^2)/(2*k*T4))
plot(v,f1,'r','linewidth',2)
hold on
plot(v,f2,'g','linewidth',2)
hold on
plot(v,f3,'k','linewidth',2)
hold on
plot(v,f4,'y','linewidth',2)
hold on
grid
legend('300K','600K','900K','1200K')
xlabel('v/(m/s)'),ylabel('f/(v)')
 