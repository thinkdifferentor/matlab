% This function calculates Gravitational constant. eq.13.
function G=Gconstant(iteration,max_it)
% here, make your own function of 'G'.
alfa=20;
G0=100;
G=G0*exp(-alfa*iteration/max_it); % eq.28.