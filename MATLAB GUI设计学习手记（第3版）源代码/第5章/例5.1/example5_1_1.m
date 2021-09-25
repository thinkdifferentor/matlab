clear;  %清空基本工作空间的变量
isCanceled = false; %表征是否按下了【取消】按钮
hWaitbar = waitbar(0, '请等待...', 'Name', '进度条', 'CreateCancelBtn',...
    'isCanceled=true;');  %创建进度为0的进度条
btnCancel = findall(hWaitbar, 'style', 'pushbutton');    %查找【取消】按钮
set(btnCancel, 'string', '取消', 'fontsize', 10);    %设置【取消】按钮的String为“取消”
for i = 1 : 100    %循环更新进度显示
    waitbar(i/100, hWaitbar, ['进度完成' num2str(i) '%']);
    pause(0.1);    %每0.1秒完成1%的进度
    if isCanceled  %若按下了【取消】按钮，跳出循环
        break;
    end
end
%% 退出循环后，关闭进度条并清除进度条句柄变量
if ishandle(hWaitbar)  %或者if exist('hWaitbar', 'var')
    delete(hWaitbar); 
    clear hWaitbar;
end
