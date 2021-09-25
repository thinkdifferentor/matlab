% ��1�ʳ�����룺
clear
clc

%ͼ����
for i=1:19
    if(i<11)
        F(:,:,i)=imread(['����1\00',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['����1\0',num2str(i-1),'.bmp']);
    end
    %��ֵ��
    B(:,:,i)=im2bw(F(:,:,i),250/255);
    %ȡ��λ��
    Q(:,1,i)=B(:,1,i);
    Q(:,2,i)=B(:,72,i);
end
%���
result=zeros(19,1);

%����ȫ255����
y=ones(1980,1);
%y=y.*255;

%������
% Q(:,1,i)==y
for i=1:19
    if(Q(:,1,i)==y)
        result(1)=i;%��¼���
    end
end


%��β��
for i=1:19
    if(Q(:,2,i)==y)
        result(19)=i;%��¼���
    end
end


% �м�(17��)ƥ�䣬������β�ķ���
 for i=1:17
     %�������,��Ϊ��Ԥ
%      may=zeros(19,1);
%      n=1;
     d=ones(19,1);
     d=d.*(-1);
     for j=1:19
         fg=0;
         for t=1:19
            if(j==result(t))
                fg=1;
            end
         end
         if(fg==0)
             if(i==17)
                result(i+1)=j;
                break;
             end
             r=0;%��
             for k=1:1980
                 r=r+(double(Q(k,2,result(i)))-double(Q(k,1,j)))^2;
             end
	  %ŷ�Ͼ���
             d(j)=sqrt(double(r));
         end
     end
     %��С����
     if(i~=17)
         dmax=max(d);
         for k=1:19
             if(d(k)==(-1))
                 d(k)=dmax;
             end
         end
         dmin=min(d);
         for k=1:19
             if(d(k)==dmin)
                 result(i+1)=k;
                 break;
             end
         end
     end
 end

 
% ƴ���������
% disp('�����Ƭ��ȷ���У�');
% result;

%ͼƬ�ı������ʾ
picture=[];
for i=1:19
    picture=[picture,F(:,:,result(i))];
end
imshow(picture)

imwrite(picture,'����1\1-1.bmp','bmp');




































% ��2�����ĳ�����룺 
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







% ��2��Ӣ�ĳ�����룺
clear
clc
%��Ƭ����
num=209;
%ͼ����
%ȷ��������
%����ȫ255����
y=ones(180,1);
y=y.*255;
raw=0;
%���м�ֵ
temp=zeros(num,1);
%��־
fw=0;
fb=0;
fg=0;
k=0;
m=0;

BW=ones(num,2);
BW=BW.*(-1);
A=0;
B=0;
for i=1:num
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
    fw=0;
    fb=0;
    fg=0;
    flag=0;
    count=0;
    flag=0;
    for j=1:180
        %ÿһ��
        fw=0;
        count=0;
        for t=1:72            
            if(F(j,t,i)~=255)
                count=count+1;
            end
        end
        if((count/72)>0.4&&flag==0)
            flag=1;%�����˴������ɫ������
        end
        if((count/72)<0.2&&flag==1)
            fw=1;%�Ѿ������������ɫ�����ҳ���������
        end
        if(fw==1&&fg==0)%��ǰ��Ϊȫ����û���ҵ�ȫ�׵���
            fb=1;
            BW(i,1)=j-1;%����λ��                
%             BW(i,2)=j;
            fg=1;
        end
        if(fg==1&&fb==1)%�ҵ���
            break;
        end
    end 
end
for i=1:num
    if(BW(i,1)==(-1))
        BW(i,1)=input('���������꣺');
    end
    i
    BW(i,1)
end
abs(BW(20,1)-BW(201,1))
i=2;
temp(1:raw)

while mod(num,raw)~=0
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
result=zeros(raw,num/raw);
result(:,1)=temp(1:raw);
result
%��ÿ�н�����ֵͬ,
for i=1:11
    t=0;
    for j=1:num
        if(j~=(i-1)*19+1)%����C(j)==C((i-1)*19+1)&&
            
            if(abs(BW(j,1)-BW(result(i,1),1))<4)%ͬA�Ҿ������
                t=t+1;
                result(i,t+1)=j;
                if(t==18)%��
                    break;
                end
            end
        end
    end
end
result

Z=ones(180,72);
Z=Z.*240;
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        if(result(i,j)==0)
            picture1=[picture1',Z(:,:)']; 
            picture1=picture1';
            continue;
        end
        picture1=[picture1',F(:,:,result(i,j))'];
        picture1=picture1';
    end
    picture2=[picture2,picture1];
end
% imshow(picture2)  

%���ս��
lresult=zeros(11,19);
% ����������ͬ������ƥ��:��
for i=1:11
    %����
    lresult(i,1)=result(i,1);
    for j=1:18%ƥ��18��
        if(result(i,j+1)==0)
%             i,j
            break;
        elseif(j<18&&result(i,j+2)==0)
            disp('dd')
            for t=1:j+1
                flag=1;
                for k=1:j+1
                    if(result(i,t)==lresult(i,k))
                        flag=0;
                        
                        break;
                    end
                end
                if(flag==1)
                        lresult(i,j+1)=result(i,t);
                        break;
                end
            end
            if(flag==1)
                continue;
            end
        end
        d=zeros(19,1);
        for k=1:19%��k���j���ƽ������
            %lresultÿ�����е��ų�
            flag=1;
            for t=1:19
                if(result(i,k)==lresult(i,t))
                    flag=0;
                end
            end
            
            if(flag==1)%��δ��ƥ�����Ƭ��ɸѡ
%                 disp('dd')
                R=Q(:,2,lresult(i,j))-Q(:,1,result(i,k));
                d(k)=sum(abs(R(:)))/180;
                if(d(k)==0)
                    d(k)=(-1);
                end
            end
        end
        dmax=max(d);
        for t=1:19
            if(d(t)==0)
                d(t)=dmax;
            elseif(d(t)==(-1))
                d(t)=0;
            end
        end
        dmin=min(d);
        for t=1:19
            if(d(t)==dmin)
                lresult(i,j+1)=result(i,t);
                break;
            end
        end
    end
end

for i=1:11
    lresult(i,:)
    for j=1:19
        if(lresult(i,j)~=0)
            disp(BW(lresult(i,j),1))
        else
            disp('0');
        end
    end
end

%��������ƥ��
picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        if(lresult(i,j)==0)
            picture1=[picture1',Z(:,:)']; 
            picture1=picture1';
            continue;
        end
        picture1=[picture1',F(:,:,lresult(i,j))'];
        picture1=picture1';
    end
    picture2=[picture2,picture1];
end
imshow(picture2) 
imwrite(picture2,'C:\Users\Administrator\Desktop\���EE21.bmp','bmp');


















% ��3�ʳ�����룺
clear
clc
num=209
raw=0;
temp=zeros(num,1);
y=ones(180,1);
y=y.*255;
for i=1:2:num*2
    %����aż��b
    if(ceil(i/2)<11)
        F(:,:,i)=imread(['00',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['00',num2str(ceil(i/2)-1),'b','.bmp']);
    elseif(ceil(i/2)<101)
        F(:,:,i)=imread(['0',num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread(['0',num2str(ceil(i/2)-1),'b','.bmp']);
    else
        F(:,:,i)=imread([num2str(ceil(i/2)-1),'a','.bmp']);
        F(:,:,i+1)=imread([num2str(ceil(i/2)-1),'b','.bmp']);
    end
end
for i=1:num*2
    %��β��
    Q(:,1,i)=F(:,1,i);
    Q(:,2,i)=F(:,72,i);
    %����߽�հ׵���Ƭ����
    if(Q(:,1,i)==y)
        raw=raw+1;
        temp(raw)=i;
    end
end
temp(1:raw)
raw
result=zeros(22,19);
for i=1:22
    result(i)=temp(i);
end
for j=1:22
    for t=1:18    
        d=ones(num*2,1);
        d=d.*(-1);
        for i=1:num*2
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
        for i=1:num*2
            if(d(i)==(-1))
                d(i)=dmax;
            end
        end
        dmin=min(d);
        for i=1:num*2
            if(d(i)==dmin)
                result(j,t+1)=i;
                break;
            end
        end
    end
end
result;

picture2=[];
for j=1:19
    picture1=[];
    for i=1:11
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'C:\Users\Administrator\Desktop\���E31.bmp','bmp');
picture2=[];

for j=1:19
    picture1=[];
    for i=12:22
        picture1=[picture1;F(:,:,result(i,j))];
    end
    picture2=[picture2,picture1];
end

imshow(picture2)
imwrite(picture2,'C:\Users\Administrator\Desktop\���E32.bmp','bmp');

        
