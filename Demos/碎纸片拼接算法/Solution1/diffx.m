
% æ‡¿Î÷µº∆À„
function [ cost ] = diffx( c,cellx )
%DIFFX Summary of this function goes here
% Detailed explanation goes here
n=length(c);
tt=0;

    for i=1:n-1
        j=cellx{c(i)};
        p=cellx{c(i+1)};
        q=j.right-p.left;
        tt=tt+sum(q.*q);
    end

cost=tt;
end