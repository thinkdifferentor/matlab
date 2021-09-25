function err = RMSE(x, y) 
% function to estimate root mean square error
%   err = RMSE(x, y)
%   - Input: x, y are two vector of same size
%   - output: RMSE error 

err = sqrt( mean( (x(:) - y(:)).^2 ) ) ;