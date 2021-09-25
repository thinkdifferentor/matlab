function [ RR ] = Mod(Len, fillRegion )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

for i=1:Len(1)-1
    for j=1:Len(2)-1
        if( fillRegion(i,j)==0 &  fillRegion(i,j+1)==255 )
           fillRegion(i,j-2)=100;fillRegion(i,j-1)=100; fillRegion(i,j)=100;fillRegion(i,j+1)=100;fillRegion(i,j+2)=100;%fillRegion(i,j+3)=100;
%             fillRegion(i,j)=100;fillRegion(i,j-1)=100;fillRegion(i,j-2)=100;fillRegion(i,j-3)=100;
        end
        if(  fillRegion(i,j)==255 &  fillRegion(i,j+1)==0 )
           fillRegion(i,j+1)=100;fillRegion(i,j+2)=100; fillRegion(i,j)=100;fillRegion(i,j-1)=100;fillRegion(i,j-2)=100;%fillRegion(i,j-3)=100;
            %fillRegion(i,j)=100;fillRegion(i,j+1)=100;fillRegion(i,j+2)=100;fillRegion(i,j+3)=100;break;
        end
        
    end
end

RR=zeros(size(fillRegion));

mm=find(fillRegion(:)==100);

RR(mm)=255;
end

