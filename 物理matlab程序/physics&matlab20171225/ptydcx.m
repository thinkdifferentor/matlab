%%抛体运动研究
v0=input('请输入初速度的大小v0(m/s):');   %初速度v0
maxXmax=0;  g=9.80;                      %maxXmax最大射程
disp('初速方向角(度)  射程(m)  高度(m) 飞行时间(s)');
for vDir=5:5:90                           %初速方向角
    tmax=2*v0*sin(vDir*(pi/180))/g;        %空中飞行时间
    Xmax=v0^2*sin(2*vDir*(pi/180))/g;       %射程Xmax
    Ymax=v0^2*sin(vDir*(pi/180))^2/(2*g);   %高度
    t=0:0.05:tmax;
    x=v0*cos(vDir*(pi/180)).*t;          %t时刻x的坐标
    y=v0*sin(vDir*(pi/180)).*t-g.*t.*t/2;  %t时刻y的坐标
    plot(x,y);hold on;                    %作图
    xxx=[vDir,Xmax,Ymax,tmax];disp(xxx);
    if maxXmax<Xmax                       %找出射程最远的角度
        maxvDir=vDir;maxXmax=Xmax;maxYmax=Ymax;maxtmax=tmax;
        continue;
    end
end
disp('获得最大射程的参数:');      %显示射程最远的角度参数
disp('初速方向角(度)  射程(m)   高度(m)  飞行时间(s)');
maxxxx=[maxvDir,maxXmax,maxYmax,maxtmax];
disp(maxxxx);