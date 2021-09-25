% 函数说明：获取省会间坐飞机费用

function Solution7
    %省份的数目
    Capital_num=31;
    
    %数据载入
    load Fly;
    
    %花费数组
    Cost_fly=zeros(Capital_num,1);
    
    %花费计算
    for i=1:Capital_num
        Cost_fly(i,1)=(Road_time(i,1)/60);
    end
    
    Cost
end


