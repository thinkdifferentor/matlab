set(gcf, 'visible', 'on');              %���õ�ǰ���������ڻ������ߣ�ע�⣺gcf��gca������figureĬ�������ص�
%% ����������Ļǰ�˵Ľ���������̬��ʾ��ͼ����
h = waitbar(0, '��ʼ��ͼ...', 'WindowStyle', 'modal'); 
t = 0 : 0.01 : pi;%���ݵĺ�����
for i = 1 : 10
    plot(t, sin(2*pi*i*t));%������������
    waitbar(i/10, h, ['�����' num2str(10*i) '%']);%���½������Ľ��Ⱥͱ���
    pause(1);     %�ӳ�1��
end
close(h);         %�رս�����
