%��;������whileѭ��������ת��ת��
%���ߣ��޻��� 2013��3��9��
%�汾��V1.1

%����Բ�ε�Բ�ĺͰ뾶�����εĻ���
r0 = [3,3];		%Բ��
radius = 2;		%�뾶
radian = 2*pi/3;	%���λ���ֵ
rad0 = 0;		%���γ�ʼ���ǣ���ת�Ļ�׼����
%��������
hFig = figure('Name','��ת������BY�޻���V1.1', 'visible', 'off');
%����������
hAxes = axes('parent', hFig,...
    'DrawMode', 'fast',...
    'box', 'on',...
    'xticklabel', '',...
    'yticklabel', '',...
    'XTick', [],...
    'YTick', []);
%������ȱ���
axis equal;
%����3������
hp1 = patch('faceColor','r','parent',hAxes);
hp2 = patch('faceColor','y','parent',hAxes);
hp3 = patch('faceColor','b','parent',hAxes);
%��ʾ����
set(hFig, 'visible', 'on');
%����whileѭ�������Ρ�ת������
while(ishandle(hAxes))
    %���»�ȡ����ֵ
    t0 = (rad0:0.1:rad0+radian+0.1);
    t1 = t0+2*pi/3;
    t2 = t1+2*pi/3;
    %��ȡ���λ�������
    x0 = r0(1)+radius*cos(t0);
    y0 = r0(2)+radius*sin(t0);
    x1 = r0(1)+radius*cos(t1);
    y1 = r0(2)+radius*sin(t1);
    x2 = r0(1)+radius*cos(t2);
    y2 = r0(2)+radius*sin(t2);
     %��������patch����
    set(hp1,'xdata',[r0(1),x0],'ydata',[r0(2),y0]);
    set(hp2,'xdata',[r0(1),x1],'ydata',[r0(2),y1]);
    set(hp3,'xdata',[r0(1),x2],'ydata',[r0(2),y2]);
    %��ͣ0.05��
    pause(0.05);
    %����˳ʱ��ת0.1����
    rad0 = rad0+0.1;
end
