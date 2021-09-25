% ����˵�����������ʡ�������ɻ�����������������ķɻ����ú�ʡ�ڿ�������

function Solution8

clear;clc;

% ���и�������
City_num=31; 

% ����ʡ��֮��ķɻ�����
load Fly;

% ����ʡ��ͣ��ʱ��
load During;

% ����ʡ�ڼݳ��Ļ���
load Cost_capital 


% ����ʡ��ס�޷Ѻ��⳵��



% ����ʡ�ݱ��
Start=27;
 
% ʱ���¼
Total_time=zeros(City_num,(City_num-1));
Total_day=zeros(City_num,(City_num-1));

% ���Ѽ�¼
Total_cost=zeros(City_num,(City_num-1));

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
        
        %һ�����е��ܻ���

        T1=Fly(Start,i)+Fly(i,j)+Fly(j,Start);
        T2=Cost(i)+Cost(j);
        Total_cost(i,j)=T1+T2;
        
        if(Total_day(i,j)<15&&Total_day(i,j)>14)
            % ʱ�����
            fprintf('�ӳ���ʡ�ݵ�ʡ��%d,�ٵ�ʡ��%d���������ʱ��Ϊ:%f��\t�ô������ܻ���Ϊ:%f\n',i,j,Total_day(i,j),Total_cost(i,j));
        end
        
    end
end

end



