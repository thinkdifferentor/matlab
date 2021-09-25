%给用户推荐物品
function films = recommend( id )
    %获取前五名相似度矩阵
    %sim_value_userId中sim_v为评分值,sim_i用户ID
    sim_value_userId = similarity(id);
    base = importdata('Single.mat');%评分数据三列
    
    %读取电影数据（序号，影片名）
%     items = importdata('Mname.txt');%没有头文件并且全是数字用load，有头文件并且数据类型统一用importdata
    
%     items =
%     importdata('u.item','|',0);%没有头文件并且全是数字用load，有头文件并且数据类型统一用importdata
    
%     %先定义好推荐电影的空集
%     films = {};
%     %前5名相似度遍历电影
%     for n=1:5
%         %获取最相似用户的评分矩阵
%         first_base = base(base(:,1)==sim_value_userId(n,2),:);
%         %获取此用户评价为5分的最高的电影评分矩阵
%         first_base_top = first_base(find(first_base(:,3)>=0.1),:);
%         %获取电影名
%         films_items = items{first_base_top(:,2)};
%         %追加电影名到先前定义好的空集中
%         films{n} = films_items;
%     end
    
    %先定义好推荐电影的空集
    films = [];
    %前5名相似度遍历电影
    for n=1:5
        %获取最相似用户的评分矩阵
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %获取此用户评价为5分的最高的电影评分矩阵
        first_base_top = first_base(find(first_base(:,3)==5),:);
        %获取电影名
        films = first_base_top(:,2);
        %追加电影名到先前定义好的空集中
    
%         films = [films;films_items];
    end
    
    
    %去重，防止5个最相似用户推荐的电影有重复
    films = unique(films);
end

