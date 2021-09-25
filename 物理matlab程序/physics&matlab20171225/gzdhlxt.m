%共轴定滑轮系统的加速度和张力
clear                                  %清除变量
m2=0.5;R1=0.1;R2=0.05;J=0.005;g=10;    %已知条件
m1=0:0.1:1;                            %质量向量
m=m1*R1^2+m2*R2^2+J;                   %分母
a1=(m1*R1-m2*R2)*R1*g./m;              %加速度a1
a2=(m1*R1-m2*R2)*R2*g./m;              %加速度a2
T1=(m2*R2*(R1+R2)+J).*m1*g./m;         %张力T1
T2=(m1*R1*(R1+R2)+J).*m2*g./m;         %张力T2
figure                                 %创建图形窗口
subplot(2,1,1)                         %选子图
%plot(m1,[a1;a2])                       %画加速度曲线
plot(m1,a1,m1,a2,'--','LineWidth',2)   %画加速度曲线
fs=16;                                 %字体大小
title('共轴定滑轮系统的加速度','FontSize',fs)%加标题
xlabel('\itm\rm_1/kg','FontSize',fs)   %横坐标标签
legend('\ita\rm_1/m\cdots^2','\ita\rm_2/m\cdots^2',4)%图例
grid on                                %加网格
subplot(2,1,2)                         %选子图
%plot(m1,[T1;T2])                       %画张力曲线
plot(m1,T1,m1,T2,'--','LineWidth',2)   %画张力曲线
title('共轴定滑轮系统的张力','FontSize',fs)%加标题
xlabel('\itm\rm_1/kg','FontSize',fs)   %横坐标标签
legend('\itT\rm_1/N','\itT\rm_2/N',4)  %图例
grid on                                %加网格
pause                                  %暂停
s1='m1*g-T1=m1*R1*alpha';              %第1个方程
s2='T2-m2*g=m2*R2*alpha';              %第2个方程
s3='T1*R1-T2*R2=J*alpha';              %第3个方程
% s1='m1*g-T1-m1*R1*alpha';              %第1个方程
% s2='T2-m2*g-m2*R2*alpha';              %第2个方程
% s3='T1*R1-T2*R2-J*alpha';              %第3个方程
s=solve(s1,s2,s3,'alpha','T1','T2')    %求方程组的符号解
alpha=s.alpha                          %显示角加速度alpha
T1=s.T1                                %显示张力T1
T2=s.T2                                %显示张力T2
alpha=subs(alpha,{'m2','J','R1','R2','g'},{m2,J,R1,R2,g});%替换数值
T1=subs(T1,{'m2','R1','R2','J','g'},{m2,R1,R2,J,g});%T1替换数值
T2=subs(T2,{'m2','R1','R2','J','g'},{m2,R1,R2,J,g});%T2替换数值
alpha=subs(alpha,'m1',m1);             %替换向量
T1=subs(T1,'m1',m1);                   %替换向量求张力T1
T2=subs(T2,'m1',m1);                   %替换向量求张力T2
subplot(2,1,1)                         %选子图
hold on                                %保持图像
plot(m1,[alpha*R1;alpha*R2],'.')       %再画加速度曲线
subplot(2,1,2)                         %选子图
hold on                                %保持图像
plot(m1,[T1;T2],'.')                   %再画张力曲线

alpha=[];                              %角加速度向量清空
T1=[];                                 %张力T1向量清空
T2=[];                                 %张力T2向量清空
for i=1:length(m1)                     %按质量m1循环
    A=[m1(i)*R1,1,0;m2*R2,0,-1;J,-R1,R2];%系数矩阵
    b=[m1(i)*g;-m2*g;0];               %常数向量
    x=A\b;                             %方程的解
    alpha=[alpha,x(1)];                %连接角加速度
    T1=[T1,x(2)];                      %连接张力T1
    T2=[T2,x(3)];                      %连接张力T2
end                                    %结束循环
subplot(2,1,1)                         %选子图
plot(m1,[alpha*R1;alpha*R2],'o')       %再画加速度曲线
subplot(2,1,2)                         %选子图
plot(m1,[T1;T2],'o')                   %再画张力曲线

