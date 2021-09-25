z=5*cplxgrid(30);
cplxmap(z,1./(z+eps*(abs(z)==0)),5*pi);
colorbar('vert');
title('1/z')
