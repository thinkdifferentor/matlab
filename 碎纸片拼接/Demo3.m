% https://wenku.baidu.com/view/c975a832561252d380eb6ef1.html?from=search
%����һ�ĳ���ʹ��ʱ�뽫ͼƬ�ļ�����D��Ŀ¼���ļ������D��Ŀ¼ 

f1=imread('D:/000.bmp'); f2=imread('D:/001.bmp'); f3=imread('D:/002.bmp'); f4=imread('D:/003.bmp'); 
f5=imread('D:/004.bmp'); f6=imread('D:/005.bmp'); f7=imread('D:/006.bmp'); f8=imread('D:/007.bmp'); 
f9=imread('D:/008.bmp'); f10=imread('D:/009.bmp'); f11=imread('D:/010.bmp'); f12=imread('D:/011.bmp');
f13=imread('D:/012.bmp'); f14=imread('D:/013.bmp'); f15=imread('D:/014.bmp'); f16=imread('D:/015.bmp'); 
f17=imread('D:/016.bmp'); f18=imread('D:/017.bmp'); f19=imread('D:/018.bmp'); 


f1=[f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 ]; 
f1=im2double(f1); 
index1=1:72:1368; 
index2=72:72:1368; 
dang=(find(sum(f1(:,index1))==1980));%�ҳ�����ߵĵ�һ�� 
f0=f1(:,index1(dang):index2(dang)); 
for i=1:18 
    nextt=fun1_1(f1,dang,index1,index2);%����ŷʽ����     
    ftemp=f1(:,index1(nextt):index2(nextt));     
    f0=[f0,ftemp];     
    dang=nextt; 
end 

imwrite(f0,'D:/jp1.bmp')

%fun1_1 
%�������ĺ��� 
function next=fun1_1(f,dang,index1,index2) 
    a=f(:,index2(dang))*ones(1,(length(index2)));     
    b=f(:,index1);     
    chabie=(a-b).^2; 
    next=find(sum(chabie)==min(sum(chabie)))

    
    
    
    
    

%����2����һ�� 
%��ÿ��ֽ���У������������ƴ�ӣ��뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�� 
file=dir('C:\MATLAB\work\*.bmp');   %�������� 
paper1=[]; 
for i=1:length(file)            %��ÿ��ͼƬ���ݶ��빤���ռ� 
filename=file(i).name; 
f_temp=imread(filename); 
paper1=[paper1,f_temp]; 
end 

paper1=im2double(paper1);          %��ͼƬ��������ʽunit8��ת��Ϊdouble�� 
index1=1:72:(72*length(file));  %ȷ��ÿ��ͼƬ�Ŀ�ʼ�� 
index2=72:72:(72*length(file));  %ȷ��ÿ��ͼƬ�Ľ����� 
right_white=(find(sum(paper1(:,index2))>175));  %�ҳ�����ͼƬ���ұ�Ե�ӽ���ɫ�� 
note=[];        %����һ����Ǳ���������Ѿ�ƴ�ӹ��ı��� 
for j=1:length(right_white)   %���ұ�Ե�ӽ���ɫ�����ν���ƴ�� 
    Current=right_white(j)        %��⵱ǰͼƬ�Ƿ�ƴ�ӹ������Ѿ�ƴ�ӣ������ѭ��     
    if (length((find(note==Current))))           
        yy=0         
        continue;     
    end 
    note=[note,Current];  %��¼�Ѿ�ƴ�ӵ� 
    paper0=paper1(:,index1(Current):index2(Current));     
    filename=file(Current).name;     
    ccc=findstr(filename,'.bmp');     
    filename(ccc:(ccc+3))=[]; 
    label=str2num(filename);%�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ��� 
    for i=1:18  %���ƴ18�� 
    next=fun2_3(paper1,Current,index1,index2); %fun2_3������������Ѱ�ҵ�ǰͼƬ����һ��ͼƬ  
    ftemp=paper1(:,index1(next):index2(next));     
    Current=next; 
    if length(Current)<2    %������ص���һ��ͼƬ���������ϣ�����ֹѭ��������         
        Current=next;         
    else 
        break;     
    end 
    if (length((find(note==Current))))  %�����һ��ͼƬ�Ѿ�ƴ����������ѭ��         
        break;     
    end 
    note=[note,Current];     
    paper0=[ftemp,paper0]; 
    filename=file(Current).name;     
    ccc=findstr(filename,'.bmp');     
    filename(ccc:(ccc+3))=[]; 
     %�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ���     label=[str2num(filename),label]; end 
if length(label)==0     
    continue 
end 
image_name=strcat(num2str(label),'.bmp'); 
imwrite(paper0,image_name) 
end  
 
%��������õĴ�������ƴ�Ӻ��� 
function next=fun2_3(f,dang,index1,index2) %���ҵ��� 
    a1=f(:,index1(dang))*ones(1,(length(index1)));     
    b=f(:,index2); 
    chabie1=(a1-b).^2; 
    next=find(sum(chabie1)==min(sum(chabie1))); 
    

    
%����2����2���뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�У�
%ƴ��ʣ����ֽƬ�ĳ��򣬱������������ͬʱ����ƴ�� 
file=dir('C:\MATLAB\work\*.bmp'); paper1=[];  %���ݵĶ�ȡ 
for i=1:length(file) 
    filename=file(i).name;     
    f_temp=imread(filename);     
    paper1=[paper1,f_temp]; 
end 

paper1=im2double(paper1); %����ת��Ϊ˫������ 
index1=1:72:(72*length(file)); %ȷ��ÿ��ͼƬ�Ŀ�ʼ�� 
index2=72:72:(72*length(file)); %ȷ��ÿ��ͼƬ�Ľ����� 
candidat=1:length(file);  
note=[];      %��¼�Ѿ�ƴ�ӵ� 
for j=1:length(candidat) 
    paper0=[]; 
    Current=candidat(j); 
    if (length((find(note==Current))))         
        yy=0;         
        continue;     
    end 
    note=[note,Current];%��¼�Ѿ�ƴ���� 
    paper0=paper1(:,index1(Current):index2(Current));    
    label=[];   
    filename=file(Current).name;    
    ccc=findstr(filename,'.bmp');   
    filename(ccc:(ccc+3))=[]; 
    label=str2num(filename)%�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ��� 
    for i=1:8 
    %fun_unique������������Ѱ�ҵ�ǰͼƬ����һ��ͼƬ,ͬʱ��������Ѱ��     
    [nextt,x1]=fun2_unique(paper0,paper1,Current,index1,index2);     
    ftemp=paper1(:,index1(nextt):index2(nextt));    
    Current=nextt; 
    if length(Current)<2 %������ص���һ��ͼƬ���������ϣ�����ֹѭ��������         
        Current=nextt;         
    else 
        break;     
    end 
    if (length((find(note==Current))))%�����һ��ͼƬ�Ѿ�ƴ����������ѭ��         
        yy=0;        
        break;
    end 
    note=[note,Current];     
    if x1==1 
        paper0=[paper0,ftemp]; 
        filename=file(Current).name;         
        ccc=findstr(filename,'.bmp');     
        filename(ccc:(ccc+3))=[]; 
        label=[label,str2num(filename)];  
    else 
        paper0=[ftemp,paper0]; 
        filename=file(Current).name;         
        ccc=findstr(filename,'.bmp');     
        filename(ccc:(ccc+3))=[]; 
        %�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ���
    label=[str2num(filename),label];   
    end
    end
if length(label)==0     
    continue 
end 
imagename=strcat(num2str(label),'.bmp'); 
imwrite(paper0,imagename)
end  


%��������õ���������ƴ�Ӻ��� 
function [next,x1]=fun2_unique(f0,f,dang,index1,index2)     %������     
    alpha=2; 
    a1=f0(:,end)*ones(1,(length(index2)));    
    b=f(:,index1); 
    distance=(a1-b).^alpha;     
    zhi1=min(sum(distance)); 
    next1=find(sum(distance)==zhi1);%�������ҵ�ƥ��ͼƬ     %���ҵ��� 
    a1=f0(:,1)*ones(1,(length(index1)));     
    b=f(:,index2); 
    distance=(a1-b).^alpha;     
    zhi2=min(sum(distance)); 
    next2=find(sum(distance)==zhi2);%���������ƥ��ͼƬ     
    if zhi1==zhi2         
        next=next1;       
        x1=1;         
        return    
    else 
        [y,x1]=min([zhi1,zhi2]);    
    end 
    if x1==1 
        next=next1;    
    else 
        next=next2;   
    end
    
    
    
    
%����3����һ���뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�У� 
%��ÿ��ֽ���У��������ҽ���ƴ�� 
file=dir('C:\MATLAB\work\*.bmp');%��������
paper1=[]; 
for i=1:length(file) 
    filename=file(i).name;     
    f_temp=imread(filename);  
    paper1=[paper1,f_temp]; 
end 
paper1=im2double(paper1);%��ͼƬ��������ʽunit8��ת��Ϊdouble�� 
index1=1:72:(72*length(file));%ȷ��ÿ��ͼƬ�Ŀ�ʼ��
index2=72:72:(72*length(file)); %ȷ��ÿ��ͼƬ�Ľ����� 
current1=(find(sum(paper1(:,index1))>178)); %�ҳ�����ͼƬ�����Ե�ӽ���ɫ�� 
note=[];%����һ����Ǳ���������Ѿ�ƴ�ӹ��ı���
for j=1:length(current1)%�����Ե�ӽ���ɫ�����ν���ƴ��     
    Current=current1(j); 
    if (length((find(note==Current))))         
        yy=0;         
        continue;     
    end 
    note=[note,Current];%��¼�Ѿ�ƴ�ӵ� 
    paper0=paper1(:,index1(Current):index2(Current));     
    if mod(Current,2)==1 
    filename=file(Current).name;     
    ccc=findstr(filename,'a.bmp');    
    filename(ccc:(ccc+4))=[]; 
    label=str2num(filename);%�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ���     
    else 
    filename=file(Current).name;     
    ccc=findstr(filename,'b.bmp');     
    filename(ccc:(ccc+4))=[]; 
    label=(str2num(filename)+1000);    
    end
    
    for i=1:18
    nextt=fun2_1(paper1,Current,index1,index2);    
    ftemp=paper1(:,index1(nextt):index2(nextt));    
    Current=nextt; 
    if length(Current)<2 %������ص���һ��ͼƬ���������ϣ�����ֹѭ��������        
        Current=nextt;        
    else 
        break;     end 
    if (length((find(note==Current))))   %�����һ��ͼƬ�Ѿ�ƴ����������ѭ��         
        yy=0       
        break;   
    end 
    note=[note,Current];  
    paper0=[paper0,ftemp]; 
    if mod(Current,2)==0 
        filename=file(Current).name;     
        ccc=findstr(filename,'b.bmp');  
        filename(ccc:(ccc+4))=[]; 
        label=[label,str2num(filename)+1000];    
    else 
        filename=file(Current).name;       
        ccc=findstr(filename,'a.bmp');      
        filename(ccc:(ccc+4))=[]; 
        %�������ڽ���ƴ�ӵ�ͼƬ�ı�ţ�һ����ͼƬ�����Ĳ���        
        label=[label,str2num(filename)];     
    end
    end
    label
if length(label)==0     
    continue; 
end 
imagename=strcat(num2str(label),'.bmp'); 
imwrite(paper0,imagename) 
end  


%����3��������ƴ�ӵĵ��ú��� 
function next=fun2_1(f,dang,index1,index2) 
%������ 
    a1=f(:,index2(dang))*ones(1,(length(index2)));  
    b=f(:,index1); 
    chabie1=(a1-b).^2; 
    zhi=min(sum(chabie1)); 
    next=find(sum(chabie1)==zhi); 
    
    
    
    
%����3��������뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�У� 
%���ǽ����������������ƴ�Ӻ�ʣ����Ƭ��ƴ������ 
%ʹ��ʱ�뽫������ƴ�Ӻ�ÿ�ࣨ���ࣩ��ʣ��ͼƬ���ù���·�� 
file=dir('C:\MATLAB\work\*.bmp'); paper1=[]; 
for i=1:length(file) 
    filename=file(i).name     
    f_temp=imread(filename);     
    paper1=[paper1,f_temp]; 
end 
paper1=im2double(paper1);
index1=1:72:(72*length(file));
index2=72:72:(72*length(file)); 
current1=1:length(file);
note=[]; 
for j=1:length(current1)     
    paper0=[]; 
    Current=current1(j); 
    if (length((find(note==Current))))   
        yy=0;     
        continue;    
    end 
    note=[note,Current]; 
    paper0=paper1(:,index1(Current):index2(Current));  
    if mod(Current,2)==1 
        filename=file(Current).name;        
        ccc=findstr(filename,'a.bmp');         
        filename(ccc:(ccc+4))=[];         
        xuhao=str2num(filename);   
    else 
        filename=file(Current).name;      
        ccc=findstr(filename,'b.bmp');     
        filename(ccc:(ccc+4))=[]; 
        xuhao=(str2num(filename)+1000);   
    end 
for i=1:8 %����ƴ�ӵĸ���������8 
    [nextt,x1]=fun2_unique(paper0,paper1,Current,index1,index2);
    ftemp=paper1(:,index1(nextt):index2(nextt));  
    Current=nextt; 
    if length(Current)<2     
        Current=nextt;      
    else 
        break;    
    end 
    if (length((find(note==Current))))
        yy=0;     
        break;    
    end 
note=[note,Current];    
if x1==1
 paper0=[paper0,ftemp]; 
else 
        paper0=[ftemp,paper0]; 
end
end
if length(xuhao)==0    
    continue;
end 
imagename=strcat(num2str(xuhao),'.bmp'); 
imwrite(paper0,imagename) 
end

    

    
    


