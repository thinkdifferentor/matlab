function rgb = mySetColor(varargin)
% ���ã�mySetColor()��mySetColor([posX, posY])
% ��ʾһ�����׵���ɫѡ��Ի��򣬷�����ѡ��ɫ��RGB����
% �������[X Y]ָ������ɫѡ��Ի�������Ļ����ʾ��λ�ã�ȱʡʱ��ʾ����Ļ�м��ѡ
% ����: �޻��� 2014��4��20��
% �汾��V1.0

% ��ʼ����ɫѡ��Ի��򣬰������ñ�����ɫ����С��λ�õ�
width = 340;
height = 245;
SysCol = get(0,'DefaultUicontrolBackgroundColor');
DkSys = SysCol * 0.5; 
%�����������
if nargin == 1
    position = varargin{1};
else
    SSize = get(0,'ScreenSize');
    position = [(SSize(3)-width)/2, (SSize(4)-height)/2];
end
%�����Ի��򴰿�
hFig = figure('Name','��ɫѡ��Ի���BY�޻���V1.0',...
    'NumberTitle','off',...
    'Menubar','none',...
    'Color',SysCol,...
    'Position', [position width height],...
    'Visible','off',...
    'Resize','on',...
    'windowstyle','modal');
%��ȡ��ɫ���ݡ���һ������ʱ��EXCEL�ļ��ж�ȡ���ݣ��Ժ��mat�ļ��ж�ȡ����
pathstr = fileparts(which(mfilename));
if exist([pathstr '\color.mat'], 'file') == 2
    load([pathstr '\color.mat']);
else
    [~, txt] = xlsread([pathstr '\color.xlsx']);
    save 'color.mat' txt;
end
hexVal = txt(2:end, 2);%hexValΪ140*1��Ԫ����
%���ƻ���
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

%��ʾ��ɫѡ��Ի��򣬲��ȴ��û���������
try 
    uiwait(hFig);
    if ~ishandle(hFig)
        rgb = [];
    else
        rgb = get(hFig, 'UserData');
        delete (hFig);
    end    
end
% -----------------��д�����ɫ��ʱ�Ļص�����--------------
function getColor_callback(hObj,~)
rgb = get(hObj,'BackgroundColor');
set(gcf, 'UserData', rgb);%ͨ��UserData���Դ�����ɫֵ
uiresume;
