function analogclock()
%    ���������ἰ���Ӷ�������ģ��ʱ��
%    ���ߣ��޻���
%    �汾��20101005 V1.0
%% ����������
hFigure = figure('Visible', 'off');  %����һ�����صĴ��ڣ������ڲ��ֺú�����ʾ
hAxes = axes('visible', 'off', 'DrawMode', 'fast'); %��������������
rectangle('Curvature',[1, 1], 'FaceColor', 'w', 'Position', [-1 -1 2 2]);
axis equal;  %�������x���y��̶ȱ������

%% �����̶���
for i = 0 : 6 : 354        %iΪÿ���̶��ߵĽǶ�
    thelt = i * pi / 180;  %�Ƕ�ת��Ϊ����ֵ
    if ~rem(i, 30)         %�̶���3��6��9��12Ҫ��Щ����ɫΪ��ɫ
        x = 0.9 : 0.01 : 1;%�̶��ߵĳ���Ϊ0.1
        line(x*cos(thelt), x*sin(thelt), 'Color', 'r', 'LineWidth', 3);
    else                   %�����̶���ҪϸЩ����ɫΪ��ɫ
        x = 0.95 : 0.01 : 1;%�̶��ߵĳ���Ϊ0.05
        line(x*cos(thelt), x*sin(thelt), 'Color', 'b', 'LineWidth', 1);
    end
end

%% ���ƿ̶�ֵ
ang = pi / 3;    %�̶�ֵ1����Ӧ�Ļ���ֵ
for i = 1 : 12   %���ÿ���̶�ֵ
    if rem(i, 3) %�̶�ֵΪ3��6��9��12ʱ���ֺ�Ϊ12
        text(0.8*cos(ang), 0.8*sin(ang), num2str(i), 'horizontalAlignment',...
            'center', 'FontSize', 12);
    else %�̶�ֵΪ3��6��9��12ʱ���ֺ�Ϊ20���Ӵ֣���ɫ
        text(0.7*cos(ang), 0.7*sin(ang), num2str(i), 'horizontalAlignment',...
            'center', 'FontSize', 20, 'FontWeight', 'bold', 'Color', 'g');
    end
    ang = ang - pi / 6; %ÿ����һ���̶�ֵ���͸��»���ֵ
end

%% ���Ʊ������ĵ�
hAxesDot = axes('Visible', 'off', 'DrawMode', 'fast'); %�������ĵ����ڵ������� 
axis equal; %ʹ���ĵ㿴�����Ǹ�Բ��
%%%%%%%%%%%����1������line��������%%%%%%%%%
line(0, 0, 'Parent', hAxesDot, 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 15); 
%%%%%%%%%%%����2������patch��������%%%%%%%%%
% t = 0 : 0.01 : 2*pi;
% hPatch = patch('xData', 0.05*cos(t), 'yData', 0.05*sin(t), 'Parent', hAxesDot, 'FaceColor', 'b');

%% ��ʾ����
set(hFigure, 'Visible', 'on');

%% ѭ������ָ��λ��
try  %ʹ��try�ṹ���Ա���رմ���ʱ���ֵĴ�����ʾ
    while(1)
        %% ���µ�ǰʱ��
        time = floor(clock);  %��ȡ��ǰʱ�̣�����1��6�ľ���
        hour = time(4);       %��ȡ��ǰ��Сʱ
        min = time(5);        %��ȡ��ǰ�ķ���
        sec = time(6);        %��ȡ��ǰ����
        %% ����ָ��λ��
        argHour = (hour + min / 60) * pi / 6; %����ʱ��Ļ���ֵ
        hHour = arrow(hAxes, pi/2 - argHour, 'cyan', 0.5); %����ʱ��
        argMin = (min + sec/60) * pi / 30;    %�������Ļ���ֵ
        hMin = arrow(hAxes, pi/2 - argMin, 'red', 0.8);    %���Ʒ���
        argSec = sec * pi / 30;               %��������Ļ���ֵ
        hSec = arrow(hAxes, pi/2 - argSec);   %��������
        %% ���´�����ʾ����ͣ1���ɾ��ָ��
        drawnow;
        pause(1);
        delete([hHour hMin hSec]);   %ɾ��3��ָ�룬�����´θ���ָ��
    end
catch
    disp('It''s closed.');
end

%% �Ӻ��������ڴ���ָ�������
function varargout = arrow(varargin)
%   ����3��line��������ָ��
%   ����������
%   �����������Ϊ��������h_axes������ֵang��ָ����ɫlinecolor��ָ�볤��length��
%                  ��ͷ����len2��ָ���߿�linewidth
%   ���ߣ��޻���
%   �汾��20101005 V1.0
switch nargin %��ʼ���������
    case 0,
        h_axes = gca;
        ang = 0;
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 1,
        h_axes = varargin{1};
        ang = 0;
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 2,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = 'b';
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 3,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = 1;
        len2 = 0.1;
        linewidth = 3;
    case 4,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = 0.1;
        linewidth = 3;
    case 5,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = varargin{5};
        linewidth = 3;
    case 6,
        h_axes = varargin{1};
        ang = varargin{2};
        lineColor = varargin{3};
        length = varargin{4};
        len2 = varargin{5};
        linewidth = varargin{6};
    otherwise
        error('So many input arguments!');
end

%% ���������
hg = hggroup('Parent', h_axes); 
%% ����ָ����
x = [0 length] * cos(ang);
y = [0 length] * sin(ang);
line(x, y, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% ����ָ���ͷ��һ����
ang1 = ang + pi / 6;
x1 = [x(2), x(2)-len2*cos(ang1)];
y1 = [y(2), y(2)-len2*sin(ang1)];
line(x1, y1, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% ����ָ���ͷ����һ����
ang2 = ang - pi / 6;
x2 = [x(2), x(2)-len2*cos(ang2)];
y2 = [y(2), y(2)-len2*sin(ang2)];
line(x2, y2, 'Parent', hg, 'LineWidth', linewidth, 'Color', lineColor);
%% �����������
if nargout == 1
    varargout{1} = hg;
elseif nargargout > 1
    error('So many output arguments!');
end
