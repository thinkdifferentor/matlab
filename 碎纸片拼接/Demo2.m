% 附件一数据处理
clc clear 
p=cell(1,18); 
for i=1:10 
    imageName=strcat('I:\题目\附件1\00',num2str(i-1),'.BMP');     p{i} = imread(imageName); 
end 

for i=11:19 
    imageName=strcat('I:\题目\附件1\0',num2str(i-1),'.BMP');     p{i} = imread(imageName); 
end 

sump=[]; 
Answer=[]; 

for i=1:19 
    Answer(i)=i; 
end  

for i=1:19 
    sump(i)=(sum(p{i}(:,1))+sum(p{i}(:,2))); 
end 

A=find(sump==max(sump)); 
C=Answer(A); 
Answer(A)=1; 
Answer(1)=C; 
B=p{A}; 
p{A}=p{1};
p{1}=B;  

for i=2:19    
    sump=[];   
    for j=i:19 
      a=p{i-1}(:,72);       
      b=p{j}(:,1);       
      s=abs(a-b);        
      sump(j)=sum(s);       
      
      for k=1:(i-1)
        sump(k)=9999999;       
      end
    end
    A=find(sump==min(sump)); 
    C=Answer(A); 
    Answer(A)=Answer(i);
    Answer(i)=C; 
    B=p{A};
    p{A}=p{i};
    p{i}=B; 
end 

Answer-1 
q=[p{1}];

for i=2:19
    q=[q,p{i}]; 
end  

imshow(q)





% 附件二数据处理
clc clear 

p=cell(1,18); 
for i=1:10 
    imageName=strcat('I:\题目\附件2\00',num2str(i-1),'.BMP');     p{i} = imread(imageName); 
end 

for i=11:19 
    imageName=strcat('I:\题目\附件2\0',num2str(i-1),'.BMP');     p{i} = imread(imageName); 
end 

sump=[]; 
Answer=[]; 
for i=1:19 
    Answer(i)=i; 
end

for i=1:19 
    sump(i)=(sum(p{i}(:,1))+sum(p{i}(:,2)));
end 

A=find(sump==max(sump)); 
C=Answer(A); 
Answer(A)=1; 
Answer(1)=C; 
B=p{A}; 
p{A}=p{1}; 
p{1}=B;  

for i=2:19    
    sump=[];   
    for j=i:19 
      a=p{i-1}(:,72);       
      b=p{j}(:,1);       
      s=abs(a-b);       
      sump(j)=sum(s);       
      for k=1:(i-1) 
          sump(k)=9999999;       
      end
    end
A=find(sump==min(sump)); 
C=Answer(A); 
Answer(A)=Answer(i); 
Answer(i)=C;
B=p{A}; 
p{A}=p{i}; 
p{i}=B; end 
Answer-1
q=[p{1}];
for i=2:19 
    q=[q,p{i}];
end  
imshow(q)




clc clear 
%%%%%%%%%%%%%%%%%%%%%%%%%%读入图片%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
p=cell(1,209); 
for i=1:10 
    imageName=strcat('J:\题目\附件3\00',num2str(i-1),'.BMP');     
    p{i} = imread(imageName); 
end 

for i=11:100 
    imageName=strcat('J:\题目\附件3\0',num2str(i-1),'.BMP');     
    p{i} = imread(imageName); 
end 

for i=101:209 
    imageName=strcat('J:\题目\附件3\',num2str(i-1),'.BMP');     
    p{i} = imread(imageName); 
end 

%%%%%%%%定义下标变量%%%%%%%% 
Answer=[1:19;20:38;39:57;58:76;77:95;96:114;115:133;134:152;...     153:171;172:190;191:209]  
    
%%%%%%%%%%%%%%%%%%%%%%%%%%找第一列图片%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

sump=[];

for i=1:207     
    sump(i)=199999-(sum(p{i}(:,1))+sum(p{i}(:,2))+sum(p{i}(:,3))+sum(p{i}(:,4))); 
end 
[s,firstLine]=sort(sump); 
disp('第一列的图片是：') 
FL=firstLine(1:11);        %%%%FL表示第一列元素，共11个,及11大类 
std=255*72;                %一个作为空行标准的数字  
yiyong=FL;                 %定义一个集合，记录应经用过的图片 
%%%%%%%%%%%%%%%%%%%%%%%%%%对剩下图片进行分类%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for y=1:11 
j=FL(y);                   %j表示第j个第一列元素 
s=sum(p{j},2);             %行求和  
 %%&&%%找第一行非空白的行数%%%% 
 i=1; 
while i<=180   
    if s(i)==std
    i=i+1;   
    else 
     a=i;                  %a即为第一个有字行      
     break   
    end
end
     %%接着往后找，找第一个有字行字后的空白行%% 
     while i<=180   
         if s(i)~=std     
             i=i+1; 
 else a1=i;                %第一个空白行记为a1      
     break   
         end
     end
     i=i+1;
     
    while i<=180         
        if s(i)==std             
            i=i+1; 
        else a2=i-1;
            break  %最后一个空白行记为a2         
        end
    end
   L1=[];    
   L1(1)=j;    
   m=2;     
    for k=1:209 
        s=sum(p{k},2);         
        x=0; 
        for n=a1+2:a2-2             
            if s(n)==std                  
                x=x+1;             
            end
        end
        if x==a2-a1-3 
            L1(m)=k;%L1就是图片的序号             
            m=m+1;         
        end
    end
    Y=strcat('第',num2str(y),'类可能的图片编号为：');     
    disp(Y) 
    L1                       %求出了可能为同一行的纸片 
L1=[L1(1),setdiff(L1(:),FL(:))'];%除去其中已经用过的的图片     
yiyong=[L1,yiyong];      %将用过的图片存在集合yiyong中
%%%%%%%%%%%%%用第一问的方法横排拼图%%%%%%%%%%%%%%%%%%%%%%%%%%%  
z=size(L1,2); 
for x=1:z 
    fank(:,:,x)=p{L1(x)}; 
end
X=1:z; 
for i=2:z    
    sump=[];   
    for j=i:z
      for w=1:180 
      a=double(fank(w,72,i-1));       
      b=double(fank(w,1,j));       
      s(w)=abs(a-b);        
      sump(j)=sum(s);       
      end 
      
      for k=1:(i-1) 
          sump(k)=9999999;       
      end
    end
[b,A]=sort(sump); C=X(A(1)); X(A(1))=X(i); X(i)=C; 
B=fank(:,:,A(1)); 
fank(:,:,A(1))=fank(:,:,i); fank(:,:,i)=B; 
end 
%%%%%%%%输出图片%%%%%%%% X-1; 
m=[fank(:,:,1)]; 
for i=2:z 
m=[m,fank(:,:,i)]; 
end  
subplot(11,1,y) 
imshow(m) 
end 
length(unique(yiyong))




  
% Matlab拼出复原图片 
clc clear 
%%%%%%%%读入图片%%%%%%%%%%%% p=cell(1,209); for i=1:10imageName=strcat('I:\题目\附件4\00',num2str(i-1),'.BMP');     p{i} = imread(imageName); end 
for i=11:100 
    imageName=strcat('I:\题目\附件4\0',num2str(i-1),'.BMP');     p{i} = imread(imageName); end 
for i=101:209 
    imageName=strcat('I:\题目\附件4\',num2str(i-1),'.BMP');     p{i} = imread(imageName); end 
%%%%%%%%%%%%%图片%%%%%%%%%%%%%%%%%%% 
Answer=[191,075,011,154,190,184,002,104,180,064,106,004,149,032,204,065,039,067,147;...     201,148 170 196 198 094 113 164 078 103 091 080 101 026 100 006 017 028 146;...     086 051 107 029 040 158 186 098 024 117 150 005 059 058 092 030 037 046 127;...     019 194 093 141 088 121 126 105 155 114 176 182 151 022 057 202 071 165 082;...     159 139 001 129 063 138 153 053 038 123 120 175 085 050 160 187 097 203 031;...     020 041 108 116 136 073 036 207 135 015 076 043 199 045 173 079 161 179 143;...     208 021 007 049 061 119 033 142 168 062 169 054 192 133 118 189 162 197 112;...     070 084 060 014 068 174 137 195 008 047 172 156 096 023 099 122 090 185 109;...     132 181 095 069 167 163 166 188 111 144 206 003 130 034 013 110 025 027 178;...     171 042 066 205 010 157 074 145 083 134 055 018 056 035 016 009 183 152 044;...     081 077 128 200 131 052 125 140 193 087 089 048 072 012 177 124 000 102 115;] 
    Answer=Answer+1; 
    Answer=Answer'; 
    i=0; 
    m0=[]; 
    for j=i*19+1:(i+1)*19         
        m0=[m0,p{Answer(j)}];     
    end
    i=1; 
    m1=[];
    
    for j=i*19+1:(i+1)*19         
        m1=[m1,p{Answer(j)}];     
    end
    i=2; 
    m2=[];
    
    for j=i*19+1:(i+1)*19         
        m2=[m2,p{Answer(j)}];     
    end
    i=3; 
    m3=[];
    
    for j=i*19+1:(i+1)*19
        m3=[m3,p{Answer(j)}];     
    end
    i=4; 
    m4=[];
    
    for j=i*19+1:(i+1)*19         
        m4=[m4,p{Answer(j)}];     
    end
    i=5; 
    m5=[];
    
    for j=i*19+1:(i+1)*19         
        m5=[m5,p{Answer(j)}];     
    end
    i=6; 
    m6=[];
    
    for j=i*19+1:(i+1)*19         
        m6=[m6,p{Answer(j)}];     
    end
    i=7; 
    m7=[];
    
    for j=i*19+1:(i+1)*19         
        m7=[m7,p{Answer(j)}];    
    end
    i=8;
    m8=[];
    
    for j=i*19+1:(i+1)*19        
        m8=[m8,p{Answer(j)}];   
    end
    i=9;     
    m9=[];
    
    for j=i*19+1:(i+1)*19     
        m9=[m9,p{Answer(j)}];   
    end
    i=10;
    m10=[];
    
    for j=i*19+1:(i+1)*19 
        m10=[m10,p{Answer(j)}];     
    end   
 m=[m0;m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];  
 imshow(m)

a=cell(1,208); for i=1:10 
    imageName=strcat(' I:\题目\附件5\00',num2str(i-1),'a.BMP');     a{i} = imread(imageName); end 
for i=11:100 
    imageName=strcat('I:\题目\附件5\0',num2str(i-1),'a.BMP');     a{i} = imread(imageName); end 
for i=101:208 
    imageName=strcat(' I:\题目\附件5\',num2str(i-1),'a.BMP');    a{i} = imread(imageName); end 
b=cell(1,208); for i=1:10 
    imageName=strcat(' I:\题目\附件5\00',num2str(i-1),'b.BMP');     b{i} = imread(imageName); end 
for i=11:100 
    imageName=strcat(' I:\题目\附件5\0',num2str(i-1),'b.BMP');     b{i} = imread(imageName); end 
for i=101:208 
    imageName=strcat(' I:\题目\附件5\',num2str(i-1),'b.BMP');    b{i} = imread(imageName); end 









