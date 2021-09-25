
   
%问题3程序二，请将图片存至c盘matlab的work目录，输出文件在工作目录中： 
%这是解决问题三自左向右拼接后剩余碎片的拼接问题 
%使用时请将附件五拼接后每类（聚类）的剩余图片放置工作路径 
function Solution3_2

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

end