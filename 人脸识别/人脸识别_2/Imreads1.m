%--------------------------------------------------------------------------------------%
%本函数实现功能：输入图片所在文件夹路径信息、图片格式，
%将读入所有此格式图片(要求读入图片像素一致)，存储数据为元包数组（cell）
%例如images=Imread('C:\Users\user\Desktop\face\','*.jpg');
%--------------------------------------------------------------------------------------%
%dir()用于列出一个目录的内容信息，返回值为结构体数组类型，包含如下
%部分：name:文件或目录的名称；date:修改日期；bytes:文件大小；
%isdir:是否是目录。如Dir=dir('C:\Users\user\Desktop\face\');返回此路径下
%所有文件的信息，又如Dir=dir('C:\Users\user\Desktop\face\*.pgm');返回此
%路径下.pgm格式的文件信息。
function Image=Imreads1(imgpath,type)    
Dir=dir([imgpath,type]);  %Dir是一个结构体,里面的数据为字符型
for ii=1:length(Dir)
image=imread([imgpath,Dir(ii).name]);    
Image{ii}=image;  %读入元包数组
end
end