% 函数说明：获取省内路途行车费用

function Solution3
    %省份的数目
    Capital_num=31;
    
    %数据载入
    load Road_time;
    
    %花费数组
    Cost=zeros(Capital_num,1);
    
    %花费计算
    for i=1:Capital_num
        Cost(i,1)=(Road_time(i,1)/60);
    end
    
    Cost
end


