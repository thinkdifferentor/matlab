function si = Simi( a,b )
%   �˺����������a,b�����ƶ�
[row,~] = size(a);
si = 0.0;
for i=1:row
    if  a(i)==b(i)
        si = si+1;
    end
end
si = si/row;
end