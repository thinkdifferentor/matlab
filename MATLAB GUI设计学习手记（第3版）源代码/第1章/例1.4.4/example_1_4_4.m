N = 9;
rows = [1 : N];  %��
lines = rows;     %��
strTemp = blanks(7*N);  %��ÿ�е��ַ���Ԥ�浽�ַ�����strTemp�У���disp������ʾ�������
for iRow = 1 : 9
    for jLine = 1 : iRow
        m = jLine * 7 - 6;
        n = m + 7;
        strTemp(1, m : n) = sprintf('%d��%d=%2d  ',b(jLine), a(iRow), b(jLine)*a(iRow));
    end
    disp(strTemp);
end
