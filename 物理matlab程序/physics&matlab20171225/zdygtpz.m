%质点与刚体的完全非弹性碰撞
clear                                  %清除变量
j=0:0.1:5;                             %转动惯量比
v=1./(1+j);                            %碰撞后的速度
figure                                 %创建图形窗口
subplot(2,1,1)                         %选子图
plot(j,v,'LineWidth',2)                %画速度曲线
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itJ/mL\rm^2','fontsize',fs)   %加横坐标标签
ylabel('\it\omega/\omega\rm_0,\itv/v\rm_0','fontsize',fs)%加纵坐标标签
title('质点与刚体完全非弹性碰撞后的角速度和速度','fontsize',fs)%加标题
text(0,0.5,'\it\omega\rm=\itv\rm_0/\itL','fontsize',fs)%角速度的单位

dTm=-(2+j).*j./(1+j).^2;               %质点动能的增量
dTj=j./(1+j).^2;                       %刚体动能的增量
dT=-j./(1+j);                          %系统动能的增量
subplot(2,1,2)                         %选子图
plot(j,dTm,j,dTj,'--',j,dT,'-.','LineWidth',2)%画动能增量曲线
legend('质点动能的增量','刚体动能的增量','系统动能的增量',0)%图例
title('质点与刚体完全非弹性碰撞后的动能的增量','fontsize',fs)%加标题
xlabel('\itJ/mL\rm^2','fontsize',fs)   %加横标签
grid on                                %加网格
text(0,0,'\itE\rm_0=\itmv\rm_0^2/2','fontsize',fs)%能量的单位

