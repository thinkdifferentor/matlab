%% ����̽������
clear;
% ������ʼ��
weatherfile = '../data/weatherdata.xls'; % ��������
defectfile = '../data/defectdata.xls' ; % ȱ������

%%  ��ȡ����
[weather_num,weather_txt] = xlsread(weatherfile);
[defect_num,defect_txt] = xlsread(defectfile);
x= weather_num(:,1);

%% �Զ��庯�����Ȼ�����ͼ��Ȼ������ͼ
cols = size(defect_num,2);
for i=2:cols
    % ��iȱ�ݣ������¡������¡�ǿ��ˮ�� 
    bar_line_plot(x,defect_num(:,i),defect_txt{1,i},weather_num(:,[2,3,6])...
        ,weather_txt(1,[2,3,6]));

    % ��iȱ�ݣ���ʪ�ȡ���ʪ�ȡ�ǿ����
    bar_line_plot(x,defect_num(:,i),defect_txt{1,i},weather_num(:,[4,5,7])...
        ,weather_txt(1,[4,5,7]));
end
 
disp('����̽��������ɣ�');