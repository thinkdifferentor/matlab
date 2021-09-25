function varargout=djddbfun(t,y,flag)
switch flag
case''
   varargout{1}=f(t,y);
case 'events'
   [varargout{1:3}]=events(t,y);
otherwise
   error(['unknown flag''' flag '''.']);
end

function ydot=f(t,y)
ydot=[y(2);
      -9.8*sin(y(1))];

function [value,isterminal,direction]=events(t,y)
value=y(2);
isterminal=1;
direction=1;



