%����2����һ�� 
%��ÿ��ֽ���У������������ƴ�ӣ��뽫ͼƬ����c��matlab��workĿ¼������ļ��ڹ���Ŀ¼�� 

function Solution2_1
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
    if (length(label)==0)     
        continue; 
    end 
    image_name=strcat(num2str(label),'.bmp'); 
    imwrite(paper0,image_name) 
end  

end  

end