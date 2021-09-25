str = urlread('http://www.baidu.com','Timeout',5,'Charset','gb2312'); %获取源码
pics = regexp(str,'http://[\w/.-]+\.((gif)|(jpg)|(png)|(bmp))','match');
for m = 1 : length(pics) %逐一图片写入磁盘
    urlwrite(pics{m}, ['baiduPic', num2str(m), pics{m}(end-3:end)]);    
end
