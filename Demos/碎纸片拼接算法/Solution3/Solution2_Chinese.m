
% ��2�����ĳ�����룺 
function Solution2_Chinese
 clear
clc
%��Ƭ����
sum=209;
%ͼ����
%ȷ��������
%����ȫ255����
y=ones(180,1);
y=y.*255;
raw=0;
%���м�ֵ
temp=zeros(sum,1);
%��־
fw=0;
fb=0;
fg=0;
BW=ones(sum,2);
BW=BW.*(-1);
for i=1:sum
    if(i<11)
        F(:,:,i)=imread(['00',num2str(i-1),'.bmp']);
    elseif(i<101)
        F(:,:,i)=imread(['0',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread([num2str(i-1),'.bmp']);
    end
    %ȡ��β��
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    %ȡ��β��
    P(1,:,i)=F(1,:,i);
    P(2,:,i)=F(180,:,i);
    %����߽�հ׵���Ƭ����
    if(Q(:,1,i)==y)
        raw=raw+1;
        temp(raw)=i;
    end
    %��ȡ��Ƭ��White��blackֵ
    fw=0;
    fb=0;
    fg=0;         
    for j=1:180
        %ÿһ��
        fw=1;%�������Ϊ��
        for t=1:72            
            if(F(j,t,i)~=255)
                fw=0;%��ȫ��
                if(fb==0)
                    fb=1;
                    BW(i,1)=j;%����λ��
                end
            end
        end
        if(fw==1&&fg==0)%��ǰ��Ϊȫ����û���ҵ�ȫ�׵���
            BW(i,2)=j;
            fg=1;
        end
        if(fg==1&&fb==1)%�ҵ���
            break;
        end
    end  
    
end
%����:����
disp(BW);

        

i=2;
temp(1:raw)
while mod(sum,raw)~=0
    k=raw;
    l=1;
    del=zeros(raw,1);
    for j=1:k
        flag=0;
        for w=1:180
            if(F(w,i,temp(j))~=255)  
                flag=1;
                break;
            end
        end
        if(flag==1)
            raw=raw-1;
            del(l)=j;
            l=l+1;
        end
    end
    %ɾ����������������Ƭ
    l=1;
    while del(l)~=0
        temp(del(l))=[];
        del(l)=[];
        %temp(del(l))=[]���temp��Ų����ı�
        while del(l)~=0
            del(l)=del(l)-1;
            l=l+1;
        end
        l=1;
    end
    i=i+1;
end

temp(1:raw)
result=zeros(raw,sum/raw);
result(:,1)=temp(1:raw);

for line=1:11
    % ƥ�䣬������β�ķ���
     for i=1:18
         %�������,��Ϊ��Ԥ
         may=zeros(209,1);
         d=ones(209,1);
         d=d.*(-1);
         n=1;
         ew=0;%ȫ�ױ��
         if(ew==0)%��ȫ��
             for j=1:sum
                 fg=0;
                 for t=1:19
                     for tt=1:11
                        if(j==result(tt,t))
                            fg=1;
                        end
                    end
                 end
                 if(fg==0)%û�б�ѡ��
                     r=0;%��
                     for k=1:180
                         r=r+(double(Q(k,2,result(line,i)))-double(Q(k,1,j)))^2;
                     end
                     d(j)=sqrt(double(r));
                 end
             end
             %disp(d)
             %��С����
             for k=1:209
                 if(d(k)==(-1))
                     d(k)=max(d);
                 end
             end
             dmin=min(d);
            % disp(d)
             for k=1:209
                 if(d(k)==dmin)
                     result(line,i+1)=k;
                     %disp([num2str(k),'d']);
                 end
             end
         else%ȫ�ף���������ƴ����
             disp('����');
            break;
         end
         %�����Ψһʱ�˹���Ԥ
     end
 end
disp('�����Ƭ��ȷ���У�');
result
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end
 imshow(picture2)
 imwrite(picture2,'C:\Users\Administrator\Desktop\���E2.bmp','bmp');


end
