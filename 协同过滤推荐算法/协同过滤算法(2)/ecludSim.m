%Å·Ê½¾àÀëº¯Êý
function [ ecludSimilarity ] = ecludSim( vectorA, vectorB )
    ecludSimilarity = 1./(1 + norm(vectorA - vectorB));
end
