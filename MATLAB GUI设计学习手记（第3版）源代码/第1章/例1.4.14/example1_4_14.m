s = {'N1 x=1 y=2 z=3.5','N2 x=4 y=5 z=6.8','N3 x=1.2e+001 y=8.1311e-001 z=1.8104e+002'};
%%%%%%%%%采用正则表达式实现%%%%%
res = regexp(s, '(?<=\=)\d+\.?\d*(e|E)?(?(1)[+-]?\d*)','match');	%后发断言+条件匹配
d = str2double([res{:}])
%%%%%%%%%采用textscan函数实现，该函数在第2章详细讲解%%%%
res = textscan(strjoin(s), '%*s%*s%f%*s%f%*s%f','Delimiter',' =');%空格或等号为间隔符
d = [res{:}]

