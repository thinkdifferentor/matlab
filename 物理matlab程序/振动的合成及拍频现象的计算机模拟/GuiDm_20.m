%GuiDm_20  GUI to show vibrancy
clf, clear
h6=figure(1);
clf
R=0;G=0.4;B=0;
set(h6,'Position',[60,300,680,380],...
       'Color',[0.7,0.7,0.7],...
       'NumberTitle','off',...
       'Name','振动的合成及拍频现象的计算机模拟')
a1=2; w1=100; a2=2.5; w2=130;
APE_vi(a1, a2, w1, w2 ); 
   %calling 2nd RK
%============================= 
t1 = uicontrol(gcf,'Style','text', ...
   'String',...
      ['a1=',num2str(a1)],...
   'HorizontalAlignment','Left',...
   'Position',[30,360,60,15],...
   'BackgroundColor',[0.7,0.7,0.7]);
t1B= uicontrol(gcf,'Style','text', ...
   'String',...
      ['w1=',num2str(w1)],...
   'HorizontalAlignment','Left',...
   'Position',[90,360,60,15],...
   'BackgroundColor',[0.7,0.7,0.7]);
t2 = uicontrol(gcf,'Style','text', ...
   'String',...
      ['a2=',num2str(a2)],...                        
   'HorizontalAlignment','Left',...
   'Position',[180,360,60,15],...
   'BackgroundColor',[0.7,0.7,0.7]);
t2B = uicontrol(gcf,'Style','text', ...
   'String',...
      ['w2=',num2str(w2)],...
   'HorizontalAlignment','Left',...
   'Position',[240,360,60,15],...
   'BackgroundColor',[0.7,0.7,0.7]);
%=============================Popup Menu
p1 = uicontrol('Style','Popup', ...
   'String',...
      'w1=100|w1=200|w1=300|w1=400|w1=500|w1=600',...
   'Position',[510,360,80,20],...
   'Value',1,...
   'CallBack',...
   [...
    ' cla;cv=get(p1,''Value'');'...
    ' if cv==1, w1=100; end;'...
    ' if cv==2, w1=200; end;'...
    ' if cv==3, w1=300; end;'...
    ' if cv==4, w1=400; end;'...
    ' if cv==5, w1=500; end;'...
    ' if cv==6, w1=600; end;'...
    ' set(t1B,''String'',[''w1='',num2str(w1)]);',...
    ' set(g2, ''String'',[num2str(w1)]);',...
   ]);
p2 = uicontrol('Style','Popup', ...
   'String',...
      'w2=110|w2=210|w2=310|w2=410|w2=510|w2=610',...
   'Position',[590,360,80,20],...
   'Value',1,...
   'CallBack',...
   [...
    ' cla;cv=get(p2,''Value'');'...
    ' if cv==1, w2=110; end;'...
    ' if cv==2, w2=210; end;'...
    ' if cv==3, w2=310; end;'...
    ' if cv==4, w2=410; end;'...
    ' if cv==5, w2=510; end;'...
    ' if cv==6, w2=610; end;'...
    ' set(t2B,''String'',[''w2='',num2str(w2)]);',...
    ' set(s2, ''String'',[num2str(w2)]);',...
   ]);

%=============================Edit for a1 
b1 = uicontrol(gcf,'Style','text', ...
   'String','a1:',...
   'Position',[75,5,30,20],...
   'BackgroundColor',[0.7,0.7,0.7]);
b2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[105,5,80,20], ...
   'String', '2',...
   'CallBack', ...
     [ 'cla;a1=str2num(get(b2,''String''));',...
       'set(t1,''String'',[''a1='',num2str(a1)]);',...
     ]);
%============================edit for w1 
g1 = uicontrol(gcf,'Style','text', ...
   'String','w2:',......
   'Position',[195,5,30,20],...
   'BackgroundColor',[0.7,0.7,0.7]);
g2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[225,5,105,20], ...
   'String', ...
   [num2str(w1)],...
   'CallBack', ...
     [ 'cla;w1=str2num(get(g2,''String''));',...
       'set(t1B,''String'',[''w1='',num2str(w1)]);',...
     ]);
%=============================Edit for a2
r1 = uicontrol(gcf,'Style','text', ...
   'String','a2:',...
   'Position',[360,5,30,20],...
   'BackgroundColor',[0.7,0.7,0.7]);
r2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[390,5,80,20], ...
   'String', '2.5',...
   'CallBack', ...
     [ 'cla;a2=str2num(get(r2,''String''));',...
       'set(t2,''String'',[''a2='',num2str(a2)]);',...
     ]);
 %=============================edit for w2 
s1 = uicontrol(gcf,'Style','text', ...
   'String','w2:',...
   'Position',[480,5,30,20],...
   'BackgroundColor',[0.7,0.7,0.7]);
s2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[510,5,105,20], ...
   'String', ...
    [num2str(w2)],...
   'CallBack', ...
     [ 'cla;w2=str2num(get(s2,''String''));',...
       'set(t2B,''String'',[''w2='',num2str(w2)]);',...
     ]);
%================================ Push button
x1 = uicontrol(gcf,'Style','Push', ...
   'String','应用',...
   'Position',[625,45,50,30],...
   'CallBack',...
   'disp([a1,a2,w1,w2]);APE_vi(a1, a2, w1, w2)');
y1 = uicontrol(gcf,'Style','push',...
   'String','退出',...
   'Position',[625,5,50,30],...
   'Callback','close');


