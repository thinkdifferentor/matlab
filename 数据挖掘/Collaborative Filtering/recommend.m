%���û��Ƽ���Ʒ
function films = recommend( id )
    %��ȡǰ�������ƶȾ���
    %sim_value_userId��sim_vΪ����ֵ,sim_i�û�ID
    sim_value_userId = similarity(id);
    base = importdata('Single.mat');%������������
    
    %��ȡ��Ӱ���ݣ���ţ�ӰƬ����
%     items = importdata('Mname.txt');%û��ͷ�ļ�����ȫ��������load����ͷ�ļ�������������ͳһ��importdata
    
%     items =
%     importdata('u.item','|',0);%û��ͷ�ļ�����ȫ��������load����ͷ�ļ�������������ͳһ��importdata
    
%     %�ȶ�����Ƽ���Ӱ�Ŀռ�
%     films = {};
%     %ǰ5�����ƶȱ�����Ӱ
%     for n=1:5
%         %��ȡ�������û������־���
%         first_base = base(base(:,1)==sim_value_userId(n,2),:);
%         %��ȡ���û�����Ϊ5�ֵ���ߵĵ�Ӱ���־���
%         first_base_top = first_base(find(first_base(:,3)>=0.1),:);
%         %��ȡ��Ӱ��
%         films_items = items{first_base_top(:,2)};
%         %׷�ӵ�Ӱ������ǰ����õĿռ���
%         films{n} = films_items;
%     end
    
    %�ȶ�����Ƽ���Ӱ�Ŀռ�
    films = [];
    %ǰ5�����ƶȱ�����Ӱ
    for n=1:5
        %��ȡ�������û������־���
        first_base = base(base(:,1)==sim_value_userId(n,2),:);
        %��ȡ���û�����Ϊ5�ֵ���ߵĵ�Ӱ���־���
        first_base_top = first_base(find(first_base(:,3)==5),:);
        %��ȡ��Ӱ��
        films = first_base_top(:,2);
        %׷�ӵ�Ӱ������ǰ����õĿռ���
    
%         films = [films;films_items];
    end
    
    
    %ȥ�أ���ֹ5���������û��Ƽ��ĵ�Ӱ���ظ�
    films = unique(films);
end

