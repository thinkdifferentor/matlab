function h_fork = fork(x1, y1, varargin)
%    ���ߣ��޻���  
%    ���ܣ�����һ��С�棬����ʾС������
%    �÷���
%        h_fork = fork(x1, y1);        �ڵ�ǰ������ĵ�(x1, y1)������һ�����
%        h_fork = fork(x1, y1, h_axes); ��������h_axes�ĵ�(x1, y1)������һ�����
%        h_fork = fork(x1, y1, h_axes, p1, v1, ...);  ��������h_axes�ĵ�(x1, y1)
%               ������һ����棬�����ò�������P1ֵΪV1��P2����ֵΪV2...
%     �汾��2010.09.15 V1.0
if nargin == 2                     %���������Ϊ2������ʾ�������С�����ĵ������
    h_fork = hggroup;
elseif nargin > 2                 %�������������2�����������ĵ�3������ΪС��ĸ�����
    h_fork = hggroup('parent', varargin{1});
else
    error('Input arguments is too few.');
end

set(get(get(h_fork, 'Annotation'), 'LegendInformation'),...
    'IconDisplayStyle', 'children');     %���ò�ͼ����ʾģʽΪ��ʾ�Ӷ���

%������������������������С���������������������
x = (-1 : 0.01 : 1)'; 
h1 = line(x + x1, x + y1, 'HitTest', 'off', 'parent', h_fork);
h2 = line(x + x1, -x + y1, 'HitTest', 'off', 'parent', h_fork);

%������������������С�����ĵ�������������������
h = legend('show');
delete(findobj(h, 'Type', 'line'));
h12 = findobj(h, 'Type', 'text');
set(h12(1), 'Position', [0.1 0.3 0], 'string', sprintf('x:%5.2f', x1));
set(h12(2), 'Position', [0.1 0.7 0], 'string', sprintf('y:%5.2f', y1));

%����С�����������
if nargin > 2
    for i = 1 : 2 : nargin-3
        set([h1, h2], varargin{i + 1}, varargin{i + 2});
    end
end
