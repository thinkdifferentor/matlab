% This function calculates the mass of each agent. eq.14-20
function M =massCalculation(fit,min_flag)
% Here, make your own function of 'mass calculation'
Fmax=max(fit);
Fmin=min(fit);
[~,N]=size(fit);
if Fmax==Fmin
    M=ones(N,1);
else
    if min_flag==1 % for minimization
        best=Fmin;
        worst=Fmax; % eq.17-18.
    else % for maximization
        best=Fmax;
        worst=Fmin; % eq.19-20.
    end    
    M=(fit-worst)./(best-worst); % eq.15.
end
M=M./sum(M); % eq.16.