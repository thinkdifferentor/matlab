N = 9;
rows = [1 : N];  %行
lines = rows;     %列
strTemp = blanks(7*N);  %将每行的字符串预存到字符数组strTemp中，由disp函数显示到命令窗口
for iRow = 1 : 9
    for jLine = 1 : iRow
        m = jLine * 7 - 6;
        n = m + 7;
        strTemp(1, m : n) = sprintf('%d×%d=%2d  ',b(jLine), a(iRow), b(jLine)*a(iRow));
    end
    disp(strTemp);
end
