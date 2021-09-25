%数据构建
%用户号、影片编号、观看时间/点播金额

n=length(a);
for i=1:n
    Single_select(i).uid=a(i);
    Single_select(i).mid=b(i);
    Single_select(i).num=c(i);
end

sava('Single_select.mat','Single_select');



