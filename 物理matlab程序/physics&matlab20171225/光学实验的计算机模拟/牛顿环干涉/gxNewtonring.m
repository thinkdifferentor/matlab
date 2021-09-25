clf, clear
h6=figure(1);
R=0;G=0.4;B=0;
set(h6,'Position',[60, 300,480,280],...
       'Color',[ 0.7,0.7,0.7],...
       'NumberTitle','off',...
       'Name','牛顿环（等厚干涉）实验的计算机模拟')
R=5000;A=632.8e-006; %%mm
Newtonring_m(R,A)
%============================= 
t1 = uicontrol(gcf,'Style','text', ...
   'String',' 牛顿环（等厚干涉）的光强分布为： I(x,y) = I(0) cos [ π ( r ^ 2 / R + λ / 2 ) / λ ] ^ 2',...
   'Fontname','Times New Roman',...
   'HorizontalAlignment','Left',...
   'Position',[35,266,420,15],...
   'BackgroundColor',[0.8,1,1]);
%=============================Edit for A
b1 = uicontrol(gcf,'Style','text', ...
   'String',{'光波波长','λ ( mm )'},...
   'Fontname','Times New Roman',...
   'Position',[305,90,100,30],...
   'BackgroundColor',[0.7,0.7,0.7]);
b2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[315,70,80,20], ...
   'String',...
   [num2str(A)],...
   'CallBack', 'cla;A=str2num(get(b2,''String''));');
 %=============================Edit for R 
m1 = uicontrol(gcf,'Style','text', ...
   'String',{'凸透镜的曲率半径','R ( mm )'},...
   'Fontname','Times New Roman',...
   'Position',[95,90,100,30],...
   'BackgroundColor',[0.7,0.7,0.7]);
m2 = uicontrol(gcf,...
   'Style','edit',...
   'Position',[105,70,80,20], ...
   'String', ...
   [num2str(R)],...
   'CallBack', 'cla;R=str2num(get(m2,''String''));');
%================================ Push button
x1 = uicontrol(gcf,'Style','push',...
   'String','退出',...
   'Position',[325,15,60,30],...
   'Callback','close');
x2 = uicontrol(gcf,'Style','push',...
   'String','绘图',...
   'Position',[115,15,60,30],...
   'Callback','Newtonring_m(R,A)');