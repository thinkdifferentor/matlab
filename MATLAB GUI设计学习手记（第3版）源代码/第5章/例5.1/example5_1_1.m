clear;  %��ջ��������ռ�ı���
isCanceled = false; %�����Ƿ����ˡ�ȡ������ť
hWaitbar = waitbar(0, '��ȴ�...', 'Name', '������', 'CreateCancelBtn',...
    'isCanceled=true;');  %��������Ϊ0�Ľ�����
btnCancel = findall(hWaitbar, 'style', 'pushbutton');    %���ҡ�ȡ������ť
set(btnCancel, 'string', 'ȡ��', 'fontsize', 10);    %���á�ȡ������ť��StringΪ��ȡ����
for i = 1 : 100    %ѭ�����½�����ʾ
    waitbar(i/100, hWaitbar, ['�������' num2str(i) '%']);
    pause(0.1);    %ÿ0.1�����1%�Ľ���
    if isCanceled  %�������ˡ�ȡ������ť������ѭ��
        break;
    end
end
%% �˳�ѭ���󣬹رս�����������������������
if ishandle(hWaitbar)  %����if exist('hWaitbar', 'var')
    delete(hWaitbar); 
    clear hWaitbar;
end
