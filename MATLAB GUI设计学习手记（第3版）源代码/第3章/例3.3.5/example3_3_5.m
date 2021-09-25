syms t x f g b
f = taylor(log(1+x));
g = [cos(t) sin(t); -sin(t) cos(t)];
b = eig(sym(pascal(2)));
%% �ڴ�������ʾ���ʽ
figure('name','�����������Ĵ�����ʾBY�޻���');
hAxes = axes('units','normalized','position',[0,0,1,1],'visible','off'); %��������������
text(0.1,0.25,['f = $', latex(f), '$'],'interpreter','latex','fontsize',16); %��ʾ���ʽf
text(0.1,0.55,['g = $', latex(g), '$'],'interpreter','latex','fontsize',16); %��ʾ���ʽg
text(0.1,0.85,['b = $', latex(b), '$'],'interpreter','latex','fontsize',16); %��ʾ���ʽb
