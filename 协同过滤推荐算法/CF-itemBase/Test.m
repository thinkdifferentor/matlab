%test
clc,clear;

index=[1 2 3 4 5];

%��ȡ��Ӱ���ݣ���ţ���Ӱ������ӳʱ�䣬��ַ��
    items = importdata('u.item','|',0);
    
    %��ȡӰƬ��Ŀ
    item_Num=length(items.textdata);
    
    %��ȡ�Ƽ����г���
    n=length(index);
    
    %����ӰƬ�Ƽ�����
    films=[];
    
    %��ʼ����
    for i=1:n
        for j=1:item_Num
            if(index(i)==j)
                %��ȡ��Ӱ��
                films_items = items.textdata(j,2);
                %׷�ӵ�Ӱ������ǰ����õĿռ���
                films = [films;films_items];
            end
        end
    end
    name=films;