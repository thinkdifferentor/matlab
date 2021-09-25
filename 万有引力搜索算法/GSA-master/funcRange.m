% This function gives boundaries and dimension of search space for test functions.
% 该函数给出了测试函数的搜索空间的边界和维数。

function varargout = funcRange(funcIndex)

% Default dimension
% 默认空间维数 30
dim = 30;

switch funcIndex
    case 1  
        low = -100;     up = 100;
    case 2
        low = -10;      up = 10;
    case 3
        low = -100;     up = 100;
    case 4
        low = -100;     up = 100;
    case 5
        low = -30;      up = 30;
    case 6
        low = -100;     up = 100;
    case 7
        low = -1.28;    up = 1.28;
    case 8
        low = -500;     up = 500;
    case 9
        low = -5.12;    up = 5.12;
    case 10
        low = -32;      up = 32;
    case 11
        low = -600;     up = 600;
    case 12 
        low = -50;      up = 50;
    case 13
        low = -50;      up = 50;
    case 14
        low = -65.536;  up = 65.536;    dim = 2;
    case 15
        low = -5;       up = 5;         dim = 4;
    case 16
        low = -5;       up = 5;         dim = 2;
    case 17
        low = [-5 0];   up = [10 15];   dim = 2;
    case 18
        low = -2;       up = 2;         dim = 2;
    case 19
        low = 0;        up = 1;         dim = 3;
    case 20
        low = 0;        up = 1;         dim = 6;
    case 21
        low = 0;        up = 10;        dim = 4;
    case 22
        low = 0;        up = 10;        dim = 4;
    case 23
        low = 0;        up = 10;        dim = 4;
end

if nargout
    varargout{1} = low;
    varargout{2} = up;
    varargout{3} = dim;
end

end