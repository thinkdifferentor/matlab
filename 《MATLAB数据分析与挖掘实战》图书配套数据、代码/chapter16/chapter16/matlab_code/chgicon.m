function chgicon(hfig,filename)
%�ؼ��ֲ��ң�matlab figureͼ���޸�
%�ļ���ʽ���磺'E:\\����ʵ��\\����\\����\\folder.ico'����'.\\logo.jpg'
%CHGICON changes the Figure HFIG's icon to the icon specified by ICONFILE
% HFIG must be a figure handle.
% ICONFILE is a string specifies the path to an imagefile.
%
%WARNING:
% Changing the matlab icon violate the mathworks license. THis function can
% only be used for study purpose. Please delete it within 24 hours.
%
% Author: junziyang (simwer@126.com)
% Ver.1.0
% 2009-05-20

if nargin<2
    error('MATLAB:chgicon','%s','Too few input arguments!');
end
if nargin >2
    error('MATLAB:chgicon','%s','Too many input arguments!');
end
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
newIcon = javax.swing.ImageIcon(filename);
javaFrame = get(hfig,'JavaFrame');
javaFrame.setFigureIcon(newIcon);
end

