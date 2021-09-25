%船受的摩擦力与速率的n次方成正比的运动(用一个微分方程数值解)
clear                                  %清除变量
tm=5;                                  %最大时间
dt=0.1;                                %时间间隔
t=0:dt:tm;                             %时间向量
n=0:0.5:3;                             %指数向量
n(n==1)=1+eps^(1/2);                   %为1的指数加小量
n(n==2)=2+eps^(1/2);                   %为2的指数也加小量
[N,T]=meshgrid(n,t);                   %化为矩阵
X=[];                                  %路程矩阵置空
V=[];                                  %速度矩阵置空
m=length(n);                           %指数个数
for i=1:m                              %按指数循环
    s=num2str(n(i));                   %取指数并化为字符串
    f=inline(['-v.^',num2str(n(i))],'t','v');%被积内线函数表达式
    [tt,v]=ode45(f,t,1);               %求微分方程数值解
    x=cumtrapz(v)*dt;                    %累积路程
    X=[X,x];                           %连接路程矩阵
    V=[V,v];                           %连接速度矩阵
end                                    %结束循环
%----------------------------------------------------------
V(N<1&T>1./(1-N))=nan;                 %将不合理的速度改为非数
X(N<1&T>1./(1-N))=nan;                 %将不合理的路程改为非数
figure                                 %创建图形窗口
%plot(t,V)                              %画速度曲线簇
plot(t,V(:,1),'o-',t,V(:,2),'d-',t,V(:,3),'s-',t,V(:,4),'p-',...
    t,V(:,5),'h-',t,V(:,6),'^-',t,V(:,7),'v-')%画速度曲线族
grid on                                %加网格
fs=16;                                 %字体大小
title('摩擦力与速率的\itn\rm次方成正比的速度与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('速度\itv/v\rm_0','FontSize',fs)%显示纵坐标
text(0,0.1,'\itt_n\rm=\itm/kv\rm_0^{\itn\rm-2}','FontSize',fs)%标记时间文本
hold on                                %保持图像
plot(t,exp(-t),'.',t,1./(1+t),'x')     %画n=1和2的解析式速度曲线
grid on                                %加网格
m=length(n);                           %指数个数
leg=[repmat('\itn\rm=',m,1),num2str(n')];%图例字符串
legend(char(leg,'\itn\rm=1的解析式','\itn\rm=2的解析式'))%图例

figure                                 %创建图形窗口
%plot(t,X)                              %画路程曲线簇
plot(t,X(:,1),'o-',t,X(:,2),'d-',t,X(:,3),'s-',t,X(:,4),'p-',...
    t,X(:,5),'h-',t,X(:,6),'^-',t,X(:,7),'v-')%画路程曲线族
title('摩擦力与速率的\itn\rm次方成正比的路程与时间','FontSize',fs)%显示标题
xlabel('时间\itt/t_n','FontSize',fs)   %显示横坐标
ylabel('路程\itx/x_n','FontSize',fs)   %显示纵坐标
text(0,1,'\itx_n\rm=\itv\rm_0\itt_n','FontSize',fs)%标记路程文本
grid on                                %加网格
hold on                                %保持图像
plot(t,1-exp(-t),'.',t,log(1+t),'x')   %画n=1和2的解析式路程曲线
legend(char(leg,'\itn\rm=1的解析式','\itn\rm=2的解析式'),2)%图例

