
%����2����2���뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�У�
%ƴ��ʣ����ֽƬ�ĳ��򣬱������������ͬʱ����ƴ�� 

function Solution2_2

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

end