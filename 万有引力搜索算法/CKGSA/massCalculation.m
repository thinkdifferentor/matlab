%This function calculates the mass of each agent.
% 计算每个物体的重量

function [M]=massCalculation(fit,min_flag)
% here, make your own function of 'mass calculation'

Fmax=max(fit); Fmin=min(fit); Fmean=mean(fit); 
[i N]=size(fit);

if Fmax==Fmin
   M=ones(N,1);
else
    
   if min_flag==1 %for minimization 对于最小化问题
      best=Fmin;worst=Fmax;
   else %for maximization
      best=Fmax;worst=Fmin; 
   end
  
   M=(fit-worst)./(best-worst); 

end

M=M./sum(M); 