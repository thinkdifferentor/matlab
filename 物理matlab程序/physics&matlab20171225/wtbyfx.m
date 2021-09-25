%物体从半圆形物体上无摩擦滑下的速度
clear                                  %清除变量
theta=0:3:90;                          %角度向量
th=theta*pi/180;                       %化为弧度
m=0:2:8;                               %质量比向量
n=length(m);                           %质量比个数
[M,TH]=meshgrid(m,th);                 %质量和角度矩阵
Vx=sqrt((1-cos(TH))./(1+M)./(1+(1+M).*tan(TH).^2));%x方向速度
[vxm,i]=max(Vx);                       %最大速度和下标
THm=ones(size(th'))*th(i);             %最大速度的角度矩阵
mm=(3*cos(th)-2)./(cos(th).^3-3*cos(th)+2);%最大速度的质量比
vxmm=sqrt((1-cos(th))./(1+mm)./(1+(1+mm).*tan(th).^2));%x方向最大速度
vxmm(th>max(th(i)))=nan;               %质量比为负数没有意义
fs=16;                                 %字体大小
Vc={Vx,M.*Vx,(1+M).*tan(TH).*Vx};      %速度元胞
tc{1}='物体B从半圆A上无摩擦滑下的水平速度';%标题之一
tc{2}='半圆A的速度';                    %标题之二
tc{3}='物体B从半圆A上无摩擦滑下的竖直速度';%标题之三
vm={vxm,m.*vxm,(1+m).*tan(th(i)).*vxm};%每条曲线最大速度元胞
vmm={vxmm,mm.*vxmm,(1+mm).*tan(th).*vxmm};%最大速度元胞
yc={'v_x','V','v_y'};                  %y标签元胞
for j=1:3                              %循环3轮
    V=Vc{j};                           %取速度
    V(TH>THm)=nan;                     %大于最大角度的速度改为非数
    figure                             %创建图形窗口
%    plot(theta,V,'LineWidth',2)        %画曲线族
    plot(theta,V(:,1),'o-',theta,V(:,2),'d-',theta,V(:,3),'s-',...
        theta,V(:,4),'p-',theta,V(:,5),'h-')%画曲线族
    grid on                            %加网格
    title(tc{j},'FontSize',fs)         %标题
    xlabel('\it\theta\rm/\circ','FontSize',fs)%标记横坐标
    ylabel(['\it',yc{j},'/v\rm_0'],'FontSize',fs)%标记纵坐标
    legend([repmat('\itm/M\rm=',n,1),num2str(m')],2)%图例
    V=Vc{j};                           %取速度矩阵
    V(TH<THm)=nan;                     %小于最大角度的速度改为非数
    hold on                            %保持图像
    plot(theta,V,':','LineWidth',2)    %用虚线画曲线族
    stem(theta(i),vm{j},'--')          %画杆图
    if j<3                             %对于前2个图
        txt=[num2str(theta(i)'),repmat(',',n,1),num2str(vm{j}',3)];%最大速度及角度
        text(theta(i),vm{j},txt,'FontSize',fs)%标记最大速度和角度
    end                                %结束条件
    text(0,0.2,'\itv\rm_0=(2\itgR\rm)^{1/2}','FontSize',fs)%标记速度单位
    plot(theta,vmm{j},'-.','LineWidth',2)%画最大速度曲线
end                                    %结束循环
figure                                 %创建图形窗口
subplot(2,1,1)                         %选子图
plot(mm,vxmm,'LineWidth',2)            %画最大速度曲线
grid on                                %加网格
title('物体B最大水平速度与质量的关系','FontSize',fs)%标题
xlabel('\itm/M','FontSize',fs)         %标记横坐标
ylabel('\itv_x/v\rm_0','FontSize',fs)  %标记纵坐标
axis([0,200,0,0.4])                    %曲线范围
subplot(2,1,2)                         %选子图
plot(mm,theta,'LineWidth',2)           %画最大速度角度曲线
grid on                                %加网格
title('物体B最大水平速度的角度与质量的关系','FontSize',fs)%标题
xlabel('\itm/M','FontSize',fs)         %标记横坐标
ylabel('\it\theta\rm/\circ','FontSize',fs)%标记纵坐标
axis([0,200,0,50])                     %曲线范围

