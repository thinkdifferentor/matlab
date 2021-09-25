syms t x f g b
f = taylor(log(1+x));
g = [cos(t) sin(t); -sin(t) cos(t)];
b = eig(sym(pascal(2)));
%% 在窗口内显示表达式
figure('name','符号运算结果的窗口显示BY罗华飞');
hAxes = axes('units','normalized','position',[0,0,1,1],'visible','off'); %创建隐藏坐标轴
text(0.1,0.25,['f = $', latex(f), '$'],'interpreter','latex','fontsize',16); %显示表达式f
text(0.1,0.55,['g = $', latex(g), '$'],'interpreter','latex','fontsize',16); %显示表达式g
text(0.1,0.85,['b = $', latex(b), '$'],'interpreter','latex','fontsize',16); %显示表达式b
