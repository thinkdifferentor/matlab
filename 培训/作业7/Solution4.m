% ����˵���������������ļ���ʡ���������ʱ��

function Solution4

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
Start=;

% �����м�ʡ�ݸ���
First_num=;

% �����м�ʡ�ݱ������
First_array=[];

% ����ڶ���ʡ�ݱ��
Second=;


% ʱ���¼
Total_time=zeros(First_num,1);
Total_day=zeros(First_num,1);

for i=1:First_num
    
    % ����һ��������ʱ��
    T1=Dis_time(Start,i)+Dis_time(i,Second)+Dis_time(Second,Start);
    T2=During(i)+During(Second);
    Total_time(i,1)=T1+T2;
    
    % ��ʱ�任�������
    Total_day(i,1)=(Total_time(i,1)/60-24)/12+1;
    
end


for i=1:First_num
    
    % ʱ�����
    fprintf('�α�����ʡ�������ʱ��Ϊ:%f\n',Total_day(i,1));
    
end

end



