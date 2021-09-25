function varargout = example6_3_4(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_3_4_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_3_4_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function example6_3_4_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
set(handles.listbox1, 'UserData', true);  %折叠为真
guidata(hObject, handles);

function varargout = example6_3_4_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function listbox1_Callback(hObject, ~, handles)
%% 获取当前选项的索引值
n = get(hObject, 'value');
%% 根据当前选项，设置右键菜单、双击显示操作和展开/折叠操作
if n ~= 3  %若没有选中“数学”
    set(hObject, 'uicontextmenu', ''); %右键菜单为空
    if isequal(get(gcf, 'SelectionType'), 'open') %若双击左键
        str = get(hObject, 'string'); %获取列表框的文本
        if n < 3 %若选中“语文”或“英语”
            set(handles.text1, 'string', str{n})
        else     %若选中“数学”的子选项，去掉文本前的“∟”
            str1 = str{n}; 
            set(handles.text1, 'string', str1(2 : end));
        end
    end
else  %若选中“数学”
    set(hObject, 'uicontextmenu', handles.caidan1); %设置右键菜单
    if isequal(get(gcf, 'SelectionType'), 'normal') %若单击左键
        isFold = get(hObject, 'UserData'); %获取“折叠”状态
        isFold = ~isFold; %“折叠”状态取反
        if ~isFold  %若需要设置为“展开”状态
            set(hObject, 'String', {'语文', '英语', '数学', '∟高等数学',...
                '∟线性代数'});
        else        %若需要设置为“折叠”状态
            set(hObject, 'String', {'语文', '英语', '>>数学'}, 'Value', 3);
        end
        set(hObject, 'UserData', isFold); %更新“折叠”状态
    end
end

function caidan1_Callback(hObject, eventdata, handles)

function mathematic_Callback(~, ~, handles)
set(handles.text1, 'string', '高等数学');

function linear_Callback(~, ~, handles)
set(handles.text1, 'string', '线性代数');
