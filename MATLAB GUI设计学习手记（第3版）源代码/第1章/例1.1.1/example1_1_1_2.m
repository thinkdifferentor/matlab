m=input('������һ������2��������\n');
a = 1;
b = 2;
if (m>2) && (m==floor(m))
    for i = 3 : m
        temp = a + b;
        a = b;
        b = temp;
    end
end
sprintf('f(%d)=%d',[m temp])
