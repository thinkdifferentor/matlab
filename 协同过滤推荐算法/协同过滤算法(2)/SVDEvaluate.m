function [ score ] = SVDEvaluate( data, user, simMeas, item ) 
    [m,n] = size(data); 
    simTotal = 0; 
    ratSimTotal = 0; 
    % ����ֵ�ֽ� 
    [U S V] = svd(data); 
    % ��ʹ�ñ���90%����������ֵ 
    sizeN = 0;
    %��¼ά�� 
    [m_1,n_1] = size(S); 
    a = 0;
    %�������� 
    for i = 1:m_1 
        a = a + S(i,i)*S(i,i); 
    end
    b = a*0.9;%������90% 

    c = 0; 
    for i = 1:n_1 
        c = c + S(i,i)*S(i,i); 
        if c >= b 
            sizeN = i; 
            break;
        end
    end
    %��Ʒ��ά��Ŀռ� 
    itemTransformed = data' * U(:,1:sizeN) * S(1:sizeN,1:sizeN)^(-1); 

    for j = 1:n 
        userRating =data(user, j);
        %���û����۵���Ʒ 
        if userRating == 0 || j == item%ֻ���ҵ������ֵ���Ʒ 
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










