m=1;%m为小球的质量
b=[0,0.2,0.2];%%设置参数
p=[0,0,1];  
px=[4.6;4.5;4.5];  %%px,py是文籽说明的坐标
py=[3.5;1.8;0.4];
strdd{1}='无阻尼';      %%三组说明文字
strdd{2}='阻力正比于v';
strdd{3}='阻力正比于v^2';

figure
for i=1:3         %%重复解三遍微分方程
[t,y]=ode45('znxpydfun',[0:0.01:10],[0,3,0,5],[],b(i),p(i),m);
H{i}=max(y(:,3))           %%求轨迹的最高点
T{i}=t(find(y(:,3)==H{i}))   %%到最高点所需的时间
vx0{i}=y(end,2)             %%最终水平速度
subplot(2,1,1)              %%第一幅分区图
axis([0 6 -70 2]);          %%设置坐标轴的范围
hold on
xlabel('x')                 %%标注x,y轴           
ylabel('y')
comet(y(:,1),y(:,3));       %%画轨迹的慧星图
subplot(2,1,2)              %%第二幅公区图
axis([0 10 0 4])
hold on
xlabel('t')
ylabel('dx/dt')
text(px(i),py(i),strdd{i});     %%加注说明文字

comet(t,y(:,2))
end

