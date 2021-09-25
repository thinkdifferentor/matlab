%驻波形成的动画
clear                                  %清除变量
xm=2;                                  %波的个数(波的范围)
dx=0.01;                               %坐标增量(以波长为单位)
x=0:dx:xm;                             %坐标向量
u1=cos(2*pi*x);                        %右行波初位移
u2=u1;                                 %左行波初位移
%u2=u1*0.8;                             %低幅左行波
%u2=u1*1.2;                             %高幅左行波
u=u1+u2;                               %驻波
figure                                 %创建图形窗口
h=plot(x,u,'r','LineWidth',2);         %驻波句柄
%h=plot(x,u,'r','LineWidth',2,'erasemode','xor');%驻波句柄
axis([0,xm,-3,3])                      %曲线范围
grid on                                %加网格
fs=16;                                 %字体大小
xlabel('\itx/\lambda','FontSize',fs)   %x标签
ylabel('\itu/A','FontSize',fs)         %y标签   
title('驻波的形成','FontSize',fs)      %标题
%title('合成右行波','FontSize',fs)       %标题
%title('合成左行波','FontSize',fs)       %标题
hold on                                %保持图像
h1=plot(x,u1,'LineWidth',2);           %右行波句柄
h2=plot(x,u2,'k','LineWidth',2);       %左行波句柄
%h1=plot(x,u1,'LineWidth',2,'erasemode','xor');%右行波句柄
%h2=plot(x,u2,'k','LineWidth',2,'erasemode','xor');%左行波句柄
ht1=text(1,max(u1)+0.1,'\rightarrow','FontSize',fs);%显示向右的箭头
ht2=text(1,max(u2)+0.2,'\leftarrow','FontSize',fs);%显示向右的箭头
pause                                  %暂停
while 1                                %无限循环
%while get(gcf,'CurrentCharacter')~=char(27)%不按ESC键循环
    u1=[u1(end-1),u1(1:end-1)];        %倒数第二个元素移到第一个
    u2=[u2(2:end),u2(2)];              %第二个元素移到最后一个
    u=u1+u2;                           %合成波
    set(h1,'YData',u1)                 %设置左行波的位移
    set(h2,'YData',u2)                 %设置右行波的位移
    set(h,'YData',u)                   %设置合成波的位移
    [um,i]=max(u1);                    %求右行波的最大值和下标
    set(ht1,'Position',[x(i),um+0.1])  %设置右箭头的位置
    [um,i]=max(u2);                    %求左行波的最大值和下标
    set(ht2,'Position',[x(i),um+0.2])  %设置左箭头的位置
    drawnow                            %更新屏幕
    pause(0.1)                         %延时
    if get(gcf,'CurrentCharacter')==char(27) break;end%按ESC键则退出程序
end                                    %结束循环

