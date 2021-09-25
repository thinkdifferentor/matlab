%本程序给出不同分子在同一温度下的麦克斯韦速率分布率
T=300;
k=1.38e-23 ;
v=0:10:5000 ;
m1=3.35e-27;
m2=4.648e-26;
m3=6.03e-26;
m4=7.37e-26;
f1 =4*pi* (v.^2).* (m1/(2*pi*k*T))^1.5.*exp (-m1* (v.^2)/(2*k*T))
f2 =4*pi* (v.^2).* (m2/(2*pi*k*T))^1.5.*exp (-m2* (v.^2)/(2*k*T))
f3 =4*pi* (v.^2).* (m3/(2*pi*k*T))^1.5.*exp (-m3* (v.^2)/(2*k*T))
f4 =4*pi* (v.^2).* (m4/(2*pi*k*T))^1.5.*exp (-m4* (v.^2)/(2*k*T))
plot(v,f1,'g','linewidth',2)
hold on
plot(v,f2,'r','linewidth',2)
hold on
plot(v,f3,'b','linewidth',2)
hold on
plot(v,f4,'k','linewidth',2)
grid
legend('H_2','N_2','O_2','CO_2')
xlabel('v/(m/s)'),ylabel('f/(v)')
 