%��ֽƬ����
Num=19;

%ÿ����ֽƬ�Ĵ�С
Row=1980;
Colum=72;

%�ļ��е�ÿ��ͼƬ�����ؾ���
Image=cell(1,Num);

%ÿ��ͼƬ�����������ؾ���-��������
Dataleft=cell(1,Num);
Dataright=cell(1,Num);

%������ֽƬ��ԱȵĽ��-��������������
CountLeft=cell(Num,Num);
CountRight=cell(Num,Num);

%�ҶȻ�ͼƬ
Gray=cell(1,Num);

%�Ҷ�ͼƬ��ֵ����ֵ
Mythresh=zeros(1,Num);

for index=0:Num-1
    Image{index+1}=imread(['D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\��ҵ5\����1\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %����OTSU�㷨ȷ����ֵ����ֵ
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %��ͼ���ֵ��
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,Colum);
end


%��¼���������Ҳ��ֽ��
Left_max=0;
Right_max=0;

for i=1:Num
    
    %���������
    if(Dataleft{i}(1:end,1)==1)
        Left_max=i;
    end
    
    
    %�������Ҳ�
    if(Dataright{i}(1:end,1)==1)
       Right_max=i;
    end
    
end

for i=1:Num%��ǰֽ��
   
    %������ߵ�ֽ��
    for j=1:Num%Ҫ�Ƚϵ�ֽ��
       CountLeft{i,j}(1:end,1)=Dataleft{i}(1:end,1)-Dataright{j}(1:end,1); 
    end
    
    %�����ұߵ�ֽ��
    for j=1:Num%Ҫ�Ƚϵ�ֽ��
       CountRight{i,j}(1:end,1)=Dataright{i}(1:end,1)-Dataleft{j}(1:end,1); 
    end
    
end



%����ÿ������ֽƬ����������������0�ĸ���
Cntleft=zeros(Num,Num);
Cntright=zeros(Num,Num);

for i=1:Num%��ǰCount
   
    %������
   for j=1:Num
       for k=1:Row%ÿ�����صļ���
            if(CountLeft{i,j}(k,1)==0)
                Cntleft(i,j)=Cntleft(i,j)+1;
            end
       end
   end
   
   %�Ҳ����
   for j=1:Num
       for k=1:Row%ÿ�����صļ���
            if(CountRight{i,j}(k,1)==0)
                Cntright(i,j)=Cntright(i,j)+1;
            end
       end
   end
   
    
end


%�ҵ�����������ÿһ�������ֵ�Լ���Ӧ��index
Max_right=zeros(Num,1);
Index_right=zeros(Num,1);
Max_left=zeros(Num,1);
Index_left=zeros(Num,1);
   
for i=1:Num
      for j=1:Num
           
           %�����Ҳ���ƥ���
          if(Cntright(i,j)>Max_right(i,1))
                Max_right(i,1)=Cntright(i,j);
                Index_right(i,1)=j;
          end
          
          %���������ƥ���
          if(Cntleft(i,j)>Max_left(i,1))  
                Max_left(i,1)=Cntleft(i,j);
                Index_left(i,1)=j;
          end
          
      end
end
   
   
   
Sorted=zeros(1,Num);   
Sorted(1,1)=Left_max;
Sorted(1,Num)=Right_max;
tmp=Left_max;

%ƥ���������
for i=2:Num-1
    %�ҵ��ұߵ�ֽ��
    Sorted(1,i)=Index_right(tmp);
    tmp=Index_right(tmp);
end


%�ϳ�һ��ͼƬ
ImageSorted=cell(1,Num);
for i=1:Num
    ImageSorted{1,i}=Image{Sorted(1,i)};
end
      
%�ϳ�һ������
%Img=zeros(Row,Colum);
% for i=1:Num
%     Img=Img+ImageSorted{1,i};
% end
Img=cell2mat(ImageSorted);

%���ƥ����
imshow(Img);

%�����ļ�
imwrite(Img,'D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\��ҵ5\����1\Solution_Chinese.bmp','bmp');


