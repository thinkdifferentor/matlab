%--------------------------------------------------------------------------------------%
%本函数实现功能：输入图片所在的文件夹的基信息、图片格式，
%将读入所有此格式图片(要求读入图片像素一致)，存储数据为元包数组（cell），元包数组
%每一列为一个文件夹内的所有图片
%例如images=Imread('C:\Users\user\Desktop\毕业设计\人+车识别\人脸识别2\orl_faces\','*.pgm');
%--------------------------------------------------------------------------------------%
%dir()用于列出一个目录的内容信息，返回值为结构体数组类型，包含如下
%部分：name:文件或目录的名称；date:修改日期；bytes:文件大小；
%isdir:是否是目录。如Dir=dir('C:\Users\user\Desktop\face\');返回此路径下
%所有文件的信息，又如Dir=dir('C:\Users\user\Desktop\face\*.pgm');返回此
%路径下.pgm格式的文件信息。
function Image=Imreads2(filepath,type)    
FilDir=dir(filepath);   %FilDir为结构体
FilDir([1 2])=[];  %因为第一和第二个是‘.’‘..’文件，将其删除
for ii=1:length(FilDir)    
    ImDir{ii}=dir([[filepath,FilDir(ii).name],'\',type]);  %ImDir是一个结构体,里面的数据为字符型     
end   %ImDir{1}(3).name  对应s1文件夹内第3张图片的name信息
t=0;
for ii=1:length(ImDir)
    for jj=1:length(ImDir{ii})
        t=t+1;
        Image{t}=imread([[filepath,FilDir(ii).name],'\',ImDir{ii}(jj).name]);  %元包数组
    end       %每一列是一个人文件夹内的所有图片
end
end