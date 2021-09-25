% This function calculates Gravitational constant
% 这个函数更新引力常数

function G=Gconstant(iteration,max_it)
%%%here, make your own function of 'G'

  alfa=20;G0=100;
  G=G0*exp(-alfa*iteration/max_it); 
end
