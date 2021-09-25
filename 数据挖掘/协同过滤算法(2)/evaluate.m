% 计算相似度的函数
function [ score ] = evaluate( data, user, simMeas, item ) 
    [m,n] = size(data); 
    simTotal = 0; 
    ratSimTotal = 0; 
    % 寻找用户都评价的商品 
    % data(user, item)为未评价的商品 
    for j = 1:n 
        userRating = data(user, j);%此用户评价的商品 
        ratedItem =zeros(m,1); 
        numOfNon = 0;%统计已评价商品的数目 
        if userRating == 0%只是找到已评分的商品 
            continue; 
        end
        for i = 1:m 
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
                case {'cosSim'} 
                    similarity = cosSim(vectorA,vectorB); 
                case {'ecludSim'} 
                    similarity =ecludSim(vectorA,vectorB); 
                case {'pearsSim'} 
                    similarity = pearsSim(vectorA,vectorB); 
            end
        end

        disp(['the ', num2str(item), 'and ', num2str(j), ' similarity is', num2str(similarity)]); 
        simTotal = simTotal + similarity; ratSimTotal = ratSimTotal +similarity * userRating; 
    end

    if simTotal == 0 
        score = 0; 
    else
        score = ratSimTotal./simTotal;
    end

end