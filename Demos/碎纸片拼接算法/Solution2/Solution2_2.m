
%问题2程序2，请将图片存至c盘matlab的work目录，输出文件在工作目录中：
%拼接剩余碎纸片的程序，本程序采用向左同时向右拼接 

function Solution2_2

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

end