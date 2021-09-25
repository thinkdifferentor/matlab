%斜坡抛体运动研究
clear                                  %清除变量
a1=-45;                                %最小坡度
alpha=a1:15:45;                        %斜坡仰角的度数
a=alpha*pi/180;                        %化为弧度数
n=length(a);                           %坡度的个数
theta=a1:5:90;                         %物体射角的度数
th=theta*pi/180;                       %物体射角的弧度数
[A,TH]=meshgrid(a,th);                 %仰角和射角矩阵
S=2*sin(TH-A).*cos(TH)./cos(A).^2;     %射程矩阵(以水平最大射程为单位)
S(S<0)=nan;                            %小于零的射程没有意义(化为非数)
figure                                 %创建图形窗口
%plot(theta,S,'LineWidth',2)            %画射程曲线族
plot(theta,S(:,1),'o-',theta,S(:,2),'d-',theta,S(:,3),'s-',...
    theta,S(:,4),'p-',theta,S(:,5),'h-',theta,S(:,6),'<-',...
    theta,S(:,7),'>-')                 %画射程运动曲线族
grid on                                %加网格
h=legend([repmat('坡度:',n,1),num2str(alpha'),repmat('\circ',n,1)]);%插入坡度图例
fs=16;                                 %字体大小
set(h,'FontSize',fs-2)                 %放大图例
thm=45+alpha/2;                        %最大射程的射角
sm=1./(1+sin(a));                      %最大射程
text(thm,sm,num2str(sm',3),'FontSize',fs)%标记最大射程(保留3位)
th0=a1*ones(1,n);                      %最大射程水平线的起点横坐标
hold on                                %保持图像
plot([th0;thm],[sm;sm],'--')           %画最大射程的水平虚线
stem(thm,sm,'--','filled')             %画直杆虚线作为最大射程的竖直线
alpha=a1-1:90;                         %斜坡仰角的度数向量
thm=45+alpha/2;                        %最大射程的射角
a=alpha*pi/180;                        %化为弧度数
sm=1./(1+sin(a));                      %最大射程
plot(thm,sm,'r-.','LineWidth',3)       %画最大射程曲线
title('斜抛物体在斜坡上的射程','FontSize',fs)%标题
xlabel('射角\it\theta\rm/\circ','FontSize',fs)%横坐标标签
ylabel('射程\itS/X\rm_M','FontSize',fs)%纵坐标标签
sm=floor(max(S(:)));                   %最大射程取整数
text(a1,sm,'\itX\rm_M=\itv\rm_0^2/\itg','FontSize',fs)%说明最大水平射程

