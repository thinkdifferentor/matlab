function varargout = example6_4_2(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @example6_4_2_OpeningFcn, ...
                   'gui_OutputFcn',  @example6_4_2_OutputFcn, ...
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

function example6_4_2_OpeningFcn(hObject, eventdata, handles, varargin)
global str1 str2 str3 str4 gongren
[~, txt, raw] = xlsread('datas.xls');
a = txt(2 : end, :);
gongren=a;
a1=size(gongren);
company=gongren(:,2);
plant=gongren(:,3);
section=gongren(:,4);
worker=gongren(:,1);
str1={'--公司---'};
str2={'--车间---'};
str3={'--工段---'};
str4={'--工人---'};
i=1;
while ~isempty(company)
    i=i+1;
    str1(i)=company(1);
    company(strcmpi(company(1),company))=[];    
end
set(handles.com,'string',str1)
set(handles.pla,'string',str2{1})
set(handles.sec,'string',str3{1})
set(handles.wor,'string',str4{1})

handles.output = hObject;

guidata(hObject, handles);

function varargout = example6_4_2_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function com_Callback(hObject, eventdata, handles)
global gongren str1 str2 str3 str4
val=get(hObject,'value');
if val>1
    n=find(strcmpi(str1(val),gongren(:,2)));
    temp=gongren(n,3);
    j=1;
    while ~isempty(temp)
        j=j+1;
        str2(j)=temp(1);
        m=find(strcmpi(temp(1),temp));
        temp(m)=[];    
    end
    set(handles.pla,'value',1,'string',str2)
    set(handles.sec,'value',1,'string',str3{1})
    set(handles.wor,'value',1,'string',str4{1})
else
    set(handles.pla,'value',1,'string',str2{1})
    set(handles.sec,'value',1,'string',str3{1})
    set(handles.wor,'value',1,'string',str4{1})
end

function com_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function pla_Callback(hObject, eventdata, handles)
global gongren str1 str2 str3 str4
sel1=get(handles.com,'value');
val=get(hObject,'value');
if val>1
    m=find(strcmpi(str1(sel1),gongren(:,2)));
    n=find(strcmpi(str2(val),gongren(m,3)));
    temp=gongren(m(n),4);
    k=1;
    while ~isempty(temp)
        k=k+1;
        str3(k)=temp(1);
        p=find(strcmpi(temp(1),temp));
        temp(p)=[];    
    end
    set(handles.sec,'value',1,'string',str3)
    set(handles.wor,'value',1,'string',str4{1})
else
    set(handles.sec,'value',1,'string',str3{1})
    set(handles.wor,'value',1,'string',str4{1})
end

function pla_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

function sec_Callback(hObject, eventdata, handles)
global gongren str1 str2 str3 str4
sel1=get(handles.com,'value');
sel2=get(handles.pla,'value');
val=get(hObject,'value');
if val>1
    m=find(strcmpi(str1(sel1),gongren(:,2)));
    n=find(strcmpi(str2(sel2),gongren(m,3)));
    p=find(strcmpi(str3(val),gongren(m(n),4)));
    temp=gongren(m(n(p)),1);
    k=1;
    while ~isempty(temp)
        k=k+1;
        str4(k)=temp(1);
        q=find(strcmpi(temp(1),temp));
        temp(q)=[];    
    end
    set(handles.wor,'value',1,'string',str4)
else
    set(handles.wor,'value',1,'string',str4{1})
end


function sec_CreateFcn(hObject, eventdata, handles)
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

