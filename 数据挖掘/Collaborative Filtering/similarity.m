% ��ȡ���û�ϲ�����Ƶ��û�ID
function sim_value_userId = similarity( id )
    %��ȡmakedataŪ�������־���
    rating=importdata('Rating_select.mat');
%     %ͨ�������idŪ�����û��Ը���Ӱ������������δ����Ϊ0��
%     oneLine = getScore(id);
%     %�������û�����������׷�ӵ�ratingĩβ
%     rating = [rating;oneLine];
    %ת�ã���Ϊcorrcoef������е����ƶȣ�
    rating = rating';
    %��ø���֮���Ƥ��ѷ���ƶ�
    corr = corrcoef(rating);
    %��ȡ���У��������û���
    [corr_line,corr_row] = size(corr);
    %��ȡ���һ�е����ƶȣ����������id�û���������û������ƶ�
    similarity = corr(:,corr_row);
    %ȥ������������ƶ�
    similarity(corr_line)=[];
    %�õ�ǰ5�����ƶ�ֵ���û�id����
    [sim_v sim_i]=sort(similarity,1,'descend');
    %sim_vΪ����ֵ,sim_i�û�ID
    sim_value_userId = [sim_v(1:5),sim_i(1:5)];
end

