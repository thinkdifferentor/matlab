function rgb = mySetColor(varargin)
% 调用：mySetColor()、mySetColor([posX, posY])
% 显示一个简易的颜色选择对话框，返回所选颜色的RGB矩阵
% 输入参数[X Y]指定了颜色选择对话框在屏幕上显示的位置；缺省时显示在屏幕中间可选
% 作者: 罗华飞 2014年4月20日
% 版本：V1.0

% 初始化颜色选择对话框，包括设置背景颜色、大小、位置等
width = 340;
height = 245;
SysCol = get(0,'DefaultUicontrolBackgroundColor');
DkSys = SysCol * 0.5; 
%输入参数处理
if nargin == 1
    position = varargin{1};
else
    SSize = get(0,'ScreenSize');
    position = [(SSize(3)-width)/2, (SSize(4)-height)/2];
end
%创建对话框窗口
hFig = figure('Name','颜色选择对话框BY罗华飞V1.0',...
    'NumberTitle','off',...
    'Menubar','none',...
    'Color',SysCol,...
    'Position', [position width height],...
    'Visible','off',...
    'Resize','on',...
    'windowstyle','modal');
%获取颜色数据。第一次运行时从EXCEL文件中读取数据，以后从mat文件中读取数据
pathstr = fileparts(which(mfilename));
if exist([pathstr '\color.mat'], 'file') == 2
    load([pathstr '\color.mat']);
else
    [~, txt] = xlsread([pathstr '\color.xlsx']);
    save 'color.mat' txt;
end
hexVal = txt(2:end, 2);%hexVal为140*1单元数组
%绘制画板
for iRow = 1 : 10   
    for iCol = 1 : 14
        str = [hexVal{iRow*14+iCol-14, :}];
        myColor = hex2dec([str(2:3);str(4:5);str(6:7)])'/255;
        pos = [(iCol*18)-16, (iRow*18)-16, 16, 16];
        uicontrol('style','frame',...
                  'position',pos,...
                  'BackgroundColor',myColor,...
                  'ForegroundColor',DkSys,...
                  'Enable','inactive',...
                  'ButtonDownFcn',@getColor_callback);
    end 
end

%显示颜色选择对话框，并等待用户操作返回
try 
    uiwait(hFig);
    if ~ishandle(hFig)
        rgb = [];
    else
        rgb = get(hFig, 'UserData');
        delete (hFig);
    end    
end
% -----------------编写点击颜色块时的回调函数--------------
function getColor_callback(hObj,~)
rgb = get(hObj,'BackgroundColor');
set(gcf, 'UserData', rgb);%通过UserData属性传递颜色值
uiresume;
