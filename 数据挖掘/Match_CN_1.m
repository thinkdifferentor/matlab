%频道名与频道号之间的匹配
clear,clc;

%频道名与频道号数据载入
load('Channel_Num_Test');
load('Channel_Name_Test');

Channel(1).num=1;
Channel(1).name='中央1台-高清';

%不重复结构数组构建
cnt=2;%结构数组记录计数
for i=2:length(Channel_Num_Test)
    
    %添加频道是否存在标识
    flag=1;
    %存在已有的记录不在添加到结构数组
    for j=1:length(Channel)
        if(Channel_Num_Test(i)==Channel(j).num)
            flag=0;
            break;
        end
    end
    
    %如果现有结构数组里没有重复频道
    if(flag==1)
        Channel(cnt).num=Channel_Num_Test(i);
        Channel(cnt).name=Channel_Name_Test{i};
        cnt=cnt+1;
    end
    
end

%数据保存
save('Channel.mat','Channel');


