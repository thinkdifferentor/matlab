% 函数说明：穷举所有省份中坐飞机任意游览三个所需的总时间

function Solution6

clear;clc;

% 城市个数参数
City_num=31; 

% 载入省会之间的飞机费用
load Fly;

% 载入省内停留时间
load During;


% 出发省份编号
Start=27;
 
% 时间记录
Total_time=zeros(City_num,(City_num-1));
Total_day=zeros(City_num,(City_num-1));

% 第一个城市
for i=1:City_num
    
    %遇到出发城市
    if(i==Start)
        continue;
    end
    
    %第二个城市
    for j=2:City_num
        
        %遇到出发城市
        if(j==Start)
            continue;
        end
    
        % 计算一次游览的时间
        Total_time(i,j)=During(i)+During(j);

        % 将时间换算成天数
        Total_day(i,j)=(Total_time(i,j)/60-24)/12+1;
        
        % 时间输出
        fprintf('从出发省份到省份%d,再到省份%d回来所需的时间为:%f天\n',i,j,Total_day(i,j));
        
    end
end

end



