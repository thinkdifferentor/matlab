function subplotrows(type,data,i,xlabels)
%% ��һ��ͼ̫С�� ���������겻����ת
[rows,cols] = size(data);

subplot(ceil(type/2),2,i);
title(['��Ȧ���' num2str(i)]);
hold on;
for k=1:rows
    plot(1:cols,data(k,:),'-k');
end
hold off;
set(gca,'xtick',1:cols);
set(gca,'xticklabel',xlabels);
% h = gca;
%  rotateticklabel(h, 45);%��������ĺ�����������б45��

end