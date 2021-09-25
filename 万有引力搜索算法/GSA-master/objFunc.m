% This function calculates the value of the objective function.
% 此函数计算目标函数的值。

function fit = objFunc(X, F_index)
% Insert your own objective function with a new F_index.
% 定义你自己的函数并通过F_index输入

dim = length(X);
if F_index==1
    fit=sum(X.^2);
end

if F_index==2 
    fit=sum(abs(X))+prod(abs(X));
end

if F_index==3
    fit=0;
    for i=1:dim
    fit=fit+sum(X(1:i))^2;
    end
end

if F_index==4
    fit=max(abs(X));
end

if F_index==5
    fit=sum(100*(X(2:dim)-(X(1:dim-1).^2)).^2+(X(1:dim-1)-1).^2);
end

if F_index==6
    fit=sum(floor((X+.5)).^2);
end

if F_index==7
    fit=sum([1:dim].*(X.^4))+rand;
end

if F_index==8
    fit=sum(-X.*sin(sqrt(abs(X))));
end

if F_index==9
    fit=sum(X.^2-10*cos(2*pi.*X))+10*dim;
end

if F_index==10
    fit=-20*exp(-.2*sqrt(sum(X.^2)/dim))-exp(sum(cos(2*pi.*X))/dim)+20+exp(1);
end

if F_index==11
    fit=sum(X.^2)/4000-prod(cos(X./sqrt([1:dim])))+1;
end

if F_index==12
    fit=(pi/dim)*(10*((sin(pi*(1+(X(1)+1)/4)))^2)+sum((((X(1:dim-1)+1)./4).^2).*...
        (1+10.*((sin(pi.*(1+(X(2:dim)+1)./4)))).^2))+((X(dim)+1)/4)^2)+sum(Ufun(X,10,100,4));
end
if F_index==13
    fit=.1*((sin(3*pi*X(1)))^2+sum((X(1:dim-1)-1).^2.*(1+(sin(3.*pi.*X(2:dim))).^2))+...
        ((X(dim)-1)^2)*(1+(sin(2*pi*X(dim)))^2))+sum(Ufun(X,5,100,4));
end

if F_index==14
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;...
-32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
    for j=1:25
        bS(j)=sum((X'-aS(:,j)).^6);
    end
    fit=(1/500+sum(1./([1:25]+bS))).^(-1);
end

if F_index==15
    aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
    bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
    fit=sum((aK-((X(1).*(bK.^2+X(2).*bK))./(bK.^2+X(3).*bK+X(4)))).^2);
end

if F_index==16
    fit=4*(X(1)^2)-2.1*(X(1)^4)+(X(1)^6)/3+X(1)*X(2)-4*(X(2)^2)+4*(X(2)^4);
end

if F_index==17
    fit=(X(2)-(X(1)^2)*5.1/(4*(pi^2))+5/pi*X(1)-6)^2+10*(1-1/(8*pi))*cos(X(1))+10;
end

if F_index==18
    fit=(1+(X(1)+X(2)+1)^2*(19-14*X(1)+3*(X(1)^2)-14*X(2)+6*X(1)*X(2)+3*X(2)^2))*...
        (30+(2*X(1)-3*X(2))^2*(18-32*X(1)+12*(X(1)^2)+48*X(2)-36*X(1)*X(2)+27*(X(2)^2)));
end

if F_index==19
    aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
    pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
    fit=0;
    for i=1:4
    fit=fit-cH(i)*exp(-(sum(aH(i,:).*((X-pH(i,:)).^2))));
    end
end

if F_index==20
    aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
    fit=0;
    for i=1:4
    fit=fit-cH(i)*exp(-(sum(aH(i,:).*((X-pH(i,:)).^2))));
    end
end

aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

if F_index==21
    fit=0;
  for i=1:5
    fit=fit-((X-aSH(i,:))*(X-aSH(i,:))'+cSH(i))^(-1);
  end
end

if F_index==22
    fit=0;
  for i=1:7
    fit=fit-((X-aSH(i,:))*(X-aSH(i,:))'+cSH(i))^(-1);
  end
end

if F_index==23
    fit=0;
  for i=1:10
    fit=fit-((X-aSH(i,:))*(X-aSH(i,:))'+cSH(i))^(-1);
  end
end


function y=Ufun(x,a,k,m)

y=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
