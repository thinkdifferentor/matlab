function [ score ] = SVDEvaluate( data, user, simMeas, item ) 
    [m,n] = size(data); 
    simTotal = 0; 
    ratSimTotal = 0; 
    % 奇异值分解 
    [U S V] = svd(data); 
    % 求使得保留90%能量的奇异值 
    sizeN = 0;
    %记录维数 
    [m_1,n_1] = size(S); 
    a = 0;
    %求总能量 
    for i = 1:m_1 
        a = a + S(i,i)*S(i,i); 
    end
    b = a*0.9;%能量的90% 

    c = 0; 
    for i = 1:n_1 
        c = c + S(i,i)*S(i,i); 
        if c >= b 
            sizeN = i; 
            break;
        end
    end
    %物品降维后的空间 
    itemTransformed = data' * U(:,1:sizeN) * S(1:sizeN,1:sizeN)^(-1); 

    for j = 1:n 
        userRating =data(user, j);
        %此用户评价的商品 
        if userRating == 0 || j == item%只是找到已评分的商品 
            continue; 
        end
        vectorA = itemTransformed(item,:); 
        vectorB = itemTransformed(j,:); 
        switch simMeas 
            case {'cosSim'} 
                similarity =cosSim(vectorA,vectorB); 
            case {'ecludSim'} 
                similarity = ecludSim(vectorA,vectorB); 
            case {'pearsSim'} 
                similarity = pearsSim(vectorA,vectorB); 
        end

        disp(['the ', num2str(item), ' and ', num2str(j), ' similarity is ', num2str(similarity)]);    
        simTotal = simTotal + similarity; ratSimTotal = ratSimTotal + similarity * userRating; 
    end

    if simTotal == 0 
        score = 0; 
    else
        score = ratSimTotal./simTotal; 
    end

end










