clear,clc

% ��ֽƬ����Ŀ
Num=19;


%ÿ����ֽƬ�Ĵ�С
Row=1980;
Colum=72;

%ͼ����
for i=1:Num
    if(i<11)
        F(:,:,i)=imread(['����1\00',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['����1\0',num2str(i-1),'.bmp']);
    end
    
    %��ֵ��
    B(:,:,i)=im2bw(F(:,:,i),250/255);
    
    %�ֱ�ȥ��ֽƬ���������˵�����
    Q(:,1,i)=B(:,1,i);          %���
    Q(:,2,i)=B(:,Colum,i);      %�Ҷ�
end

%����������
result=zeros(Num,1);

%������--�������ֵȫΪ1
y=ones(Row,1);
for i=1:Num
    if(Q(:,1,i)==y)
        result(1)=i;%��¼���
    end
end


%��β��-�Ҷ˶�����ֵȫΪ1
for i=1:Num
    if(Q(:,2,i)==y)
        result(Num)=i;%��¼���
    end
end


% �м�(17��)ƥ�䣬������β�ķ���
 for i=1:Num-2 %��ǰֽ��
     
     %����������鲢��ʼ��Ϊ-1
     d=ones(Num,1);
     d=d.*(-1);
     
     %�������
     for j=1:Num%�Ա�ֽ��
         
         fg=0;
         %��ǰ��ֽƬ�����Լ��������
         for t=1:Num
            if(j==result(t))
                fg=1;
            end
         end
         
         %�����Լ�
         if(fg==0)
             %���һ��ֽ��
             if(i==17)
                result(i+1)=j;
                break;
             end
             
             %��ǰֽ�����Ҳ��������ݼ��Ա�ֽ��������������ݲ�ȡ��ŷ�Ͼ���
             r=0;
             for k=1:Row
                 r=r+(double(Q(k,2,result(i)))-double(Q(k,1,j)))^2;
             end
             d(j)=sqrt(double(r));
         end
     end
     
     
     %�õ�һ��ŷ�Ͼ�����в�������
     if(i~=17)
         %���뵱ǰֽ�������Զ�ķŵ�û�б����ù���λ��
         dmax=max(d);
         for k=1:Num
             if(d(k)==(-1))
                 d(k)=dmax;
             end
         end
         
         %���뵱ǰֽ���������ķŵ���ǰֽ������һ��λ��
         dmin=min(d);
         for k=1:Num
             if(d(k)==dmin)
                 result(i+1)=k;
                 break;
             end
         end
         
     end
 end


%���ͼƬ�ı������ʾ
picture=[];

for i=1:Num
    picture=[picture,F(:,:,result(i))];
end

imshow(picture)

imwrite(picture,'����1\1-1.bmp','bmp');