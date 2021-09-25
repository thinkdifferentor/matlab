h0 = figure('menubar', 'none', 'position', [500 300 300 100],...
    'DockControls', 'off'); %创建
h1 = uimenu(h0, 'label', '', 'ForegroundColor', 'r');
xingqi = {'日', '一', '二', '三', '四', '五', '六'};
t = timer('executionmode', 'fixedrate', 'period', 1, 'timerfcn',...
    ['if ishandle(h0),',...
    'set(h1,''label'',[datestr(clock) ''星期'' xingqi{weekday(now)}]);',...
    'else,',...
    'stop(t),',...
    'delete(t),',...
    'clear t,',...
    'end']);
start(t);
