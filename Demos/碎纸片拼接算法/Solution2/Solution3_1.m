 
%问题3程序一，请将图片存至c盘matlab的work目录，输出文件在工作目录中： 
%在每类纸条中，从左向右进行拼接 
function Solution3_1

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


end
   