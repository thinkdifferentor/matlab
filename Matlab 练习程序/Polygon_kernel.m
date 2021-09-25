% ����εĺ˿���������⣺�����Ϊԭ������ڲ���һ������Σ�վ������к˵Ķ�����У������ܿ���ԭ����ε��κ�һ��λ�á�

clear all;close all;clc;

n=20;
p=rand(n,2);

p=createSimplyPoly(p);
n=n+1;
p(n,:)=p(1,:);

maxX=max(p(:,1));
minX=min(p(:,1));
maxY=max(p(:,2));
minY=min(p(:,2));

core=[minX minY;        %��ʼ����
      minX maxY;
      maxX maxY;
      maxX minY;
      minX minY];

for i=2:n
    [m ~]=size(core);    
   
    p_pre=p(i-1,:);             %����ε�ǰ���ǰһ����    
    p_cur=p(i,:);               %����ε�ǰ��
    if i~=n                     %����ص���һ���㣬��ô��һ������Ϊ�ڶ�����
        p_nxt=p(i+1,:);
    else
        p_nxt=p(2,:); 
    end
   
    k=(p_nxt(2)-p_cur(2))/(p_nxt(1)-p_cur(1));      %��ǰ������һ���㹹�ɵĶ���ε�����һ��
    b=p_cur(2)-k*p_cur(1);  
    flag=k*p_pre(1)-p_pre(2)+b;         %��ǵ�ǰ���ǰһ�����ڸñߵ���߻��ұ�
     
    v1=p_pre-p_cur;                     %���㵱�ڵ�İ�͹��
    v2=p_nxt-p_cur;    
    r=det([v1;v2]);                     %����0Ϊ͹����֮Ϊ��
    
    re=[];
    for j=1:m-1
        core_cur_flag=core(j,1)*k-core(j,2)+b;          %��ǵ�ǰ���еĵ��ڱߵ���߻��ұ�
        core_nxt_flag=core(j+1,1)*k-core(j+1,2)+b;      %�����һ�����еĵ��ڱߵ���߻��ұ�
        if r*core_cur_flag*flag>0                       %����ǰ����ε�Ϊ͹�㣬��ǰһ����ͺ˵ĵ�ͬ�����ǰ����ε�Ϊ���㣬��ǰһ����ͺ˵ĵ��Ƿ�����ʱ��Ǹõ�Ϊ�º˵ĵ�

            re=[core(j,:);re];                         
        end
        
        if core_cur_flag*core_nxt_flag<=0               %��Ƕ���α���˵ıߵĽ���Ϊ�º˵ĵ�
            if core(j,1)~=core(j+1,1) 
                kbar=(core(j,2)-core(j+1,2))/(core(j,1)-core(j+1,1));
                bbar=core(j,2)-kbar*core(j,1);
                       
                xx=-(b-bbar)/(k-kbar);
                yy=-(-bbar*k+b*kbar)/(k-kbar);
            else
                xx=core(j,1);
                yy=k*xx+b;
            end
            re=[xx yy;re];
        end
        
    end
    
    core=re;  
    core(size(core,1)+1,:)=core(1,:);   %����ε�һ��������һ������ͬ
end

hold on;
plot(p(:,1),p(:,2));
plot(core(:,1),core(:,2),'r')
axis equal; 