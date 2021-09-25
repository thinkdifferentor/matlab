global t x t1;
mm=100*x(:,1);
nn=x(:,2);
h2=figure(2);
set(h2,'unit','normalized','position',[0.01 0.025 0.98 0.45],...
       'NumberTitle','off',...
       'Name','函数图像');
subplot(1,2,1),plot(t1,mm),title('时间（x轴）位移（y轴）函数图像','color',[0.5 0.1 0.9]);
subplot(1,2,2),plot(mm,nn),title('位移（x轴）速度（y轴）函数图像，即振子的相轨线','color',[0.5 0.1 0.9]);
