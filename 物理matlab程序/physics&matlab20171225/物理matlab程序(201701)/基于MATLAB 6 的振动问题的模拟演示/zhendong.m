clf reset
% 界面设计与程序调用
H=axes('unit','normalized','position',[0.06,0,1,1],'visible','off');
set(gcf,'currentaxes',H);
str='\fontname{隶书}振动曲线图';
text(0.24,0.93,str,'fontsize',13);
h_fig=get(H,'parent');
set(h_fig,'unit','normalized','position',[0.1,0.2,0.7,0.4],...
       'NumberTitle','off',...
       'Name','基于MATLAB的振动问题的模拟演示');
h_axes=axes('parent',h_fig,...
    'unit','normalized','position',[0.07,0.15,0.55,0.7],...
    'xlim',[0 30],'ylim',[0 1.8],'fontsize',8);
%============================Edit for f 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.67,0.83,0.15,0.10],...
    'horizontal','left','string',{'强迫力振幅 f',});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.67,0.73,0.15,0.10],...
    'horizontal','left',...
    'callback',['f=str2num(get(gcbo,''string''));',...
        'hold off,']);
%============================Edit for p 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.84,0.83,0.15,0.10],...
    'horizontal','left','string',{'强迫力角频率 p',});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.84,0.73,0.15,0.10],...
    'horizontal','left',...
    'callback',['wp=str2num(get(gcbo,''string''));',...
        'hold off,']);
%============================Edit for x0v0 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.67,0.61,0.15,0.10],...
    'horizontal','left','string',{'初位移和初速度','x0v0 = x0_v0'});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.67,0.51,0.15,0.10],...
    'horizontal','left',...
    'callback',[...
        'x0v0=str2num(get(gcbo,''string''));',...
        'hold off,']);
%============================Edit for t 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.84,0.61,0.15,0.10],...
    'horizontal','left','string',{'演示时间段','t=t1:Delta t:t2'});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.84,0.51,0.15,0.10],...
    'horizontal','left',...
    'callback',[...
        't1=str2num(get(gcbo,''string''));',...
        'hold off,']);
%============================Edit for beita 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.67,0.40,0.15,0.10],...
    'horizontal','left','string',{'阻尼系数','beita'});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.67,0.30,0.15,0.10],...
    'horizontal','left',...
    'callback',[...
        'z=str2num(get(gcbo,''string''));',...
        'hold off,']);
%============================Edit for omega0 
h_text=uicontrol(h_fig,'style','text',...
    'unit','normalized','position',[0.84,0.40,0.15,0.10],...
    'horizontal','left','string',{'系统固有角频率','omega0'});
h_edit=uicontrol(h_fig,'style','edit',...
    'unit','normalized','backgroundColor','w','position',[0.84,0.30,0.15,0.10],...
    'horizontal','left',...
    'callback',[...
    'w1=str2num(get(gcbo,''string''));',...
    'hold off,']);
%================================ Push button
h_push1=uicontrol(h_fig,'style','push',...
    'unit','normalized','position',[0.67,0.12,0.15,0.12],...
    'string','绘图',...
    'callback',[...
        'zd_m(f,wp,x0v0,t1,z,w1);',...
        'clear s;',...
        'w0=w1+0.000000000001;',...
        'if f==0&z(1)==0',...
        'str1=''简谐振动'';',...
        'elseif f ~=0&z(1)~=0',...
        'str1=''受迫振动'';',...
        'elseif f==0&z(1)^2>w0^2',...
        'str1=''过阻尼振动'';',...
        'elseif f==0&abs(z(1)^2-w0^2)<0.0001',...
        'str1=''临界阻尼振动'';',...
        'elseif f==0&z(1)^2<w0^2',...
        'str1=''欠阻尼振动'';',...
        'end;',...
        'if length(z)~=1',...
        'str1=''多振动曲线'';',...
        'end;',...
        'set(gcf,''name'',str1,''numbertitle'',''off'');',...
        'hold off,',...
        'ckv= get(ckbox,''Value'');if ckv==1,grid on,elseif ckv==0,grid off,end']);
h_push2=uicontrol(h_fig,'style','push',...
    'unit','normalized','position',[0.84,0.12,0.15,0.12],...
    'string','退出','callback','close');
%============================== Grid on/off
ckbox=uicontrol(gcf, 'Style','checkbox',...
        'Position', [50,275, 120,20], ...
        'String',' 网格（开/关）', ...
        'backgroundColor','w',...
        'Value',0,...
        'CallBack',...
         ['ckv= get(ckbox,''Value'');if ckv==1,',...
          'grid on,elseif ckv==0, grid off, end ']);