h = uicontextmenu;                          %����һ��GUI���ں��Ҽ��˵�h
uimenu(h, 'label', 'a1');                     %�����˵���a1
uimenu(h, 'label', 'a2');                      %�����˵���b1
uimenu(h, 'label', 'a3');                      %�����˵���c1
set(gcf, 'uicontextmenu', h);              %����GUI���ڵ��Ҽ��˵�Ϊh
%���ɻص�����ִ���ַ�������ȡ��ǰ��������ĵ㣬�����Ҽ��˵���ʾ�ڸõ�
btn_callback = ['pos = get(gcbf, ''CurrentPoint'');',...
                'set(h, ''Position'', pos);',...
                'set(h, ''Visible'', ''on'');'];
%���ô��ڵ�WindowButtonDownFcn�ص�����
set(gcf, 'WindowButtonDownFcn', btn_callback);
