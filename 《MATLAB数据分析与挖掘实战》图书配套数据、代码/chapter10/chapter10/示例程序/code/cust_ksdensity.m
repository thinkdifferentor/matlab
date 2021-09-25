function cust_ksdensity(data_i,i,picoutput_prefix,txt)
% data_i:��i���ȫ�����ݣ�
% i:��i�ࣻ
% txt: ��������

%% ��ͼ
cols = size(data_i,2);
figure;
attributes = size(txt,2);
rows =ceil( attributes/2);
for j=1:cols
    [f,xi] = ksdensity(data_i(:,j));
    subplot(2,rows,j);
    plot(xi,f);
    title(txt{1,j});
    ylabel('�ܶ�');
    set(get(gca,'xlabel'),'fontweight','bold','fontsize',12);
    set(get(gca,'ylabel'),'fontweight','bold','fontsize',12);
    set(get(gca,'title'),'fontweight','bold','fontsize',12);
end

%% ����ͼƬ
set(gcf,'Position',[100,200,500,300]); % ����ͼƬ��С
set(gcf,'visible','off'); % ���ò�������
% set(gca,'FontSize',20,'FontWeight','bold');
picfile = [picoutput_prefix 'type' num2str(i) '.png'];
print(gcf,'-dpng',picfile);
disp(['�ͻ�Ⱥ' num2str(i) '��Ƶ���ܶ�ͼ�ѱ����ڡ�' picfile '��']);
end