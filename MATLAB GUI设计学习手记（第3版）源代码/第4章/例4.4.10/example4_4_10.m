%% ����Ϊ��������fork.m�����Ľű��ļ�
btndownCallback = ['if strcmp(get(gcbf, ''SelectionType''), ''normal''),',...  %�����������
                    'pos = get(gcbo, ''CurrentPoint'');',...                      %��ȡ������ĵ�����
                    'fork(pos(1, 1), pos(1, 2), gcbo);',...                        %�ڸõ������һ��С�棬����ʾС������
                    'elseif strcmp(get(gcbf, ''SelectionType''), ''alt''),',...%���������Ҽ�
                    'delete(findobj(gcbo, ''Type'', ''hggroup''));',...         %ɾ��С�����
                    'end'];  
%% ���������������С�漰�����ĵ����ꣻ�������Ҽ����������С��
axes('xlim', [0 100], 'ylim', [0 100], 'ButtonDownFcn', btndownCallback);
