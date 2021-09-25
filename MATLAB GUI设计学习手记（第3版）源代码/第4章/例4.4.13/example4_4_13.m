%% ͼ�����ݵĺ�����
t = 0 : 0.1 : 2*pi;
%% ������1��������
hAxes1 = subplot(221);
plot(sin(t));
set(hAxes1, 'tag', 'h1');
%% ������2��������
hAxes2 = subplot(222);
plot(cos(t));
set(hAxes2, 'tag', 'h2');
%% ������3��������
hAxes3 = subplot(223);
stem(sin(t));
set(hAxes3, 'tag', 'h3');
%% ������4��������
hAxes4 = subplot(224);
stem(cos(t));
set(hAxes4, 'tag', 'h4');
%% �����ļ�����Ի���
[fName, pName, index] = uiputfile({'*.bmp'; '*.jpg'}, 'ͼƬ���Ϊ', datestr(now, 30));
%% ��û�е����ȡ������ť��ֱ�ӹرնԻ��򣬱���ͼƬ
if index
    str = [pName fName];  %��ȡͼƬ��ȫ·��
    strBefore = str(1:end-4); %ȥ����׺������Ϊ����ͼƬ����
    strEx = str(end-3 : end); %��ȡͼƬ��׺
    hFigure = figure('visible', 'off'); %�������صĴ���
    if strcmp(strEx, '.bmp')  %������ΪBMPͼƬ
        for i = 1 : 4
            %% ��i��ͼƬ��ͼƬ��
            fullName = [strBefore '_' num2str(i) '.bmp'];
            %% ���������ᣬ������ʱ����Ҫ�����ͼ��
            hAxes = copyobj(findobj('tag', ['h' num2str(i)]), hFigure);          %�����������򿽱������ش���
            %% �������������ڣ��Ӷ�ͼ������ͼƬ
            set(hAxes, 'Units', 'normalized', 'Position', [0.1 0.1 0.8 0.8]); 
            %% ���ͼƬ
            print(hFigure, '-dbmp', fullName);       %�����ͼƬ
            %% ɾ����ʱ������
            delete(gca);
        end
    elseif strcmp(strEx, '.jpg')  %������ΪJPGͼƬ
        %% ע��ͬ�ϣ�ʡ��
        for i = 1 : 4
            fullName = [strBefore '_' num2str(i) '.jpg'];
            hAxes = copyobj(findobj('tag', ['h' num2str(i)]), hFigure);          %�����������򿽱������ش���
            set(hAxes, 'Units', 'normalized', 'Position', [0.1 0.1 0.8 0.8]); 
            print(hFigure, '-djpeg', fullName);         %�����ͼƬ
            delete(gca);
        end
    end
    delete(hFigure); %ɾ�����صĴ���
end
