%蚁群算法--MATLAB实现
clear,clc;
close all;

C=[-15 0 0 0.300
    -5 0 0 0.300
    5 0 0 0.300
    15 0 0 0.300
    -20 60 0.100 -0.200
    -10 60 0.110 -0.190
    0 80 -0.100 -0.210
    0 70 -0.80 -0.210
    0 50 0.90 -0.200
    0 40 0.90 -0.220 
    10 60 -0.90 -0.220
    20 60 -0.120 -0.170];

figure(1)
scatter(C(:,1),C(:,2));
X=C(:,1);
Y=C(:,2);
plot(X(1),Y(1),'r');
hold on;
grid on;
plot(X(5),Y(5),'bo');
hold on;
grid on;
for j=2:4
    plot(X(j),Y(j),'r');
end
for j=6:12
    plot(X(j),Y(j),'bo');
end
legend('red UCAV','blue UCAV',1);
text(C(1,1)+1,C(1,2),'1');
text(C(2,1)+1,C(2,2),'2');
text(C(3,1)+1,C(3,2),'3');
text(C(4,1)+1,C(4,2),'4');
text(C(5,1)+1,C(5,2),'5');
text(C(6,1)+1,C(6,2),'6');
text(C(7,1)+1,C(7,2),'7');
text(C(8,1)+1,C(8,2),'8');
text(C(9,1)+1,C(9,2),'9');
text(C(10,1)+1,C(10,2),'10');
text(C(11,1)+1,C(11,2),'11');
text(C(12,1)+1,C(12,2),'12');

C1=C(5:12,1:4);
red=C(1:4,3:4);
blue=C(5:12,3:4);
vred=zeros(1,4);
vblue=zeros(1,8);
S=zeros(4,8);

Dred=[120 120 120 120];
Dblue=[110 110 110 110 110 110 110 110];

kv=0.5;
ka=0.4;
kw=0.1;
for j=1:4
    vred(j)=(red(j,1)^2+red(j,2)^2)^0.5;
    angred(j)=angle(red(j,1)+blue(j,2)*i);
end

for j=1:8
    vblue(j)=(blue(j,1)^2+blue(j,2)^2)^0.5;
    angblue(j)=angle(blue(j,1)+blue(j,2)*i);
end

for p=1:4
    for q=1:8
        z(p,q)=(C(q+3,1)-C(p,1))+(C(q+3,2)-C(p,2))*i;
    end
end
rel=angle(z);
clear p;
clear q;
for i=1:4
    for j=1:8
        if(vred(i)-vblue(j))>0.1
            Sv(i,j)=1;
        elseif(vred(i)-vblue(j))<-0.1
               Sv(i,j)=-0.1;
        else
               Sv=vred(i)-vblue(j);
        end
        Sa(i,j)=((rel(i,j)-angblue(j)+pi)-(angred(i)-rel(i,j)))/pi;
        if(Dred(i)-Dblue(j))>10;
            Sw(i,j)=1;
        elseif(Dred(i)-Dblue(j))<-10
            Sw(i,j)=-1;
        else
            Sw(i,j)=Dred(i)-Dblue(j)/10;
        end
    end
end
S=kv*Sv+ka*Sa+kw*Sw;
maxS=0;
for i=1:4
    for j=1:8
        if S(i,j)>=maxS
            maxS=S(i,j);
        end
    end
end
Scity=(maxS-S).';

NCmax=100;
m=4;
aerfa=1;
beta=5;
rou=0.9;
Q=200;
w=0.8;
n=size(C,1);
tabu1=zeros(m,3);
tabu2=zeros(m,3);
tabu3=zeros(m,3);
tabu4=zeros(m,3);
tao=ones(n,n);
q=Q*ones(n,n);
yita=zeros(n,4);
p1=zeros(1,12);
p2=zeros(1,12);
p3=zeros(1,12);
p4=zeros(1,12);
Delta_tao=zeros(n,n);
bestL=inf;
for i=5:12
    for j=1:4
        if Scity(i-4,j)==0
            yita(i,j)=1/eps;
        else
            yita(i,j)=1./Scity(i-4,j);
        end
    end
end


for NC=1:NCmax
    for i=1:m
        waiting=ones(1,n);
        for h=1:2
             tabu1(i,1)=1;
             tabu2(i,1)=2;
             tabu3(i,1)=3;
             tabu4(i,1)=4;
                for k=1:8
                    P1(k+4)=(yita(k+4,1)^beta)*(tao(k,tabu1(i,h))^aerfa);
                    P2(k+4)=(yita(k+4,2)^beta)*(tao(k,tabu2(i,h))^aerfa);
                    P3(k+4)=(yita(k+4,3)^beta)*(tao(k,tabu3(i,h))^aerfa);
                    P4(k+4)=(yita(k+4,4)^beta)*(tao(k,tabu4(i,h))^aerfa);
                end
                
                sum_P1=sum(P1);
                sum_P2=sum(P2);
                sum_P3=sum(P3);
                sum_P4=sum(P4);
                
                for k=5:12
                    P1(k)=P1(k)/sum_P1;
                    P2(k)=P2(k)/sum_P2;
                    P3(k)=P3(k)/sum_P3;
                    P4(k)=P4(k)/sum_P4;
                end 
                
                for j=5:n
                    if(h==2)&(waiting(j)==0)
                        P1(j)=0;
                    end
                end
                
                maxp1=max(P1);
                for j=5:n
                    if P1(j)==maxp1
                        tabu1(i,h+1)=j;
                        waiting(j)=0;
                    end
                    if waiting(j)==0
                        P2(j)=0;
                    end
                end
                
                maxp2=max(P2);
                for j=5:n
                     if P2(j)==maxp2
                        tabu2(i,h+1)=j;
                        waiting(j)=0;
                    end
                    if waiting(j)==0
                        P3(j)=0;
                    end
                end
                
                 maxp3=max(P3);
                for j=5:n
                     if P3(j)==maxp3
                        tabu1(i,h+1)=j;
                        waiting(j)=0;
                    end
                    if waiting(j)==0
                        P4(j)=0;
                    end
                end
                
                     maxp4=max(P4);
                for j=5:n
                     if P4(j)==maxp4
                        tabu1(i,h+1)=j;
                        waiting(j)=0;
                    end
                end
                
                for j=5:n
                    if P1(j)==maxp1
                        tabu1(i,h+1)=j;
                    end
                    if P2(j)==maxp2
                        tabu2(i,h+1)=j;
                    end
                    if P3(j)==maxp3
                        tabu3(i,h+1)=j;
                    end
                    if P4(j)==maxp4
                        tabu4(i,h+1)=j;
                    end
                    tao(i,j)=tao(i,j)*(1-w)+w*q(i,j);
                end
        end
    end
    
    L1=zeros(m,1);
    L2=zeros(m,1);
    L3=zeros(m,1);
    L4=zeros(m,1);
    L=zeros(m,1);
    for i=1:m;
        R1=tabu1(i,:);
        R2=tabu2(i,:);
        R3=tabu3(i,:);
        R4=tabu4(i,:);
        for j=1:(n-10)
            L1(i)=L1(i)+Scity(R1(j+1)-4,R1(1));
            L2(i)=L2(i)+Scity(R2(j+1)-4,R2(1));
            L3(i)=L3(i)+Scity(R3(j+1)-4,R3(1));
            L4(i)=L4(i)+Scity(R4(j+1)-4,R4(1));
        end
        L(i)=sum(L1)+sum(L2)+sum(L3)+sum(L4);
    end
    
    L_best(NC)=min(L);
    for k=1:m
    if L_best(NC)==L(k)
         R_best1(NC,:)=tabu1(k,:);
         R_best2(NC,:)=tabu2(k,:);
         R_best3(NC,:)=tabu3(k,:);
         R_best4(NC,:)=tabu4(k,:);
    end
end

ave(NC)=mean(L);

for i=1:m
    for j=1:2
        Delta_tao(tabu2(i,j),tabu2(i,j+1))=Delta_tao(tabu2(i,j),tabu2(i,j+1))+Q/L(i);
    end
    Delta_tao(tabu2(i,j),tabu2(i,1))=Delta_tao(tabu2(i,j),tabu2(i,1))+Q/L(i);
end

for i=1:n
    for j=1:n
        tao(i,j)=tao(i,j)*(1-rou)+Delta_tao(i,j);
    end
end

if L_best(NC)<bestL
    bestL=L_best(NC);
    bestNC=NC;
    bestR1=R_best1(NC,:);
    bestR2=R_best2(NC,:);
    bestR3=R_best3(NC,:);
    bestR4=R_best4(NC,:);
end
NC=NC+1;
end

bestNC
bestL
bestR1
bestR2
bestR3
bestR4

figure(2)
scatter(C(:,1),C(:,2));
X=C(:,1);
Y=C(:,2);

plot(X(1),Y(1),'r^');
hold on;
grid on;
plot(X(5),Y(5),'bo');
hold on;
grid on;
for j=2:4
    plot(X(j),Y(j),'r^');
end
for j=6:12
    plot(X(j),Y(j),'bo');
end
hold on;
grid on;
for i=1:2
    plot([X(bestR1(1)),X(bestR1(i+1))],[Y(bestR1(1)),Y(bestR1(i+1))],'r-.');
    plot([X(bestR2(1)),X(bestR2(i+1))],[Y(bestR2(1)),Y(bestR2(i+1))],'g--.');
    plot([X(bestR3(1)),X(bestR3(i+1))],[Y(bestR3(1)),Y(bestR3(i+1))],'m:');
    plot([X(bestR4(1)),X(bestR4(i+1))],[Y(bestR4(1)),Y(bestR4(i+1))]);
end
legend('red UCAV','blue UCAV',1);
text(C(1,1)+1,C(1,2),'1');
text(C(2,1)+1,C(2,2),'2');
text(C(3,1)+1,C(3,2),'3');
text(C(4,1)+1,C(4,2),'4');
text(C(5,1)+1,C(5,2),'5');
text(C(6,1)+1,C(6,2),'6');
text(C(7,1)+1,C(7,2),'7');
text(C(8,1)+1,C(8,2),'8');
text(C(9,1)+1,C(9,2),'9');
text(C(10,1)+1,C(10,2),'10');
text(C(11,1)+1,C(11,2),'11');
text(C(12,1)+1,C(12,2),'12');
hold off;
figure(3)
plot(ave);