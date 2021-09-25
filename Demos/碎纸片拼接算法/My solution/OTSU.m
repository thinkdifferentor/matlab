function Level = OTSU(Image)  

%��ͼ����������ת��Ϊ�޷��Ű�λ���͡��������ͼ�����޷��Ű�λ���͵ģ����ص�ͼ���Դͼ����ͬ�����Դͼ�����޷��Ű�λ���͵ģ��ú��������غ�Դͼ����ͬ
%����������Ϊuint8��ͼ��
Image=im2uint8(Image(:));

%����Ҷȼ���
D=256;  

%imhist��MATLABͼ����ģ���е�һ��������������ȡͼ���е�ֱ��ͼ��Ϣ��
Cnt=imhist(Image,D);  

%ͨ�����ڼ���һ��������е��ۼ�ֵ
%B = cumsum(A,dim)���ֵ��ø�ʽ����A���ɱ���dim��ָ����ά�����ۼӺ͡����磺cumsum(A,1)���ص������ŵ�һά�����У����ۼӺͣ�cumsum(A,2)���ص������ŵڶ�ά�����У����ۼӺ͡�
Num=cumsum(Cnt);  
Tmp=Cnt .* (1:D)';
u=cumsum(Tmp);  

Max=0;  
Level=0;  
  
for i=1:D  
    u0=u(i,1)/Num(i,1);  
    u1=(u(D,1)-u(i,1))/(Num(D,1)-Num(i,1));  
    Num0=Num(i,1);  
    Num1=Num(D,1)-Num0; 
    g=Num0*Num1*(u1-u0)*(u1-u0);  
    if g > Max  
        Max=g;  
        Level = i;  
    end  
end

Level=Level/256;