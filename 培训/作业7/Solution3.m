% ����˵������ȡʡ��·;�г�����

function Solution3
    %ʡ�ݵ���Ŀ
    Capital_num=31;
    
    %��������
    load Road_time;
    
    %��������
    Cost=zeros(Capital_num,1);
    
    %���Ѽ���
    for i=1:Capital_num
        Cost(i,1)=(Road_time(i,1)/60);
    end
    
    Cost
end


