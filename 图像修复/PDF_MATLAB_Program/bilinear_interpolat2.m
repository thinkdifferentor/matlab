% function I_out=bilinear_interpolat2(I_in,N,D)
function I_out=bilinear_interpolat2(I_in,N)
%%% 子函数: bilinear_interpolat2()采用双线形插值实现图像放大
%%% 参数说明：
%%% I_in   - 输入待放大图像
%%% N      - 放大系数
%%% I_out  - 返回的放大图像

[nrow,ncol]=size(I_in);
I_out=zeros(N*(nrow-1)+1,N*(ncol-1)+1);
for ii=1:N+1
   for jj=1:N+1
       B1(ii,jj)=(1-(ii-1)/N)*(1-(jj-1)/N); B2(ii,jj)=(1-(ii-1)/N)*(jj-1)/N;
       B3(ii,jj)=((ii-1)/N)*((jj-1)/N); B4(ii,jj)=((ii-1)/N)*(1-(jj-1)/N);
   end
end

for i=1:nrow-1
   for j=1:ncol-1
      for ii=1:N+1
         for jj=1:N+1
             I_out((i-1)*N+ii,(j-1)*N+jj)=I_in(i,j)*B1(ii,jj)+I_in(i,j+1)*B2(ii,jj)+...
                       I_in(i+1,j+1)*B3(ii,jj)+I_in(i+1,j)*B4(ii,jj);
         end
      end
   end
end
% I_out(N*(nrow-1)+1,N*(ncol-1)+1)=I_in(nrow,ncol);