function I_mh=biquad_interpolat(I,R)

[m,n]=size(I);
M=R*m-(R-1);
N=R*n-(R-1);
I_mh=zeros(M,N);
for i1=1:R:M
    for j1=1:R:N
        I_mh(i1,j1)=I(floor(i1/R)+1,floor(j1/R)+1);
    end
end
for i1=-R:R
    for j1=-R:R
        u=j1/R; v=-i1/R;
        ii=i1+R+1;jj=j1+R+1;
        N1(ii,jj)=0.25*u*v*(u-1)*(v-1); N2(ii,jj)=0.25*u*v*(u+1)*(v-1); N3(ii,jj)=0.25*u*v*(u+1)*(v+1);
        N4(ii,jj)=0.25*u*v*(u-1)*(v+1); N5(ii,jj)=0.5*u*(u-1)*(1-v^2);  N6(ii,jj)=0.5*v*(v-1)*(1-u^2);
        N7(ii,jj)=0.5*u*(u+1)*(1-v^2);  N8(ii,jj)=0.5*v*(v+1)*(1-u^2);  N9(ii,jj)=(1-u^2)*(1-v^2);
    end
end
for i=R+1:2*R:M-R
    for j=R+1:2*R:N-R
        A1=I_mh(i+R,j-R);         A2=I_mh(i+R,j+R);         A3=I_mh(i-R,j+R);
        A4=I_mh(i-R,j-R);         A5=I_mh(i,j-R);           A6=I_mh(i+R,j);
        A7=I_mh(i,j+R);           A8=I_mh(i-R,j);           A9=I_mh(i,j);
        for i1=-R:R
            for j1=-R:R
                ii=i1+R+1;jj=j1+R+1;
                I_mh(i+i1,j+j1)=A1*N1(ii,jj)+A2*N2(ii,jj)+A3*N3(ii,jj)+A4*N4(ii,jj)+...
                   A5*N5(ii,jj)+A6*N6(ii,jj)+A7*N7(ii,jj)+A8*N8(ii,jj)+A9*N9(ii,jj);
            end
        end
    end
end