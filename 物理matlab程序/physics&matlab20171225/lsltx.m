%李萨如图形不同相差的动画
clear                                  %清除变量
T1=input('请输入x方向周期:');          %键盘输入x方向的周期
T2=input('请输入y方向周期:');          %键盘输入y方向的周期
w1=2*pi/T1;                            %x方向的圆频率
w2=2*pi/T2;                            %y方向的圆频率
tm=T1*T2;                              %最大时间
dt=0.005;                              %时间增量
t=-tm:dt:tm;                           %时间向量
m=4;                                   %分母
T=T2;                                  %取y的周期
while T/2==floor(T/2)                  %周期为偶数时循环
    T=T/2;                             %周期除以2
    m=m*2;                             %分母乘以2
end                                    %结束循环
figure                                 %创建图形窗口
for i=0:8                              %按子窗口循环
    subplot(3,3,i+1)                   %取子窗口
    pause                              %暂停
    f=pi*i/m;                          %相差
    x=cos(w1*t);                       %计算横坐标向量
    y=cos(w2*t+f);                     %计算纵坐标向量
    comet(x,y)                         %画慧星线
    plot(x,y,'LineWidth',2)            %画轨迹
    hold on                            %保持图像
    plot(x(1),y(1),'ro')               %画起点
    grid on                            %加网格
    if i==0                            %对于第一图
        ylabel(['\itT\rm_1:\itT\rm_2=',num2str(T1),...
            ':',num2str(T2)],'FontSize',12)%标记周期
         tit='\Delta\it\phi\rm=\it\phi\rm_2-\it\phi\rm_1=0';%标题
    elseif i==1                        %否则如果
        tit=['\pi/',num2str(m)];       %标题
    else                               %否则
        tit=[num2str(i),'\pi/',num2str(m)];%标题
    end                                %结束条件
    title(tit,'FontSize',12)           %标题
end                                    %结束循环

