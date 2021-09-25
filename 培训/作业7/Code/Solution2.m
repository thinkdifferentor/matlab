% 函数说明：求解浏览输入的几个省份所需的总时间

function Solution2

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


% 输入出发省份编号
Start=input('输入出发省份编号:');

% 输入第1个省份编号
First=input('输入第1个游览省份编号:');

% 输入第2个省份编号
Second=input('输入第2个游览省份编号:');


% 计算一次游览的时间
Total_time=Dis_time(Start,First)+Dis_time(First,Second)+Dis_time(Second,Start)+During(First)+During(Second);

% 将时间换算成天数
Total_day=(Total_time/60-24)/12+1;
 

% 时间输出
fprintf('游遍输入省份所需的时间为:%f\n',Total_day);


end



