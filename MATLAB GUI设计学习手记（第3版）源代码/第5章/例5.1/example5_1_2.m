clear;
hWaitbar = waitbar(0, '��ȴ�...', 'Name', '������', 'CreateCancelBtn',...
    'delete(hWaitbar);clear hWaitbar');  %��������Ϊ0�Ľ�����
btnCancel = findall(hWaitbar, 'style', 'pushbutton');    %���ҡ�ȡ������ť
set(btnCancel, 'string', 'ȡ��', 'fontsize', 10);    %���á�ȡ������ť��StringΪ��ȡ����
try  %���ܸ��½���
    for i = 1 : 100
        waitbar(i/100, hWaitbar, ['�������' num2str(i) '%']);
        pause(0.1);           %ÿ0.1�����1%�Ľ���
    end
    delete(hWaitbar);     %���ȴﵽ100%�󣬹رս�����
    clear hWaitbar;        %�������hWaitbar
end
