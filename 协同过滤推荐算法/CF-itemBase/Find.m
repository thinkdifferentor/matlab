% ��ӰƬ���а��±���ҳ�ӰƬ����

function name=Find(index)
    %��ȡ��Ӱ���ݣ���ţ���Ӱ������ӳʱ�䣬��ַ��
    items = importdata('u.item','|',0);
    
    %��ȡӰƬ��Ŀ
    item_Num=length(items.textdata);
    
    %��ȡ�Ƽ����г���
    n=length(index);
    
    %����ӰƬ�Ƽ�����
    films=cell(1,n);
    
    %��ʼ����
    for i=1:n
        for j=1:item_Num
            if(index(i)==j)
                %��ȡ��Ӱ��
                films{1,i} = items.textdata(j,2);
            end
        end
    end
    name=films;
end