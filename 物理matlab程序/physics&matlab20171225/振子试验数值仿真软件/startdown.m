global t x t1;
mm=100*x(:,1);
nn=x(:,2);
h2=figure(2);
set(h2,'unit','normalized','position',[0.01 0.025 0.98 0.45],...
       'NumberTitle','off',...
       'Name','����ͼ��');
subplot(1,2,1),plot(t1,mm),title('ʱ�䣨x�ᣩλ�ƣ�y�ᣩ����ͼ��','color',[0.5 0.1 0.9]);
subplot(1,2,2),plot(mm,nn),title('λ�ƣ�x�ᣩ�ٶȣ�y�ᣩ����ͼ�񣬼����ӵ������','color',[0.5 0.1 0.9]);
