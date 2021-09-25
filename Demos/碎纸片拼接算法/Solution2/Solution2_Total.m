% https://wenku.baidu.com/view/c975a832561252d380eb6ef1.html?from=search
%问题一的程序，使用时请将图片文件放至D盘目录，文件输出在D盘目录 

f1=imread('D:/000.bmp'); f2=imread('D:/001.bmp'); f3=imread('D:/002.bmp'); f4=imread('D:/003.bmp'); 
f5=imread('D:/004.bmp'); f6=imread('D:/005.bmp'); f7=imread('D:/006.bmp'); f8=imread('D:/007.bmp'); 
f9=imread('D:/008.bmp'); f10=imread('D:/009.bmp'); f11=imread('D:/010.bmp'); f12=imread('D:/011.bmp');
f13=imread('D:/012.bmp'); f14=imread('D:/013.bmp'); f15=imread('D:/014.bmp'); f16=imread('D:/015.bmp'); 
f17=imread('D:/016.bmp'); f18=imread('D:/017.bmp'); f19=imread('D:/018.bmp'); 


f1=[f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 ]; 
f1=im2double(f1); 
index1=1:72:1368; 
index2=72:72:1368; 
dang=(find(sum(f1(:,index1))==1980));%找出最左边的第一条 
f0=f1(:,index1(dang):index2(dang)); 
for i=1:18 
    nextt=fun1_1(f1,dang,index1,index2);%计算欧式距离     
    ftemp=f1(:,index1(nextt):index2(nextt));     
    f0=[f0,ftemp];     
    dang=nextt; 
end 

imwrite(f0,'D:/jp1.bmp')

%fun1_1 
%计算距离的函数 
function next=fun1_1(f,dang,index1,index2) 
    a=f(:,index2(dang))*ones(1,(length(index2)));     
    b=f(:,index1);     
    chabie=(a-b).^2; 
    next=find(sum(chabie)==min(sum(chabie)))

    
    
    
    
    

%问题2程序一： 
%在每类纸条中，从右向左进行拼接，请将图片存至c盘matlab的work目录，输出文件在工作目录中 
file=dir('C:\MATLAB\work\*.bmp');   %读入数据 
paper1=[]; 
for i=1:length(file)            %将每张图片数据读入工作空间 
filename=file(i).name; 
f_temp=imread(filename); 
paper1=[paper1,f_temp]; 
end 

paper1=im2double(paper1);          %将图片的数据形式unit8型转换为double型 
index1=1:72:(72*length(file));  %确定每张图片的开始列 
index2=72:72:(72*length(file));  %确定每张图片的结束列 
right_white=(find(sum(paper1(:,index2))>175));  %找出本类图片中右边缘接近白色的 
note=[];        %定义一个标记变量，标记已经拼接过的变量 
for j=1:length(right_white)   %将右边缘接近白色的依次进行拼接 
    Current=right_white(j)        %检测当前图片是否拼接过，若已经拼接，则继续循环     
    if (length((find(note==Current))))           
        yy=0         
        continue;     
    end 
    note=[note,Current];  %记录已经拼接的 
    paper0=paper1(:,index1(Current):index2(Current));     
    filename=file(Current).name;     
    ccc=findstr(filename,'.bmp');     
    filename(ccc:(ccc+3))=[]; 
    label=str2num(filename);%计算正在进行拼接的图片的编号，一便于图片输出后的查找 
    for i=1:18  %最多拼18张 
    next=fun2_3(paper1,Current,index1,index2); %fun2_3函数的作用是寻找当前图片的下一张图片  
    ftemp=paper1(:,index1(next):index2(next));     
    Current=next; 
    if length(Current)<2    %如果返回的下一张图片有两张以上，则终止循环并跳出         
        Current=next;         
    else 
        break;     
    end 
    if (length((find(note==Current))))  %如果下一张图片已经拼过，则跳出循环         
        break;     
    end 
    note=[note,Current];     
    paper0=[ftemp,paper0]; 
    filename=file(Current).name;     
    ccc=findstr(filename,'.bmp');     
    filename(ccc:(ccc+3))=[]; 
     %计算正在进行拼接的图片的编号，一便于图片输出后的查找     label=[str2num(filename),label]; end 
if length(label)==0     
    continue 
end 
image_name=strcat(num2str(label),'.bmp'); 
imwrite(paper0,image_name) 
end  
 
%问题二调用的从左向右拼接函数 
function next=fun2_3(f,dang,index1,index2) %从右到左 
    a1=f(:,index1(dang))*ones(1,(length(index1)));     
    b=f(:,index2); 
    chabie1=(a1-b).^2; 
    next=find(sum(chabie1)==min(sum(chabie1))); 
    

    
%问题2程序2，请将图片存至c盘matlab的work目录，输出文件在工作目录中：
%拼接剩余碎纸片的程序，本程序采用向左同时向右拼接 
file=dir('C:\MATLAB\work\*.bmp'); paper1=[];  %数据的读取 
for i=1:length(file) 
    filename=file(i).name;     
    f_temp=imread(filename);     
    paper1=[paper1,f_temp]; 
end 

paper1=im2double(paper1); %数据转换为双精度型 
index1=1:72:(72*length(file)); %确定每张图片的开始列 
index2=72:72:(72*length(file)); %确定每张图片的结束列 
candidat=1:length(file);  
note=[];      %记录已经拼接的 
for j=1:length(candidat) 
    paper0=[]; 
    Current=candidat(j); 
    if (length((find(note==Current))))         
        yy=0;         
        continue;     
    end 
    note=[note,Current];%记录已经拼过的 
    paper0=paper1(:,index1(Current):index2(Current));    
    label=[];   
    filename=file(Current).name;    
    ccc=findstr(filename,'.bmp');   
    filename(ccc:(ccc+3))=[]; 
    label=str2num(filename)%计算正在进行拼接的图片的编号，一便于图片输出后的查找 
    for i=1:8 
    %fun_unique函数的作用是寻找当前图片的下一张图片,同时向左向右寻找     
    [nextt,x1]=fun2_unique(paper0,paper1,Current,index1,index2);     
    ftemp=paper1(:,index1(nextt):index2(nextt));    
    Current=nextt; 
    if length(Current)<2 %如果返回的下一张图片有两张以上，则终止循环并跳出         
        Current=nextt;         
    else 
        break;     
    end 
    if (length((find(note==Current))))%如果下一张图片已经拼过，则跳出循环         
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
        %计算正在进行拼接的图片的编号，一便于图片输出后的查找
    label=[str2num(filename),label];   
    end
    end
if length(label)==0     
    continue 
end 
imagename=strcat(num2str(label),'.bmp'); 
imwrite(paper0,imagename)
end  


%问题二调用的向左向右拼接函数 
function [next,x1]=fun2_unique(f0,f,dang,index1,index2)     %从左到右     
    alpha=2; 
    a1=f0(:,end)*ones(1,(length(index2)));    
    b=f(:,index1); 
    distance=(a1-b).^alpha;     
    zhi1=min(sum(distance)); 
    next1=find(sum(distance)==zhi1);%从左向右的匹配图片     %从右到左 
    a1=f0(:,1)*ones(1,(length(index1)));     
    b=f(:,index2); 
    distance=(a1-b).^alpha;     
    zhi2=min(sum(distance)); 
    next2=find(sum(distance)==zhi2);%从右向左的匹配图片     
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
    
    
    
    
%问题3程序一，请将图片存至c盘matlab的work目录，输出文件在工作目录中： 
%在每类纸条中，从左向右进行拼接 
file=dir('C:\MATLAB\work\*.bmp');%读入数据
paper1=[]; 
for i=1:length(file) 
    filename=file(i).name;     
    f_temp=imread(filename);  
    paper1=[paper1,f_temp]; 
end 
paper1=im2double(paper1);%将图片的数据形式unit8型转换为double型 
index1=1:72:(72*length(file));%确定每张图片的开始列
index2=72:72:(72*length(file)); %确定每张图片的结束列 
current1=(find(sum(paper1(:,index1))>178)); %找出本类图片中左边缘接近白色的 
note=[];%定义一个标记变量，标记已经拼接过的变量
for j=1:length(current1)%将左边缘接近白色的依次进行拼接     
    Current=current1(j); 
    if (length((find(note==Current))))         
        yy=0;         
        continue;     
    end 
    note=[note,Current];%记录已经拼接的 
    paper0=paper1(:,index1(Current):index2(Current));     
    if mod(Current,2)==1 
    filename=file(Current).name;     
    ccc=findstr(filename,'a.bmp');    
    filename(ccc:(ccc+4))=[]; 
    label=str2num(filename);%计算正在进行拼接的图片的编号，一便于图片输出后的查找     
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
    if length(Current)<2 %如果返回的下一张图片有两张以上，则终止循环并跳出        
        Current=nextt;        
    else 
        break;     end 
    if (length((find(note==Current))))   %如果下一张图片已经拼过，则跳出循环         
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
        %计算正在进行拼接的图片的编号，一便于图片输出后的查找        
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


%问题3从左向右拼接的调用函数 
function next=fun2_1(f,dang,index1,index2) 
%从左到右 
    a1=f(:,index2(dang))*ones(1,(length(index2)));  
    b=f(:,index1); 
    chabie1=(a1-b).^2; 
    zhi=min(sum(chabie1)); 
    next=find(sum(chabie1)==zhi); 
    
    
    
    
%问题3程序二，请将图片存至c盘matlab的work目录，输出文件在工作目录中： 
%这是解决问题三自左向右拼接后剩余碎片的拼接问题 
%使用时请将附件五拼接后每类（聚类）的剩余图片放置工作路径 
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
for i=1:8 %限制拼接的个数不超过8 
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

    

    
    


