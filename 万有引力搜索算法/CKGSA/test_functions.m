% This function calculates the value of the objective function.
% 定义目标函数通过F_index查找

function fit=test_functions(L,F_index,dim)

%Insert your own objective function with a new F_index.

if F_index==1 % Rosenbrock Function
    fit=sum(100*(L(2:dim)-(L(1:dim-1).^2)).^2+(L(1:dim-1)-1).^2);
end

end

