
% 模拟退火算法产生临解
function [ b ] = reorder_route( routes )
    %REORDER_ROUTE Summary of this function goes here
    % Detailed explanation goes here
    n=length(routes)-2;
    pianduan1=ceil(n*rand)+1;
    pianduan2=ceil(n*rand)+1;
    cmin=min(pianduan1,pianduan2);
    cmax=max(pianduan1,pianduan2);
    routes2=[routes(1:cmin-1) routes(cmax:end) routes(cmin:cmax-1) ];
    b=routes2;
end