str = urlread('http://www.baidu.com','Timeout',5,'Charset','gb2312'); %��ȡԴ��
pics = regexp(str,'http://[\w/.-]+\.((gif)|(jpg)|(png)|(bmp))','match');
for m = 1 : length(pics) %��һͼƬд�����
    urlwrite(pics{m}, ['baiduPic', num2str(m), pics{m}(end-3:end)]);    
end
