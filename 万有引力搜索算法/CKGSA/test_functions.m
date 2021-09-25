% This function calculates the value of the objective function.
% ����Ŀ�꺯��ͨ��F_index����

function fit=test_functions(L,F_index,dim)

%Insert your own objective function with a new F_index.

if F_index==1 % Rosenbrock Function
    fit=sum(100*(L(2:dim)-(L(1:dim-1).^2)).^2+(L(1:dim-1)-1).^2);
end

end

