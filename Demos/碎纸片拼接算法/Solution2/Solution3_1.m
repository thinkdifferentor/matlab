 
%����3����һ���뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�У� 
%��ÿ��ֽ���У��������ҽ���ƴ�� 
function Solution3_1

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


end
   