%ŷʽ���뺯��
function [ ecludSimilarity ] = ecludSim( vectorA, vectorB )
    ecludSimilarity = 1./(1 + norm(vectorA - vectorB));
end
