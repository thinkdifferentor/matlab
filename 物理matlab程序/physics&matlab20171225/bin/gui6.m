h1=figure(2)
set(h1,'position',[30,50,280,100]','color',[0,0.5,0.5],'Name','gui6.m');
j=uicontrol('position',[0,60,250,30],'String','Select from A,B,C,Dor colse');
k=uicontrol('Style','popup','String','A|B|C|D|Close','value',3,'Callback','task1(h1,k)');
