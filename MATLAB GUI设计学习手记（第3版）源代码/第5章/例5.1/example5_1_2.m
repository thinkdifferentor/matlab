clear;
hWaitbar = waitbar(0, '请等待...', 'Name', '进度条', 'CreateCancelBtn',...
    'delete(hWaitbar);clear hWaitbar');  %创建进度为0的进度条
btnCancel = findall(hWaitbar, 'style', 'pushbutton');    %查找【取消】按钮
set(btnCancel, 'string', '取消', 'fontsize', 10);    %设置【取消】按钮的String为“取消”
try  %智能更新进度
    for i = 1 : 100
        waitbar(i/100, hWaitbar, ['进度完成' num2str(i) '%']);
        pause(0.1);           %每0.1秒完成1%的进度
    end
    delete(hWaitbar);     %进度达到100%后，关闭进度条
    clear hWaitbar;        %清除变量hWaitbar
end
