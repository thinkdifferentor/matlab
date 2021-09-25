%对心弹性碰撞的速度曲面
clear                                  %清除变量
m21=0:0.2:3;                           %质量比向量
v21=-4:0.2:4;                          %速度比向量
[V0,M]=meshgrid(v21,m21);              %速度比和质量比矩阵
s1='m1*v10+m2*v20-m1*v1-m2*v2';        %动量守恒字符串
s2='m1*v10^2+m2*v20^2-m1*v1^2-m2*v2^2';%机械能守恒字符串
[v1,v2]=solve(s1,s2,'v1','v2')         %对心弹性碰撞的速度的符号解
V{1}=2*(1+M.*V0)./(1+M)-1;             %第一物体碰撞后的速度
V{2}=2*(1+M.*V0)./(1+M)-V0;            %第二物体碰撞后的速度
fs=16;                                 %字体大小
for i=1:2                              %循环2轮
    figure                             %创建图形窗口
    surf(v21,m21,V{i})                 %画曲面
    box on                             %加框架
    hold on                            %保持图像
    contour(v21,m21,V{i},[0,0],'r','LineWidth',2)%画速度为零的等值线
    xlabel('\itv\rm_2_0/\itv\rm_1_0','FontSize',fs)%碰撞前速度标签
    ylabel('\itm\rm_2/\itm\rm_1','FontSize',fs)%质量标签
    zlabel(['\itv\rm_',num2str(i),'/\itv\rm_1_0'],'FontSize',fs) %碰撞后速度标签
    title(['\itm\rm_',num2str(i),'对心弹性碰撞后的速度'],'FontSize',fs)%标题
    pause                              %暂停
    view(2)                            %设置俯视角
    title(['\itm\rm_',num2str(i),'对心弹性碰撞后速度的俯视图'],'FontSize',fs)%更换标题
end                                    %结束循环

