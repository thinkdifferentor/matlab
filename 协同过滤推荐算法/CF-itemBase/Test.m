%test
clc,clear;

index=[1 2 3 4 5];

%读取电影数据（序号，电影名，上映时间，网址）
    items = importdata('u.item','|',0);
    
    %获取影片数目
    item_Num=length(items.textdata);
    
    %获取推荐序列长度
    n=length(index);
    
    %定义影片推荐矩阵
    films=[];
    
    %开始查找
    for i=1:n
        for j=1:item_Num
            if(index(i)==j)
                %获取电影名
                films_items = items.textdata(j,2);
                %追加电影名到先前定义好的空集中
                films = [films;films_items];
            end
        end
    end
    name=films;