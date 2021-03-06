function films = recommend( id )
    %获取前五名相似度矩阵
    sim_value_userId = similarity(id);
    base = load('u1.base');
    %读取电影数据（序号，电影名，上映时间，网址）
    items = importdata('u.item','|',0);%没有头文件并且全是数字用load，有头文件并且数据类型统一用importdata
    %先定义好推荐电影的空集
    films = [];
    %前5名相似度遍历电影
    for n=1:5
        %获取最相似用户的评分矩阵
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %获取此用户评价为5分的最高的电影评分矩阵
        first_base_top = first_base(find(first_base(:,3)==5),:);
        %获取电影名
        films_items = items.textdata(first_base_top(:,2),2);
        %追加电影名到先前定义好的空集中
        films = [films;films_items];
    end
    %去重，防止5个最相似用户推荐的电影有重复
    films = unique(films);
end

