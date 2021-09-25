%问题2程序一： 
%在每类纸条中，从右向左进行拼接，请将图片存至c盘matlab的work目录，输出文件在工作目录中 

function Solution2_1
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
    if (length(label)==0)     
        continue; 
    end 
    image_name=strcat(num2str(label),'.bmp'); 
    imwrite(paper0,image_name) 
end  

end  

end