% APE_vi: used in GuiDm_19 or GuiDm_20
function APE_vi(a1, a2, w1, w2) 
%cla
   t=0:0.0001:10;
   y1=a1*sin(w1*t);
   y2=a2*sin(w2*t);
   y=y1+y2;
   subplot(3,1,1),plot(t,y1),ylabel('y1');
   subplot(3,1,2),plot(t,y2),ylabel('y2');
   subplot(3,1,3),plot(t,y),ylabel('y'),xlabel('t');
 return

