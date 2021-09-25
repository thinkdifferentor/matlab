[x,y]=meshgrid(-2:0.2:2,-2:0.2:2);
mmm=moviein(5);
j=1;
for i=0.1:0.2:1
   a=sqrt((x+i).^2+y.^2);
   b=sqrt((x-i).^2+y.^2);
   z=((b.^-1)-(a.^-1));
   contour(x,y,z,100)
   mmm(:,j)=getframe;
   j=j+1;
   

end
%%movie(mmm,5,1)