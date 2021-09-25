%均匀链条从光滑桌面上滑下来的运动规律曲线(求微分方程的数值解和符号解)
clear                                  %清除变量
b=0.1:0.1:0.7;                         %b与l的比值向量
t=0:0.1:4;                             %时间向量
options=odeset('Events','on');         %开启事件判断功能
f1=figure;                             %创建图形窗口
hold on                                %保持图像
f2=figure;                             %创建图形窗口
hold on                                %保持图像
c='bgrcymk';                           %颜色字符串
m='odsph^v';                           %符号字符串
tm=[];                                 %滑下的时间向量置空
vm=[];                                 %滑下的速度向量置空
n=length(b);                           %比值个数  
for i=1:n                              %按比值循环
    [tt,Y]=ode45('ltflfun',t,[b(i),0],options);%解微分方程计算长度和速度
%    [tt,Y,event]=ode45('P2_11_fun',t,y0,options);%解微分方程计算长度和速度
    tm=[tm,tt(end)];                   %连接时间向量
    vm=[vm,max(Y(:,2))];               %连接速度向量
    figure(f1)                         %重开图形窗口
    plot(tt,Y(:,1),[c(i),m(i),'-'])    %画长度曲线
    figure(f2)                         %重开图形窗口
    plot(tt,Y(:,2),[c(i),m(i),'-'])    %画速度曲线
end                                    %结束循环
figure(f1)                             %重开图形窗口
grid on                                %加网格
axis([0,inf,0,1])                      %坐标范围
fs=16;                                 %字体大小
xlabel('\itt/t\rm_0','FontSize',fs)    %时间比标签
ylabel('\ity/l','FontSize',fs)         %长度比标签
title('均匀链条从桌面上无摩擦滑下的长度','FontSize',fs)%加标题
legend([repmat('\itb/l\rm=',n,1),num2str(b')],4)%加图例
text(1.5,0.1,'\itt\rm_0=(\itl/g\rm)^{1/2}','FontSize',fs)%加时间单位文本
text(tm,ones(size(tm)),num2str(tm',2),'FontSize',fs)%标记时间
stem(tm,ones(size(tm)),'--')           %画杆图
figure(f2)                             %重开图形窗口
grid on                                %加网格
axis([0,inf,0,1])                      %坐标范围
xlabel('\itt/t\rm_0','FontSize',fs)    %时间比标签
ylabel('\itv/v\rm_0','FontSize',fs)    %速度比标签
title('均匀链条从桌面上无摩擦滑下的速度','FontSize',fs)%加标题
legend([repmat('\itb/l\rm=',n,1),num2str(b')],4)%加图例
text(1.5,0.1,'\itv\rm_0=(\itgl\rm)^{1/2}','FontSize',fs)%加速度单位文本
text(tm,vm,num2str(vm',3),'FontSize',fs)%标记最终速度
plot([zeros(size(tm));tm],[vm;vm],'--')%画水平线

y=dsolve('D2y-y','y(0)=b','Dy(0)=0')   %微分方程的符号解
v=diff(y);                             %求速度
[B,T]=meshgrid(b,t);                   %化为矩阵
Y=subs(y,{'b','t'},{B,T});             %求高度的数值
T(Y>1)=nan;                            %将链条落完后的时间改为非数
Y(Y>1)=nan;                            %将链条落完后的长度改为非数
V=subs(v,{'b','t'},{B,T});             %求速度的数值
figure(f1)                             %重开图形窗口
plot(T,Y,'.')                          %画曲线族
figure(f2)                             %重开图形窗口
plot(T,V,'.')                          %画曲线族
b=0.1:0.01:1;                          %b与l的比值向量
f=finverse(y);                         %求反函数,t表示高度
s=subs(f,'t',1);                       %替换(相对)长度
tm=subs(s,'b',b);                      %替换数值求全部滑下的时间
vm=subs(v,{'b','t'},{b,tm});           %替换数值求全部滑下的速度
plot(tm,vm,'--','LineWidth',2)         %画全部滑下的速度和时间曲线

