%Ƶ������Ƶ����֮���ƥ��
clear,clc;

%Ƶ������Ƶ������������
load('Channel_Num_Test');
load('Channel_Name_Test');

Channel(1).num=1;
Channel(1).name='����1̨-����';

%���ظ��ṹ���鹹��
cnt=2;%�ṹ�����¼����
for i=2:length(Channel_Num_Test)
    
    %���Ƶ���Ƿ���ڱ�ʶ
    flag=1;
    %�������еļ�¼������ӵ��ṹ����
    for j=1:length(Channel)
        if(Channel_Num_Test(i)==Channel(j).num)
            flag=0;
            break;
        end
    end
    
    %������нṹ������û���ظ�Ƶ��
    if(flag==1)
        Channel(cnt).num=Channel_Num_Test(i);
        Channel(cnt).name=Channel_Name_Test{i};
        cnt=cnt+1;
    end
    
end

%���ݱ���
save('Channel.mat','Channel');


