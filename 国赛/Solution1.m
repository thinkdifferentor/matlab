%����ÿһ������180�ε�����

load Receive2

figure('name','ÿһ������180����ת����Ϣ��������ͼ��')
for i=1:512
    plot(Receive2(i,:));
    hold on;
    grid on;
end

figure('name','һ����ת��ÿ�����ߵ���Ϣ��������ͼ��')
for j=1:180
    plot(Receive2(:,j));
    hold on;
    grid on;
end