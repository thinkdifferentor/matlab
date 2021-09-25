%物体在平衡点从静止开始的受迫振动曲线(求微分方程的数值解)
clear                                  %清除变量
b=input('请输入约化阻尼因子(0~1):');   %键盘输入约化阻尼因子
if b<=0|b>=1 return,end                %不符合条件则不向下执行程序
w=sqrt(1-b^2);                         %约化阻尼圆频率
s=['请输入约化驱动力圆频率(约化阻尼圆频率为',num2str(w),'):'];%提示字符串
W=input(s);                            %键盘输入约化驱动力圆频率
if W==1 W=1-eps;end                    %如果为1则改小一点
tm=30;                                 %最大时间
t=0:0.001:tm;                          %时间向量
[tm,XV]=ode45('spzdfun',t,[0;0],[],b,W);%计算位移和速度
x=real(XV(:,1));                             %取位移
v=real(XV(:,2));                             %取速度
%-----------------------------------------------------------
figure                                 %创建图形窗口
subplot(2,1,1)                         %选子图
plot(t,x,'LineWidth',2)                %画位移曲线
grid on                                %加网格
fs=15;                                 %字体大小
txt='\itA\rm_0=\itF\rm_0/\itm\omega\rm_0^2';%振幅文本
xm=max(abs(x));                        %位移最大值
text(0,xm,txt,'FontSize',fs)           %标记振幅文本
title('受迫振动的位移时间曲线','FontSize',fs)%标题
xlabel('\it\omega\rm_0\itt','FontSize',fs)%标记横坐标
ylabel('\itx/A\rm_0','FontSize',fs)    %标记纵坐标
subplot(2,1,2)                         %选子图
plot(t,v,'LineWidth',2)                %画速度曲线
grid on                                %加网格
txt='\itv\rm_0=\itF\rm_0/\itm\omega\rm_0';%振幅文本
vm=max(abs(v));                        %速度最大值
text(0,vm,txt,'FontSize',fs)           %标记振幅文本
title('受迫振动的速度时间曲线','FontSize',fs)%标题
xlabel('\it\omega\rm_0\itt','FontSize',fs)%标记横坐标
ylabel('\itv/v\rm_0','FontSize',fs)    %标记纵坐标

