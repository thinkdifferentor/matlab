% ����˵�����������ʡ�������ɻ��������������������ʱ��

function Solution6

clear;clc;

% ���и�������
City_num=31; 

% ����ʡ��֮��ķɻ�����
load Fly;

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
        Total_time(i,j)=During(i)+During(j);

        % ��ʱ�任�������
        Total_day(i,j)=(Total_time(i,j)/60-24)/12+1;
        
        % ʱ�����
        fprintf('�ӳ���ʡ�ݵ�ʡ��%d,�ٵ�ʡ��%d���������ʱ��Ϊ:%f��\n',i,j,Total_day(i,j));
        
    end
end

end



