% 函数说明：穷举所有省份中任意自驾游览三个所需的总时间

function Solution5

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
        T1=Dis_time(Start,i)+Dis_time(i,j)+Dis_time(j,Start);
        T2=During(i)+During(j);
        
        Total_time(i,j)=T1+T2;

        % 将时间换算成天数
        Total_day(i,j)=(Total_time(i,j)/60-24)/12+1;
        
        % 时间输出
        fprintf('从出发省份到省份%d,再到省份%d回来所需的时间为:%f天\n',i,j,Total_day(i,j));
        
    end
end

end



