%斜面上物体静止所需要的水平力
clear                                  %清除变量
mu=0:0.2:0.6;                          %摩擦系数向量
theta=0:2:90;                          %角度向量(度数)
th=theta*pi/180;                       %角度向量(弧度数)
fs=16;                                 %字体大小
%figure                                 %创建图形窗口
for i=1:length(mu)                     %按摩擦系数循环
    a=atan(mu(i));                     %求摩擦角
    f1=tan(th-a);                      %求力的下限
    f2=tan(th+a);                      %求力的上限
    figure                                 %创建图形窗口
%    subplot(2,2,i)                     %选子图
    plot(theta,f1,theta,f2,'--','LineWidth',2)%画力的上限和下限曲线
    grid on                            %加网格
    axis([0,90,-1,10])                 %限定曲线范围
    title('使斜面上物体静止的水平力范围','FontSize',fs)%加标题
    xlabel('\it\theta\rm/\circ','FontSize',fs)%加横坐标标签
    ylabel('\itF/mg','FontSize',fs)    %加纵坐标标签
    legend('下限','上限',2)            %图例
    alpha=a*180/pi;                    %摩擦角
    thetaC=90-alpha;                   %临界解
    hold on                            %保持图像
    plot(alpha,0,'*',thetaC,0,'o')     %画摩擦角和临界角
    txt=['\it\mu\rm=',num2str(mu(i))]; %摩擦系数文本
    txt=[txt,',\it\alpha\rm=',num2str(alpha,3),'\circ'];%摩擦角文本
    txt=[txt,',\it\theta\rm_C=',num2str(90-alpha,3),'\circ'];%临界角文本
    text(0,5,txt,'FontSize',fs)        %标记文本
    f=tan(2*a);                        %
    stem(alpha,f,'--')
    text(alpha,f,num2str(f,2),'FontSize',fs)%
end                                    %结束循环

