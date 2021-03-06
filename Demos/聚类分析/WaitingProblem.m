clc;
clear;
% 模拟只有一个服务窗口的排队问题

% 从第二位顾客开始模拟
i=2;
w=0;
e(i-1)=0;

% 指数分布函数-模拟顾客到来的时间
x(i)=exprnd(10);

% 顾客到来的时刻
c(i)=x(i);

%为顾客服务开始的时刻
b(i)=x(i);

% 开始模拟一天的服务工作 8*60分钟
while b(i)<=480
    
    %产生均匀分布随机数-模拟为顾客服务的时间
    y(i)=unifrnd(4,15);
    
    %顾客服务结束的时刻
    e(i)=b(i)+y(i);
    
    %累计等待的时间
    w=w+b(i)-c(i);
    
    %开始下一轮的模拟
    i=i+1;
    
    %生成顾客到来随机数
    x(i)=exprnd(10);
    
    %新的顾客到来时刻
    c(i)=c(i-1)+x(i);
    
    %确定新的开始服务时刻
    b(i)=max(c(i),e(i-1));
    
end

i=i-2;

% 平均每位顾客等待的时间
t=w/i;

% 输出一天服务的顾客数
m=i;

t
m


