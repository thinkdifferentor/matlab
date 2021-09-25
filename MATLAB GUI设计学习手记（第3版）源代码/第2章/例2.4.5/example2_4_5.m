%% 打开数据文件，获取文件句柄
fid = fopen('data.txt');
%% 跳过第1行，后面每行读取第1个数值
a = textscan(fid, 'PG%*02d %f %*s', 'HeaderLines', 1, 'Delimiter', '\n');
%% 关闭数据文件
fclose(fid);
