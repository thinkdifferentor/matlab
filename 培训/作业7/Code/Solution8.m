% 函数说明：穷举所有省份中坐飞机任意游览三个所需的飞机费用和省内开车费用

function Solution8

clear;clc;

% 城市个数参数
City_num=31; 

% 载入省会之间的飞机费用
load Fly;

% 载入省内停留时间
load During;

% 载入省内驾车的花费
load Cost_capital 


% 载入省内住宿费和租车费



% 出发省份编号
Start=27;
 
% 时间记录
Total_time=zeros(City_num,(City_num-1));
Total_day=zeros(City_num,(City_num-1));

% 花费记录
Total_cost=zeros(City_num,(City_num-1));

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
        
        %一次旅行的总花费

        T1=Fly(Start,i)+Fly(i,j)+Fly(j,Start);
        T2=Cost(i)+Cost(j);
        Total_cost(i,j)=T1+T2;
        
        if(Total_day(i,j)<15&&Total_day(i,j)>14)
            % 时间输出
            fprintf('从出发省份到省份%d,再到省份%d回来所需的时间为:%f天\t该次旅行总花费为:%f\n',i,j,Total_day(i,j),Total_cost(i,j));
        end
        
    end
end

end



