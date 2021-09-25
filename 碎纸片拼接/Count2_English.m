% =========================�����ݺ���Ӣ����ֽƬƴ��=========================

%��ֽƬ����
Num=209;

%ÿ����ֽƬ�Ĵ�С
Row=180;
Colum=72;

%�ļ��е�ÿ��ͼƬ�����ؾ���
Image=cell(1,Num);

%ÿ��ͼƬ�����������ؾ���-��������
Dataleft=cell(1,Num);
Dataright=cell(1,Num);
Dataup=cell(1,Num);
Datadown=cell(1,Num);

%������ֽƬ��ԱȵĽ��-��������������
CountLeft=cell(Num,Num);
CountRight=cell(Num,Num);
CountUp=cell(Num,Num);
CountDown=cell(Num,Num);

%�ҶȻ�ͼƬ
Gray=cell(1,Num);

%�Ҷ�ͼƬ��ֵ����ֵ
Mythresh=zeros(1,Num);


for index=0:Num-1
    Image{index+1}=imread(['D:\�û�Ŀ¼\�ҵ��ĵ�\MATLAB\��ҵ5\����4\',sprintf('%03d',index),'.bmp'],'bmp');
    Mythresh(1,index+1) = OTSU(Image{index+1}); %����OTSU�㷨ȷ����ֵ����ֵ
    Gray{index+1} = im2bw(Image{index+1},Mythresh(1,index+1)); %��ͼ���ֵ��
    Dataleft{index+1}=Gray{index+1}(1:end,1);
    Dataright{index+1}=Gray{index+1}(1:end,Colum);
    Dataup{index+1}=Gray{index+1}(1,1:end);
    Datadown{index+1}=Gray{index+1}(Row,1:end);
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
    
    %�����Ϸ���ֽ��
    for j=1:Num%Ҫ�Ƚϵ�ֽ��
       CountUp{i,j}(1,1:end)=Dataup{i}(1,1:end)-Datadown{j}(1,1:end); 
    end
    
    %�����·���ֽ��
    for j=1:Num%Ҫ�Ƚϵ�ֽ��
       CountDown{i,j}(1,1:end)=Datadown{i}(1,1:end)-Dataup{j}(1,1:end); 
    end
    
end

%����ÿ������ֽƬ����������������0�ĸ���
Cntleft=zeros(Num,Num);
Cntright=zeros(Num,Num);
Cntup=zeros(Num,Num);
Cntdown=zeros(Num,Num);

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
   
   %�Ϸ�����
   for j=1:Num
       for k=1:Colum%ÿ�����صļ���
            if(CountUp{i,j}(1,k)==0)
                Cntup(i,j)=Cntup(i,j)+1;
            end
       end
   end
   
   %�·�����
   for j=1:Num
       for k=1:Colum%ÿ�����صļ���
            if(CountDown{i,j}(1,k)==0)
                Cntdown(i,j)=Cntdown(i,j)+1;
            end
       end
   end
end


%�ҵ�����������ÿһ�������ֵ�Լ���Ӧ��index
   Max_right=zeros(Num,1);
   Index_right=zeros(Num,1);
   Max_left=zeros(Num,1);
   Index_left=zeros(Num,1);
   Max_up=zeros(Num,1);
   Index_up=zeros(Num,1);
   Max_down=zeros(Num,1);
   Index_down=zeros(Num,1);
   
   
   
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
          
          %�����Ϸ���ƥ���
          if(Cntup(i,j)>Max_up(i,1))  
                Max_up(i,1)=Cntup(i,j);
                Index_up(i,1)=j;
          end
          
          %�����·���ƥ���
          if(Cntdown(i,j)>Max_down(i,1))  
                Max_down(i,1)=Cntdown(i,j);
                Index_down(i,1)=j;
          end
          
      end
   end
   
   
   
   

