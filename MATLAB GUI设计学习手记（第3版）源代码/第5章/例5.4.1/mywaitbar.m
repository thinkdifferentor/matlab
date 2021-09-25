%�ļ�����mywaitbar.m
function h = mywaitbar(varargin)
%   ����һ��������Ƕ�Ľ�����
%   ��������������£�
%     ��1������Ϊ���ȣ�ֵ��[0,1]��Χ�ڣ�
%     ��2�����������ֺ��壺
%       ����������ʱ����2������Ϊ����������ı��⣻
%       ���½���ֵʱ��whichbarΪmywaitbar���صĽ��������
%     ��3������ָ�����������ڴ���
%     ��4��5������ָ���������ڴ����е�λ��,��λΪ����
%   ���ߣ��޻���
%   �汾��20101007V2.0
if nargin == 0
    %% ֱ�ӵ���mywaitbar����������Ĭ�ϵ�Ƕ��ʽ������
    %�磺mywaitbar
    hWaitbar = waitbar(0, 'Ƕ��ʽ������', 'visible', 'off'); %�������صĽ�����
    hAxes = findall(hWaitbar, 'type', 'axes'); %���ҽ������ڵ�������
    figure;
    h_axes = copyobj(hAxes, gcf);   %���ƽ���������ǰ����
    set(h_axes, 'Units', 'pixels'); %��������������UnitsĬ��ֵΪpoints����Ҫ����
    pos = get(h_axes, 'position');  %��ȡ�������������λ�úͳߴ�
    set(h_axes, 'position', [10, 10, pos(3:4)]); %�����������λ�ã��ߴ粻��
elseif nargin > 1 %
    x = varargin{1};
    whichbar = varargin{2};
    if (nargin == 5) && (ischar(whichbar) || iscellstr(whichbar))  %��ʱ����������
        %% ��ʱ���ø�ʽΪh = mywaitbar(p, 'title' , h_figure, x, y)
         %�磺h1 = mywaitbar(0.5, 'title' , figure, 10, 10)
        hWaitbar = waitbar(x, whichbar, 'visible', 'off');
        hAxes = findall(hWaitbar, 'type', 'axes');
        h_figure = varargin{3};
        set(h_figure, 'visible', 'on');
        h_axes = copyobj(hAxes, h_figure);
        set(h_axes, 'Units', 'pixels');
        pos = get(h_axes, 'position');
        set(h_axes, 'position', [varargin{4}, varargin{5}, pos(3:4)])
    elseif isnumeric(whichbar)
        %% ��ʱ���ø�ʽΪmywaitbar(p, h)��mywaitbar(p, h, 'title')
        h_axes = whichbar;
        hPatch = findobj(h_axes, 'Type', 'patch');
        set(hPatch,'XData',[0 100*x 100*x 0])
        if nargin == 3
            %% ���ø�ʽΪmywaitbar(p, h, 'title')
            hTitle = get(h_axes, 'title'); %��ȡ�������ľ����text����
            set(hTitle, 'string', varargin{3}); %���ñ��������ı�����
        end
    end
else
    error('input arguments error...');
end
%% �����������
if nargout == 1
    h = h_axes;
end
