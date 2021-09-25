% This function calculates the value of objective function.
function fitness=test_functions(L,F_index,dim)

%Insert your own objective function with a new F_index.


switch F_index;
    case 24%max ones
    fitness=sum(L);

    case 25%Royal road
        for i=1:8:dim-7
        s(fix(i/8)+1)=sum(L(i:i+7));
        end
        fitness=sum(s==8);
end

end