function varargout = ljs05003(varargin)
% LJS05003 Application M-file for ljs05003.fig
%    FIG = LJS05003 launch ljs05003 GUI.
%    LJS05003('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.5 05-Oct-2017 16:18:06

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

x=imread('e:\work\Ascent.jpg');
image(x);
%%colormap(255);
axis off


% --------------------------------------------------------------------
function varargout = pushbutton1_Callback(h, eventdata, handles, varargin)
%clear;
%quit




% --------------------------------------------------------------------
function varargout = lxjc_menu_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = zdydx_menu_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_3_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_4_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_5_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_6_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_7_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_8_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_9_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_10_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_11_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_12_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_13_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_14_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_15_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_16_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_17_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_18_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_19_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_20_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_21_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_22_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_23_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_24_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_25_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_26_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_27_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_28_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_29_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_30_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_31_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_32_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_33_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_34_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_35_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_36_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_37_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_38_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_39_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_40_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_42_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_43_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_44_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_45_Callback(h, eventdata, handles, varargin)




% --------------------------------------------------------------------
function varargout = Untitled_46_Callback(h, eventdata, handles, varargin)
clear;
quit


% --------------------------------------------------------------------
function ptyd1_menu_Callback(hObject, eventdata, handles)
% hObject    handle to ptyd1_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ptydcx