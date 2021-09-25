% 计算相似度的函数
function [ score ] = evaluate( data, user, simMeas, item ) 
    %参数说明:data评分矩阵, user用户, simMeas相似函数, item物品
    [m,n] = size(data); %m为用户，n为商品 
    simTotal = 0;
    ratSimTotal = 0; 
    
    % 寻找用户都评价的商品 
    % data(user, item)为未评价的商品 
    for j = 1:n %对每个商品
        %此用户评价的商品
        userRating = data(user, j);
        ratedItem =zeros(m,1); 
        %统计已评价商品的数目 
        numOfNon = 0;
        
        %只是找到已评分的商品
        if userRating == 0 
            continue; 
        end
        
        for i = 1:m %对每个用户
            if data(i,item) ~= 0 && data(i,j) ~= 0 
                ratedItem(i,1) = 1; 
                numOfNon = numOfNon + 1; 
            end
        end
        
        % 判断有没有都评分的项 
        if numOfNon == 0 
            similarity = 0; 
        else % 构造向量，便于计算相似性 
            vectorA = zeros(1,numOfNon); 
            vectorB =zeros(1,numOfNon); 
            r = 0; 
            for i = 1:m 
                if ratedItem(i,1) == 1 
                    r = r+1; 
                    vectorA(1,r) = data(i, j); 
                    vectorB(1,r) = data(i, item);
                end
            end

            switch simMeas 
                case {'cosSim'} %余弦相似函数
                    similarity = cosSim(vectorA,vectorB); 
                case {'ecludSim'} %欧氏相似函数
                    similarity =ecludSim(vectorA,vectorB); 
                case {'pearsSim'} %皮尔逊相似函数
                    similarity = pearsSim(vectorA,vectorB); 
            end
        end
        
        %物品间相似度输出
        %disp(['the ', num2str(item), 'and ', num2str(j), ' similarity is ', num2str(similarity)]); 
        simTotal = simTotal + similarity; 
        ratSimTotal = ratSimTotal +similarity * userRating; 
    end

    if simTotal == 0 
        score = 0; 
    else
        score = ratSimTotal./simTotal;
    end
end