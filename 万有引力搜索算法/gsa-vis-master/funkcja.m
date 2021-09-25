function [ Z ] = funkcja( X,Y )
    Z = X.*exp(-X.^2 - Y.^2);
end

