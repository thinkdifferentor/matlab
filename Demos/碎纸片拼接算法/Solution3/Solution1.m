% ��1�ʳ�����룺
function Solution1

clear
clc

%ͼ����
for i=1:19
    if(i<11)
        F(:,:,i)=imread(['00',num2str(i-1),'.bmp']);
    else
        F(:,:,i)=imread(['0',num2str(i-1),'.bmp']);
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

disp('�����Ƭ��ȷ���У�');
result

%ͼƬ�ı������ʾ
picture=[];
for i=1:19
    picture=[picture,F(:,:,result(i))];
end
imshow(picture);
imwrite(picture,'C:\Users\Administrator\Desktop\���111.bmp','bmp');


end
