%电子双缝干涉图样演示程序，运行本程序将显示大量电子通过双缝和干涉图样
%按空格键开始演示不同数量电子通过双缝的情形，可以清楚的看到但少量电子时
%表现为电子是随机分布，大量的电子则呈现干涉图样体现其波动性，按ESC键结束。
clear                                  %清除变量
k=0.5;                                 %常数
xm=5*pi;                               %宽度最大值
n=20000;                               %随机数个数
rand('state',0)                        %随机种子清零
x=2*xm*(rand(1,n)-0.5);                %随机产生横坐标
y=rand(1,n);                           %电子随机纵坐标
i=cos(k*x).^2;                         %根据横坐标计算电子出现的概率
r=rand(1,n);                           %均匀分布的随机数
l=r<=i;                                %随机数在概率之内时为逻辑真
figure                                 %创建图形窗口
plot(x(l),y(l),'.')                    %画点
title('大量电子通过双缝的干涉图样','FontSize',16)%标题
text(-xm,0.5,num2str(sum(l)),'FontSize',16)%显示电子数
axis([-xm,xm,0,1])                     %曲线范围
axis off                               %隐去坐标
pause                                  %暂停
figure                                 %创建图形窗口
axis([-xm,xm,0,1])                     %曲线范围
axis off                               %隐去坐标
title('电子逐个通过双缝的干涉图样','FontSize',16)%标题
n=0;                                   %计数器清零
h=text(-xm,0.5,'','FontSize',16);      %文本句柄
a=[10,100,1000];                       %暂停所用的电子数向量
hold on                                %保持图像
while 1                                %无限循环
    x=2*xm*(rand-0.5);                 %电子的随机横坐标
    i=cos(k*x)^2;                      %电子的出现的概率
    r=rand;                            %均匀分布的随机数
    if r<=i                            %如果随机数在概率之内
        y=rand;                        %电子随机纵坐标
        plot(x,y,'.')                  %则画点
        n=n+1;                         %计数
        set(h,'string',num2str(n))     %设置数据
        drawnow                        %刷新屏幕
        if any(n==a) pause,end         %判断暂停
    end                                %结束条件
    if get(gcf,'CurrentCharacter')==char(27) break,end%按ESC键则中断循环
end                                    %结束循环

