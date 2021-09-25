% ����˵�����������ʡ���������Լ����������������ʱ��

function Solution5

clear;clc;

% ���и�������
City_num=31; 

% ����ʡ���ľ���
load Dis;
Dis=dis;

% ��ȡ����Գƾ���
Dis=Dis+Dis';

Dis_time=zeros(City_num);

% ����·;ʱ��
for i=1:City_num
    for j=1:City_num
        
        Dis_time(i,j)=(Dis(i,j)/90)*60;
    end
end


% ����ʡ��ͣ��ʱ��
load During;


% ����ʡ�ݱ��
Start=27;
 
% ʱ���¼
Total_time=zeros(City_num,(City_num-1));
Total_day=zeros(City_num,(City_num-1));

% ��һ������
for i=1:City_num
    
    %������������
    if(i==Start)
        continue;
    end
    
    %�ڶ�������
    for j=2:City_num
        
        %������������
        if(j==Start)
            continue;
        end
    
        % ����һ��������ʱ��
        T1=Dis_time(Start,i)+Dis_time(i,j)+Dis_time(j,Start);
        T2=During(i)+During(j);
        
        Total_time(i,j)=T1+T2;

        % ��ʱ�任�������
        Total_day(i,j)=(Total_time(i,j)/60-24)/12+1;
        
        % ʱ�����
        fprintf('�ӳ���ʡ�ݵ�ʡ��%d,�ٵ�ʡ��%d���������ʱ��Ϊ:%f��\n',i,j,Total_day(i,j));
        
    end
end

end



