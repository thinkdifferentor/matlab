function h_fork = fork(x1, y1, varargin)
%    作者：罗华飞  
%    功能：产生一个小叉，并显示小叉坐标
%    用法：
%        h_fork = fork(x1, y1);        在当前坐标轴的点(x1, y1)处产生一个叉叉
%        h_fork = fork(x1, y1, h_axes); 在坐标轴h_axes的点(x1, y1)处产生一个叉叉
%        h_fork = fork(x1, y1, h_axes, p1, v1, ...);  在坐标轴h_axes的点(x1, y1)
%               处产生一个叉叉，并设置叉叉的属性P1值为V1，P2属性值为V2...
%     版本：2010.09.15 V1.0
if nargin == 2                     %若输入参数为2个，表示输入的是小叉中心点的坐标
    h_fork = hggroup;
elseif nargin > 2                 %若输入参数多于2个，表格输入的第3个参数为小叉的父对象
    h_fork = hggroup('parent', varargin{1});
else
    error('Input arguments is too few.');
end

set(get(get(h_fork, 'Annotation'), 'LegendInformation'),...
    'IconDisplayStyle', 'children');     %设置插图的显示模式为显示子对象

%↓↓↓↓↓↓↓↓↓↓创建小叉↓↓↓↓↓↓↓↓↓↓
x = (-1 : 0.01 : 1)'; 
h1 = line(x + x1, x + y1, 'HitTest', 'off', 'parent', h_fork);
h2 = line(x + x1, -x + y1, 'HitTest', 'off', 'parent', h_fork);

%↓↓↓↓↓↓↓创建小叉中心点的坐标↓↓↓↓↓↓↓
h = legend('show');
delete(findobj(h, 'Type', 'line'));
h12 = findobj(h, 'Type', 'text');
set(h12(1), 'Position', [0.1 0.3 0], 'string', sprintf('x:%5.2f', x1));
set(h12(2), 'Position', [0.1 0.7 0], 'string', sprintf('y:%5.2f', y1));

%设置小叉的线条属性
if nargin > 2
    for i = 1 : 2 : nargin-3
        set([h1, h2], varargin{i + 1}, varargin{i + 2});
    end
end
