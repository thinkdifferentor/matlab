% ��3�ʳ�����룺180*72
clear,clc

% ��ֽƬ��Ŀ���±���㿪ʼ��
Num=209;


% ��ֽƬ����
for i=1:2:Num*2
    
    %����a�� ż��b��
    if(ceil(i/2)<11) %ͼƬ�����±���㿪ʼ ceil�����������ǳ��������ȡ��->��һ��
        F(:,:,i)=imread(['����5\00',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['����5\00',num2str(ceil(i/2)-1),'b','.bmp']);
    elseif(ceil(i/2)<101)
        F(:,:,i)=imread(['����5\0',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['����5\0',num2str(ceil(i/2)-1),'b','.bmp']);
    else
        F(:,:,i)=imread(['����5\',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['����5\',num2str(ceil(i/2)-1),'b','.bmp']);
    end
    
end

%%
%�հ����ضԱȾ���
y=ones(180,1).*255;

%�������ȫ��ֽƬ��λ��
Index=zeros(Num,1);

%���ȫ��ֽƬ����
Cnt=0;

%�ҳ����ȫ��ֽƬ
for i=1:Num*2
    
    %��β����������
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    
    %�����հ׵���Ƭ����
    if(Q(:,1,i)==y)%��ɫ��Ӧ����ֵΪ255
        Cnt=Cnt+1;
        Index(Cnt)=i;
    end
end

Index(1:Cnt);
Cnt;

%���������о���
result=zeros(22,19);



%ֽƬ���ȫ�׵ķ��ڽ�����е������
for i=1:22
    result(i)=Index(i);
end



%% �����㷨
for j=1:22
    for t=1:18    
        d=ones(Num*2,1);
        d=d.*(-1);
        for i=1:Num*2
            flag=0;
            for m=1:19
                if(i==result(j,m))
                    flag=1;
                    break
                end
            end
            if(flag==0)
                r=0;%��
                for k=1:180
                    r=r+(double(Q(k,2,result(j,t)))-double(Q(k,1,i)))^2;
                end
                d(i)=sqrt(double(r));
            end
        end
        dmax=max(d);
        for i=1:Num*2
            if(d(i)==(-1))
                d(i)=dmax;
            end
        end
        dmin=min(d);
        for i=1:Num*2
            if(d(i)==dmin)
                result(j,t+1)=i;
                break;
            end
        end
    end
end
result;



%% ֽƬƴ��
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'����5\3_1.bmp','bmp');

picture2=[];
for j=1:19
    picture1=[];
    for i=12:22
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'����5\3_2.bmp','bmp');