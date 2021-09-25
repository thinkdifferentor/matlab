% 读取模板数据进行画图

%载入图片像素矩阵
load Image

%更改显效果0-黑色 1-白色 反转
G2=zeros(256,256);
for i=1:256
   for j=1:256
       if(G(i,j)==0)
           G2(i,j)=1;
       else 
           G2(i,j)=0;
       end
   end
end


%显示模板图片
imshow(G2)

%保存文件
imwrite(G2,'D:\用户目录\我的文档\MATLAB\国赛\Photos.bmp','bmp');