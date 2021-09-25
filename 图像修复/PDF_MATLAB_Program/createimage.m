function newim = createimage( im,u,Flag )
%%% �Ӻ�����createimage()ʵ�ֵ�ǰ��ˮƽ�����ݻ����ߣ���ԭͼ�ϵ���ʾ
%%%         ��Ƕ�뺯��u�����³�ʼ��
%%% ����˵����
%%% im     - ԭʼͼ��
%%% u      - ��ǰˮƽ������
%%% Flag   - �Ƿ�������³�ʼ���ı�־��0����1����
%%% newim  - ���صĵ�ǰ��ˮƽ������ɫ���ߣ�������ԭͼ�ϵ���ͼ��

[nny,nnx]=size(im);
curvIndex=zeros(5*nnx*nny,2);
curvImag=zeros([nny,nnx]);
num=0;
%%- ��ǵ�ǰ��ˮƽ��
for i = 2 : nnx - 1
    for j = 2 : nny - 1
        if u(i,j)<0  & (u(i+1,j)>0 | u(i-1,j)>0 | u(i,j+1)>0 | u(i,j-1)>0)
            num=num+1; curvIndex(num,1)=i;curvIndex(num,2)=j;
            curvImag(i,j)=255;
        end
    end
end
%%- ��ԭͼ����ʾ��ǰ��ˮƽ��
tempim = im;
tempim(curvImag>0) = 255;
newim( :, :, 1 ) = tempim;
tempim(curvImag>0) = 0;
newim( :, :, 2 ) = tempim;
newim( :, :, 3 ) = tempim;
newim = uint8( newim );

%%- ���Flag=1�������³�ʼ��u
if Flag
    new_u = zeros(nnx,nny);
    dist=zeros(1,num);
    for j=1:nny
        for i=1:nnx
            for k=1:num
                dist(k)=sqrt((i-curvIndex(k,1)).^2+(j-curvIndex(k,2)).^2);
            end
            new_u(i,j)=min(dist);
            if u(i,j)<0
                new_u(i,j)=-new_u(i,j);
            end
        end
    end
    u=new_u;
end

