%均匀链条从光滑桌面上滑下来的运动规律的函数
function varargout=fun(t,y,flag)       %函数的输入和输出参数
switch flag                            %用标志做开关
	case ''                            %如果标志为空
       varargout{1}=f(t,y);            %调用函数
	case 'events'                      %如果发生事件
       [varargout{1:3}]=events(y);     %调用事件函数
	otherwise                          %否则
       error(['Unknown flag ''',flag,'''.']);%输出错误信息并终止程序执行
end                                    %结束开关
%---------------------------------------------
%均匀链条从光滑桌面上滑下来的运动规律的子函数
function f=f(t,y)
f=[y(2);                               %约化速度表达式
   y(1)];                              %约化加速度表达式
%----------------------------------------------
%事件判断子函数
function [value,isterminal,direction]=events(y)
% value=y(1)-1;                          %约化长度与1之差等于0表示绳脱离桌面
% direction=1;                           %由增加(1)的方向终止
value=1-y(1);                          %1与约化长度之差,等于0表示绳脱离桌面
direction=-1;                          %由减小(-1)的方向终止
isterminal=1;                          %开启判断终止功能

