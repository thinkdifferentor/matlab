function plotrows( data,i ,xlabels)
%% ��ͼ

[rows,cols] = size(data);
figure(100+i);
hold on;
for k=1:rows
   plot(1:cols,data(k,:),'-ok');
end

hold off;

%  ��������
title(['��Ȧ���' num2str(i)]);
set(gca,'xtick',1:cols);
set(gca,'xticklabel',xlabels);

 
% h = gca;
% rotateticklabel(h, 45);%��������ĺ�����������б45��

end

