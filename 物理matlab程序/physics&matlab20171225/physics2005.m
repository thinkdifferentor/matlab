function varargout = physics2005(varargin)
%  physics2005  Application M-file for  physics2005.fig
%    FIG = physics2005 launch physics2005 GUI.
%    physics2005('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 08-Dec-2017 07:32:29

if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		if (nargout)
			[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
		else
			feval(varargin{:}); % FEVAL switchyard
		end
	catch
		disp(lasterr);
	end

end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and 
%| sets objects' callback properties to call them through the FEVAL 
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.
% --------------------------------------------------------------------
function varargout = figure1_CreateFcn(h, eventdata, handles, varargin)
x=imread('Ascent.jpg');
image(x);
%%colormap(255);
axis off;
clc;
% --------------------------------------------------------------------
function varargout = lxjc_menu_Callback(h, eventdata, handles, varargin)
%��ѧ����
clc;
% --------------------------------------------------------------------
function varargout = zdydx_menu_Callback(h, eventdata, handles, varargin)
%�ʵ��˶�ѧ
clc;
% --------------------------------------------------------------------
function varargout = zddlx_menu_Callback(h, eventdata, handles, varargin)
%�ʵ㶯��ѧ
clc;
% --------------------------------------------------------------------
function varargout = ndyddl_menu_Callback(h, eventdata, handles, varargin)
%ţ���˶�����
clc;
% --------------------------------------------------------------------
function varargout = dlydlsh_menu_Callback(h, eventdata, handles, varargin)
%�����붯���غ�
clc;
% --------------------------------------------------------------------
function varargout = jxnyjxnsh_menu_Callback(h, eventdata, handles, varargin)
%��е�����е���غ�
clc;
% --------------------------------------------------------------------
function varargout = gtyd_menu_Callback(h, eventdata, handles, varargin)
%�����˶�
% --------------------------------------------------------------------
function varargout = zdybd_menu_Callback(h, eventdata, handles, varargin)
%���벨��
clc;
% --------------------------------------------------------------------
function varargout = jxzd_menu_Callback(h, eventdata, handles, varargin)
%��е��
clc;
% --------------------------------------------------------------------
function varargout = jxb_menu_Callback(h, eventdata, handles, varargin)
%��е��
clc;
% --------------------------------------------------------------------
function varargout = fzwlxyrlx_menu_Callback(h, eventdata, handles, varargin)
%��������������ѧ
clc;
% --------------------------------------------------------------------
function varargout = maxwell01_menu_Callback(h, eventdata, handles, varargin)
maxwell01;%��ͬ������ͬһ�¶��µ����˹Τ�ֲ���
hold off
clc;
% --------------------------------------------------------------------
function varargout = dcx_menu_Callback(h, eventdata, handles, varargin)
%���ѧ
clc;
% --------------------------------------------------------------------
function varargout = Untitled_14_Callback(h, eventdata, handles, varargin)
%%%%%
% --------------------------------------------------------------------
function varargout = Untitled_15_Callback(h, eventdata, handles, varargin)
%%%
% --------------------------------------------------------------------
function varargout = Untitled_16_Callback(h, eventdata, handles, varargin)
%%%%
% --------------------------------------------------------------------
function varargout = Untitled_17_Callback(h, eventdata, handles, varargin)
%%%%%
% --------------------------------------------------------------------
function varargout = Untitled_18_Callback(h, eventdata, handles, varargin)
%%%%%%%
% --------------------------------------------------------------------
function varargout = Untitled_19_Callback(h, eventdata, handles, varargin)
%%%%%%%
% --------------------------------------------------------------------
function varargout = gx_menu_Callback(h, eventdata, handles, varargin)
%��ѧ
clc;
% --------------------------------------------------------------------
function varargout = gdgs_menu_Callback(h, eventdata, handles, varargin)
%��ĸ���
clc;
% --------------------------------------------------------------------
function varargout = maxwell02_menu_Callback(h, eventdata, handles, varargin)
maxwell02;%ͬһ�����ڲ�ͬ�¶��µ����˹Τ�ֲ���
hold off
clc;
% --------------------------------------------------------------------
function varargout = thddhdc2017_menu_Callback(h, eventdata, handles, varargin)
thddhdc2017;
clc;
% --------------------------------------------------------------------
function varargout = ydlcc2017_menu_Callback(h, eventdata, handles, varargin)
ydlcc2017;
clc;
% --------------------------------------------------------------------
function varargout = yqcczdtdds2017_menu_Callback(h, eventdata, handles, varargin)
yqcczdtdds2017;%��ǿ�ų�����ת����ĸ�Ӧ�綯��
clc;
% --------------------------------------------------------------------
function varargout = dccydcb_menu_Callback(h, eventdata, handles, varargin)
diancibo;     %%��ų����Ų�
clc;
% --------------------------------------------------------------------
function varargout = lplsfc2017_menu_Callback(h, eventdata, handles, varargin)
lplsfc2017;  %�Ⱥ�糡(������˹����)
clc;
% --------------------------------------------------------------------
function varargout = gxyssfgs_menu_Callback(h, eventdata, handles, varargin)
gxyssfgs;  %%��ѧ����˫�����
clc
% --------------------------------------------------------------------
function varargout = gxNewtonring_menu_Callback(h, eventdata, handles, varargin)
gxNewtonring;   %%ţ�ٻ�
clc;
% --------------------------------------------------------------------
function varargout = gxMikeson_menu_Callback(h, eventdata, handles, varargin)
gxMikeson;       %%���˶�ѷ����
clc;
% --------------------------------------------------------------------
function varargout = gdys_menu_Callback(h, eventdata, handles, varargin)
%�������
clc;
% --------------------------------------------------------------------
function varargout = dfys_menu_Callback(h, eventdata, handles, varargin)
gxdfys;      %%��ѧ��������
clc;
% --------------------------------------------------------------------
function varargout = gxgsys_menu_Callback(h, eventdata, handles, varargin)
gxgsys;    %%��ѧ��դ����
clc;
% --------------------------------------------------------------------
function varargout = spring_menu_Callback(h, eventdata, handles, varargin)
spring2005;    %%��г��
clc;
% --------------------------------------------------------------------
function varargout = znzd2007_menu_Callback(h, eventdata, handles, varargin)
znzd2017;  %%������
%close;

% --------------------------------------------------------------------
function varargout = spzd2017a_menu_Callback(h, eventdata, handles, varargin)
spzd2017a;%������
close;
clc;
% --------------------------------------------------------------------
function varargout = gzydlxtz_menu_Callback(h, eventdata, handles, varargin)
GuiDm_21;     %%����Ķ���ѧ����
clc;
% --------------------------------------------------------------------
function varargout = zddhc_menu_Callback(h, eventdata, handles, varargin)
%�񶯵ĺϳ�
clc;
% --------------------------------------------------------------------
function varargout = zdhcyp_menu_Callback(h, eventdata, handles, varargin)

GuiDm_20    %%ͬ�����񶯵ĺϳ�----��
clc;
% --------------------------------------------------------------------
function varargout = lsltx_menu_Callback(h, eventdata, handles, varargin)
lsltx;     %%��ֱ�񶯵ĺϳ�------������ͼ��
close;
% --------------------------------------------------------------------
function varargout = jdwl_menu_Callback(h, eventdata, handles, varargin)
%��������
clc;
% --------------------------------------------------------------------
function varargout = help_menu_Callback(h, eventdata, handles, varargin)
%����
clc;
% --------------------------------------------------------------------
function varargout = xt_menu_Callback(h, eventdata, handles, varargin)
%��ϵͳ���������������������,��Ҫ���ڽ�ѧ����,�����κ�����.

% --------------------------------------------------------------------
function varargout = exit_menu_Callback(h, eventdata, handles, varargin)
%�˳�
% --------------------------------------------------------------------
function varargout = quit_menu_Callback(h, eventdata, handles, varargin)
clear;
quit;
% --------------------------------------------------------------------
function ptyd1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to ptyd1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ptydcx;      %%�����˶�
hold off

% --------------------------------------------------------------------
function xbptyd_menu_Callback(hObject, eventdata, handles)
% hObject    handle to xbptyd_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xbptyd;      %%б��б���˶�
hold off
clc;
% --------------------------------------------------------------------
function znptyd_menu_Callback(hObject, eventdata, handles)
% hObject    handle to znptyd_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
znxpyd;      %%����б���˶�
hold off
clc;
% --------------------------------------------------------------------
function wtxmlph_menu_Callback(hObject, eventdata, handles)
% hObject    handle to wtxmlph_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wtxmlph;     %%����б�����ƽ��
clc;
% --------------------------------------------------------------------
function cdydgl_menu_Callback(hObject, eventdata, handles)
% hObject    handle to cdydgl_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cdydgl;      %%�����˶�����
% --------------------------------------------------------------------
function ltfl_47_Callback(hObject, eventdata, handles)
% hObject    handle to ltfl_47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ltfl;      %%�����ӹ⻬�����»�
clc;
% --------------------------------------------------------------------
function wqtxpz_menu_Callback(hObject, eventdata, handles)
% hObject    handle to wqtxpz_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wqtxpz;      %%��ȫ���ĵ�����ײ
clc;
% --------------------------------------------------------------------
function wqdxfpz_menu_Callback(hObject, eventdata, handles)
% hObject    handle to wqdxfpz_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wqtxfpz;    %%��ȫ���ķǵ�����ײ
clc;
% --------------------------------------------------------------------
function wtbyfx_menu_Callback(hObject, eventdata, handles)
% hObject    handle to wtbyfx_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wtbyfx;    %%�������Ħ���İ�Բ����
clc;
% --------------------------------------------------------------------
function gzdhlxt_menu_Callback(hObject, eventdata, handles)
% hObject    handle to gzdhlxt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gzdhlxt;    %%���ᶯ����ϵͳ
clc;
% --------------------------------------------------------------------
function srfblsxz_menu_Callback(hObject, eventdata, handles)
% hObject    handle to srfblsxz_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
srfblsxz;    %%˫�˻���������ת
clc;
% --------------------------------------------------------------------
function zdygtpz_menu_Callback(hObject, eventdata, handles)
% hObject    handle to zdygtpz_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zdygtpz;   %%�ʵ��������ײ
clc;
% --------------------------------------------------------------------
function pmjxb2017_menu_Callback(hObject, eventdata, handles)
% hObject    handle to pmjxb2017_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pmjxb2017;  %ƽ���г��
clc;
% --------------------------------------------------------------------
function bdgs2017_menu_Callback(hObject, eventdata, handles)
% hObject    handle to bdgs2017_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bdgs2017;%���ĸ���
close;
% --------------------------------------------------------------------
function zb2017_menu_Callback(hObject, eventdata, handles)
% hObject    handle to zb2017_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zb2017;  %פ��
clc;
close;
% --------------------------------------------------------------------
function dzsfgs2017_menu_Callback(hObject, eventdata, handles)
% hObject    handle to dzsfgs2017_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dzsfgs2017; %����˫�����
close;

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_49_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%

% --------------------------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%
% --------------------------------------------------------------------
function thermo_menu_Callback(hObject, eventdata, handles)
% hObject    handle to thermo_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thermo;
