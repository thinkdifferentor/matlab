% This function gives boundaries and dimension of search space for test functions.
function [down,up,dim]=test_functions_range(F_index)

%If lower bounds of the dimensions are the same, then 'down' is a value.
%Otherwise, 'down' is a vector that shows the lower bound of each dimension.
%This is also true for upper bounds of the dimensions.

%Insert your own boundaries with a new F_index.
switch F_index;

    case 24 %max_ones
    down=0;up=1;dim=160;


    case 25 %Royal road
    down=0;up=1;dim=160;
end