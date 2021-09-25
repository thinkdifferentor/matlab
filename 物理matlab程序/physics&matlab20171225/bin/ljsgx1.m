d=300;
l=d+d+1;
x=0:1:l;
y=-d:1:d;
a=5000;
am=100;
[mx,my]=meshgrid(x,y);
r1=sqrt(mx.*mx+(my-100).*(my-100));
r2=sqrt(mx.*mx+(my+100).*(my+100));
h=cos(r1*0.4)./(r1+1)+cos(r2*0.4)./(r2+1);
h=h*5000;
[lx,ly]=size(h);
for i=1:lx
   for j=1:ly
      if h(i,j)<=-am
         h(i,j)=-am;
      end
      if h(i,j)>am
         h(i,j)=am;
      end
   end
end
surfl(h);
shading interp;
colormap(gray);
axis('equal');
      