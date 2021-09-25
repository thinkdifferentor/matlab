%矩阵计算

%魔数矩阵
A=magic(5);

%单位矩阵
B=eye(5);

%生成全1矩阵
C=ones(5);

%生成矩阵的每个元素满足0,1上的均匀分布
D=rand(5,5);

disp('A-B 矩阵减法');
R1=A-B

disp('A+B 矩阵假发2');
R2=A+B

disp('A*B 矩阵乘法');
R3=A*B

disp('A.*B 矩阵点乘');
R4=A.*B

disp('A^2 矩阵的次方');
R5=A^2

disp('计算方程AX=B的解');
R6=A\B

disp('计算方程XA=B的解');
R7=B/A

disp('计算A.\B');
R8=A.\B

disp('计算A./B');
R9=A./B

disp('计算B.\A');
R10=B.\A

disp('计算B./A');
R11=B./A


disp('矩阵A的迹');
R12=trace(A)

disp('矩阵A的对角元素构成的向量');
R13=diag(A)

disp('矩阵A的上三角');
R14=tril(A)

disp('矩阵A的下三角');
R15=triu(A)

disp('矩阵A的秩');
R16=rank(A)

disp('矩阵A的行列式');
R17=det(A)

disp('矩阵A的逆矩阵');
R18=inv(A)

disp('矩阵A的零空间的基 AX=0的解');
R19=null(A)

%[V,D]=eig(A) 放回方阵A的特征值和特征向量，其中D为特征值构成的对角阵，每个特征值对应得V的列属于该
%特征值的一个特征向量，如果返回一个值，则得到特征值构成的列向量。
disp('矩阵A的特征值和特征向量');
[R20,R21]=eig(A)

disp('每个特征值对应的特征向量');
R20

disp('特征值构成的对角阵');
R21










