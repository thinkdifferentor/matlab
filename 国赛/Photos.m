% ��ȡģ�����ݽ��л�ͼ

%����ͼƬ���ؾ���
load Image

%������Ч��0-��ɫ 1-��ɫ ��ת
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


%��ʾģ��ͼƬ
imshow(G2)

%�����ļ�
imwrite(G2,'D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\����\Photos.bmp','bmp');