function [c,ceq]=Cond(x,w,d0,c0,a)
c=prod(do*w./(w+a*w))-c0;
ceq=[];
end