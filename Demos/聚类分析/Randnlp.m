%蒙特卡罗法解非线性规划问题
%在估计的区域内随机选取若干个试验点，然后从实验点中找出可行点，再从可行点中选取最小点

% 随机模拟解非线性规划问题
function [sol r1 r2]=Randnlp(down,up,point)
    debug=1;
    
    %设置模拟区域上下边界
    down=0;
    up=10;
    
    %设置模拟点数
    point=1000;
    
    %n*1阶的[down,up]均匀分布的随机数矩阵
    r1=unifrnd(down,up, point,1);
    r2=unifrnd(down,up, point,1);
    
    %初始解
    sol=[r1(1) r2(1)];
    
    z0=inf;
    
    for i=1;point
        x1=r1(i);
        x2=r2(i);
        lpc=lpconst([x1 x2]);
        
        if(lpc==1)
            z=mylp([x1 x2]);
            if(z<z0)
                z0=z;
                sol=[x1 x2];
            end
        end
    end
end

% 目标函数
function z=mylp(x)
    %求最大值-转化为最小值问题求解
    z=2*x(1)^2+x(2)^2-x(1)*x(2)-8*x(1)-3*x(2);
end


%约束条件
function lpc=lpconst(x)
    if(3*x(1)+x(2)-10<=0.5&&3*x(1)+x(2)-10>=-0.5)
       lpc=1; 
    else
       lpc=-1;
    end
end


