% 函数说明：搜索浏览输入的几个省份所需的总时间

function Solution4

clear;clc;

% 城市个数参数
City_num=31; 

% 载入省会间的距离
load Dis;
Dis=dis;

% 获取距离对称矩阵
Dis=Dis+Dis';

Dis_time=zeros(City_num);

% 计算路途时间
for i=1:City_num
    for j=1:City_num
        Dis_time(i,j)=(Dis(i,j)/90)*60;
    end
end


% 载入省内停留时间
load During;


% 出发省份编号
Start=;

% 输入中间省份个数
First_num=;

% 输入中间省份编号数组
First_array=[];

% 输入第二个省份编号
Second=;


% 时间记录
Total_time=zeros(First_num,1);
Total_day=zeros(First_num,1);

for i=1:First_num
    
    % 计算一次游览的时间
    T1=Dis_time(Start,i)+Dis_time(i,Second)+Dis_time(Second,Start);
    T2=During(i)+During(Second);
    Total_time(i,1)=T1+T2;
    
    % 将时间换算成天数
    Total_day(i,1)=(Total_time(i,1)/60-24)/12+1;
    
end


for i=1:First_num
    
    % 时间输出
    fprintf('游遍输入省份所需的时间为:%f\n',Total_day(i,1));
    
end

end



