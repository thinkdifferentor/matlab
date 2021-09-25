function timeCompass()
%采用compass对象制作模拟时钟
%作者：罗华飞
%版本：20101005 V1.0
%% 创建坐标轴，用于显示表盘
hAxes = axes('visible', 'off', 'DrawMode', 'fast');

%% 绘制表盘中心点
hAxesDot = axes('Visible', 'off', 'DrawMode', 'fast');
axis equal;
line(0, 0, 'Parent', hAxesDot, 'Marker', 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 15);

%% 循环更新时间
try
    while(1)   %新版MATLAB支持这种写法，旧版本建议在while和1之间加个空格
        %% 获取当前时间
        time = floor(clock);
        hour = time(4);
        min = time(5);
        sec = time(6);
        %% 计算当前指针的弧度值
        argHour = pi/2 - (hour + min / 60) * pi / 6; 
        argMin = pi/2 - (min + sec/60) * pi / 30;
        argSec = pi/2 - sec * pi / 30;
        %% 根据计算得到的指针弧度值，创建表盘和指针
        hCompass = compass(hAxes, [0.5*cos(argHour); 0.8*cos(argMin); cos(argSec)],...
            [0.5*sin(argHour); 0.8*sin(argMin); sin(argSec)]);
        set(hCompass, 'LineWidth', 3);
        set(hCompass(1), 'Color', 'r');
        set(hCompass(2), 'Color', 'g');
        delete(findall(hAxes, 'Type', 'text', '-or', 'linestyle', ':'));
        %% 绘制刻度
        ang = pi / 3;   %刻度值1所对应的弧度值
        for i = 1 : 12  %穷举每个刻度值
            if rem(i, 3)%刻度值为3、6、9、12时，字号为12
                text(0.8*cos(ang), 0.8*sin(ang), num2str(i), 'horizontalAlignment',...
                    'center', 'FontSize', 12, 'Parent', hAxes);
            else        %刻度值为3、6、9、12时，字号为20，加粗，绿色
                text(0.7*cos(ang), 0.7*sin(ang), num2str(i), 'horizontalAlignment',...
                    'center', 'FontSize', 20, 'FontWeight', 'bold', 'Color', 'g',...
                    'Parent', hAxes);
            end
            ang = ang - pi / 6;  %每绘制一个刻度值，就更新弧度值
        end
        %% 创建刻度线
        for i = 0 : 6 : 354   %i为每个刻度线的角度
            thelt = i * pi / 180; %角度转化为弧度值
            if ~rem(i, 30)    %刻度线3、6、9、12要粗些，颜色为红色
                x = 0.9 : 0.01 : 1;%刻度线的长度为0.1
                line(x*cos(thelt), x*sin(thelt), 'Color', 'r', 'LineWidth', 3, 'Parent', hAxes);
            else               %其它刻度线要细些，颜色为蓝色
                x = 0.95 : 0.01 : 1;%刻度线的长度为0.05
                line(x*cos(thelt), x*sin(thelt), 'Color', 'b', 'LineWidth', 1, 'Parent', hAxes);
            end
        end
        %% 更新窗口显示，延迟1秒后，删除指针 
        drawnow;
        pause(1);
        delete(allchild(hAxes)); %删除compass对象，方便下次创建新的compass对象
    end
catch
    disp('It''s closed.');
end
end
