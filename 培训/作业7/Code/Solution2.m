% ����˵��������������ļ���ʡ���������ʱ��

function Solution2

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


% �������ʡ�ݱ��
Start=input('�������ʡ�ݱ��:');

% �����1��ʡ�ݱ��
First=input('�����1������ʡ�ݱ��:');

% �����2��ʡ�ݱ��
Second=input('�����2������ʡ�ݱ��:');


% ����һ��������ʱ��
Total_time=Dis_time(Start,First)+Dis_time(First,Second)+Dis_time(Second,Start)+During(First)+During(Second);

% ��ʱ�任�������
Total_day=(Total_time/60-24)/12+1;
 

% ʱ�����
fprintf('�α�����ʡ�������ʱ��Ϊ:%f\n',Total_day);


end



