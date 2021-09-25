function timeCompass()
%����compass��������ģ��ʱ��
%���ߣ��޻���
%�汾��20101005 V1.0
%% ���������ᣬ������ʾ����
hAxes = axes('visible', 'off', 'DrawMode', 'fast');

%% ���Ʊ������ĵ�
hAxesDot = axes('Visible', 'off', 'DrawMode', 'fast');
axis equal;
line(0, 0, 'Parent', hAxesDot, 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 15);

%% ѭ������ʱ��
try
    while(1)   %�°�MATLAB֧������д�����ɰ汾������while��1֮��Ӹ��ո�
        %% ��ȡ��ǰʱ��
        time = floor(clock);
        hour = time(4);
        min = time(5);
        sec = time(6);
        %% ���㵱ǰָ��Ļ���ֵ
        argHour = pi/2 - (hour + min / 60) * pi / 6; 
        argMin = pi/2 - (min + sec/60) * pi / 30;
        argSec = pi/2 - sec * pi / 30;
        %% ���ݼ���õ���ָ�뻡��ֵ���������̺�ָ��
        hCompass = compass(hAxes, [0.5*cos(argHour); 0.8*cos(argMin); cos(argSec)],...
            [0.5*sin(argHour); 0.8*sin(argMin); sin(argSec)]);
        set(hCompass, 'LineWidth', 3);
        set(hCompass(1), 'Color', 'r');
        set(hCompass(2), 'Color', 'g');
        delete(findall(hAxes, 'Type', 'text', '-or', 'linestyle', ':'));
        %% ���ƿ̶�
        ang = pi / 3;   %�̶�ֵ1����Ӧ�Ļ���ֵ
        for i = 1 : 12  %���ÿ���̶�ֵ
            if rem(i, 3)%�̶�ֵΪ3��6��9��12ʱ���ֺ�Ϊ12
                text(0.8*cos(ang), 0.8*sin(ang), num2str(i), 'horizontalAlignment',...
                    'center', 'FontSize', 12, 'Parent', hAxes);
            else        %�̶�ֵΪ3��6��9��12ʱ���ֺ�Ϊ20���Ӵ֣���ɫ
                text(0.7*cos(ang), 0.7*sin(ang), num2str(i), 'horizontalAlignment',...
                    'center', 'FontSize', 20, 'FontWeight', 'bold', 'Color', 'g',...
                    'Parent', hAxes);
            end
            ang = ang - pi / 6;  %ÿ����һ���̶�ֵ���͸��»���ֵ
        end
        %% �����̶���
        for i = 0 : 6 : 354   %iΪÿ���̶��ߵĽǶ�
            thelt = i * pi / 180; %�Ƕ�ת��Ϊ����ֵ
            if ~rem(i, 30)    %�̶���3��6��9��12Ҫ��Щ����ɫΪ��ɫ
                x = 0.9 : 0.01 : 1;%�̶��ߵĳ���Ϊ0.1
                line(x*cos(thelt), x*sin(thelt), 'Color', 'r', 'LineWidth', 3, 'Parent', hAxes);
            else               %�����̶���ҪϸЩ����ɫΪ��ɫ
                x = 0.95 : 0.01 : 1;%�̶��ߵĳ���Ϊ0.05
                line(x*cos(thelt), x*sin(thelt), 'Color', 'b', 'LineWidth', 1, 'Parent', hAxes);
            end
        end
        %% ���´�����ʾ���ӳ�1���ɾ��ָ�� 
        drawnow;
        pause(1);
        delete(allchild(hAxes)); %ɾ��compass���󣬷����´δ����µ�compass����
    end
catch
    disp('It''s closed.');
end
end
