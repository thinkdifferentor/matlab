%Center
% yc =
% 
%     5.5560
% 
% 
% xc =
% 
%    -9.3063




im2bw()


load R

for i=1:645
   for j=1:1350
       if(R(i,j)~=0)
            R(i,j)=255;
       end
   end
end



load Img2
load Cmp

for i=1:645
   for j=1:1350
       if(Cmp(i,j)-Img2(i,j)<10)
            Img2(i,j)=0;
       end
   end
end



load R3
R2_256=zeros(406);

for i=48:454
   for j=48:454
       R2_256(:,:)=img(i,j);
   end
end

