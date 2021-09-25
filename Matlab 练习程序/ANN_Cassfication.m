%神经网络分类--没有隐含层，1个偏置量
clear all;
close all;
clc;

n=5;
randn('seed',1);
mu1=[0 0];
S1=[0.5 0;
    0 0.5];
P1=mvnrnd(mu1,S1,n);

mu2=[0 6];
S2=[0.5 0;
    0 0.5];
P2=mvnrnd(mu2,S2,n);

mu3=[6 3];
S3=[0.5 0;
    0 0.5];
P3=mvnrnd(mu3,S3,n);


P=[P1;P2;P3];
meanP=mean(P);

P=[P(:,1)-meanP(1) P(:,2)-meanP(2)];

sigma = 5;

X=P(:,1);
Y=P(:,2);
B=rand(3*n,1);

w1 = rand(3*n,1);
w2 = rand(3*n,1);
w3 = rand(3*n,1);

w4 = rand(3*n,1);
w5 = rand(3*n,1);
w6 = rand(3*n,1);


for i=1:3*n
    i
    while 1
        
        y1 = X(i)*w1(i) + Y(i)*w4(i) + B(i);       
        y2 = X(i)*w2(i) + Y(i)*w5(i) + B(i);        
        y3 = X(i)*w3(i) + Y(i)*w6(i) + B(i);     
        
        h1 = 1/(1+exp(-y1));
        h2 = 1/(1+exp(-y2));       
        h3 = 1/(1+exp(-y3));      
        
        e1  = 1/2*(1 - h1)^2;
        e2  = 1/2*(1 - h2)^2;       
        e3  = 1/2*(1 - h3)^2;
 
        if i<=n && e1<=0.0000001
            break;
        elseif i>n && i<=2*n && e2<0.0000001
            break;
        elseif i>2*n && e3<0.0000001
            break;
        end
        
        
        if i<=n
            w1(i) = w1(i)-sigma*(h1-1)*h1*(1-h1)*X(i);
            w2(i) = w2(i)-sigma*(h2-0)*h2*(1-h2)*X(i);
            w3(i) = w3(i)-sigma*(h3-0)*h3*(1-h3)*X(i);    
            
            w4(i) = w4(i)-sigma*(h1-1)*h1*(1-h1)*Y(i);
            w5(i) = w5(i)-sigma*(h2-0)*h2*(1-h2)*Y(i);
            w6(i) = w6(i)-sigma*(h3-0)*h3*(1-h3)*Y(i);                   
            
            B(i) =B(i)- sigma*((h1-1)*h1*(1-h1)+(h2-0)*h2*(1-h2)+(h3-0)*h3*(1-h3));
        elseif i>n && i<=2*n
            w1(i) = w1(i)-sigma*(h1-0)*h1*(1-h1)*X(i);
            w2(i) = w2(i)-sigma*(h2-1)*h2*(1-h2)*X(i);
            w3(i) = w3(i)-sigma*(h3-0)*h3*(1-h3)*X(i);    
            
            w4(i) = w4(i)-sigma*(h1-0)*h1*(1-h1)*Y(i);
            w5(i) = w5(i)-sigma*(h2-1)*h2*(1-h2)*Y(i);
            w6(i) = w6(i)-sigma*(h3-0)*h3*(1-h3)*Y(i);                   
            
            B(i) =B(i)- sigma*((h1-0)*h1*(1-h1)+(h2-1)*h2*(1-h2)+(h3-0)*h3*(1-h3));         
        else
            w1(i) = w1(i)-sigma*(h1-0)*h1*(1-h1)*X(i);
            w2(i) = w2(i)-sigma*(h2-0)*h2*(1-h2)*X(i);
            w3(i) = w3(i)-sigma*(h3-1)*h3*(1-h3)*X(i);    
            
            w4(i) = w4(i)-sigma*(h1-0)*h1*(1-h1)*Y(i);
            w5(i) = w5(i)-sigma*(h2-0)*h2*(1-h2)*Y(i);
            w6(i) = w6(i)-sigma*(h3-1)*h3*(1-h3)*Y(i);                   
            
            B(i) =B(i)- sigma*((h1-0)*h1*(1-h1)+(h2-0)*h2*(1-h2)+(h3-1)*h3*(1-h3));                   
        end
         

    end
end

plot(P(:,1),P(:,2),'o');
hold on;

flag = 0;
M=[];
for x=-8:0.3:8
    for y=-8:0.3:8

        H=[]; 
        for i=1:3*n
            y1 = x*w1(i)+y*w4(i) +B(i);
            y2 = x*w2(i)+y*w5(i) +B(i);
            y3 = x*w3(i)+y*w6(i) +B(i);
            h1=1/(1+exp(-y1));
            h2=1/(1+exp(-y2));
            h3=1/(1+exp(-y3));
            
            H=[H;h1 h2 h3];
        end
  %      H1 = mean(H(1:n,1));
  %      H2 = mean(H(n:2*n,2));
  %      H3 = mean(H(2*n:3*n,3));
        
        meanH = mean(H);
        H1 = meanH(1);
        H2 = meanH(2);
        H3= meanH(3);
        if H1>H2 && H1>H3
            plot(x,y,'g.')
        elseif H2 > H1 && H2 > H3
            plot(x,y,'r.')
        elseif H3 > H1 && H3 > H2
            plot(x,y,'b.')
        end
        
    end
end



%% 有1个隐含层，2个偏置量
clear all;
close all;
clc;

n=5;
randn('seed',1);
mu1=[0 0];
S1=[0.5 0;
    0 0.5];
P1=mvnrnd(mu1,S1,n);

mu2=[0 6];
S2=[0.5 0;
    0 0.5];
P2=mvnrnd(mu2,S2,n);

mu3=[6 3];
S3=[0.5 0;
    0 0.5];
P3=mvnrnd(mu3,S3,n);


P=[P1;P2;P3];
meanP=mean(P);

P=[P(:,1)-meanP(1) P(:,2)-meanP(2)];

sigma = 5;

X=P(:,1);
Y=P(:,2);

B1=rand(3*n,1);
B2=rand(3*n,1);

w1 = rand(3*n,1);
w2 = rand(3*n,1);

w3 = rand(3*n,1);
w4 = rand(3*n,1);
w5 = rand(3*n,1);

for i=1:3*n
    i
    while 1
        
        y0 = X(i)*w1(i) + Y(i)*w2(i) + B1(i);  
        h0 = 1/(1+exp(-y0));  
              
        y1 = h0*w3(i) + B2(i);        
        y2 = h0*w4(i) + B2(i);     
        y3 = h0*w5(i) + B2(i);
        
        h1 = 1/(1+exp(-y1));       
        h2 = 1/(1+exp(-y2));      
        h3 = 1/(1+exp(-y3));
        
        e1  = 1/2*(1 - h1)^2;
        e2  = 1/2*(1 - h2)^2;       
        e3  = 1/2*(1 - h3)^2;
 
        if i<=n && e1<=0.0000001
            break;
        elseif i>n && i<=2*n && e2<0.0000001
            break;
        elseif i>2*n && e3<0.0000001
            break;
        end
               
        %e1
        if i<=n
            
            w1(i) = w1(i)- sigma*((h1-1)*h1*(1-h1)*w3(i)*h0*(1-h0)*X(i) + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)*X(i) + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0)*X(i));      
            w2(i) = w2(i)- sigma*((h1-1)*h1*(1-h1)*w3(i)*h0*(1-h0)*Y(i) + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)*Y(i) + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0)*Y(i));           
            B1(i) = B1(i)- sigma*((h1-1)*h1*(1-h1)*w3(i)*h0*(1-h0)      + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)      + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0));
            
            w3(i) = w3(i)-sigma*(h1-1)*h1*(1-h1)*h0;              
            w4(i) = w4(i)-sigma*(h2-0)*h2*(1-h2)*h0;
            w5(i) = w5(i)-sigma*(h3-0)*h3*(1-h3)*h0;
            B2(i) =B2(i)- sigma*((h1-1)*h1*(1-h1)+(h2-0)*h2*(1-h2)+(h3-0)*h3*(1-h3));   
                          
        elseif i>n && i<=2*n
            w1(i) = w1(i)-sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)*X(i) + (h2-1)*h2*(1-h2)*w4(i)*h0*(1-h0)*X(i) + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0)*X(i));      
            w2(i) = w2(i)-sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)*Y(i) + (h2-1)*h2*(1-h2)*w4(i)*h0*(1-h0)*Y(i) + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0)*Y(i));           
            B1(i) =B1(i)- sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)      + (h2-1)*h2*(1-h2)*w4(i)*h0*(1-h0)      + (h3-0)*h3*(1-h3)*w5(i)*h0*(1-h0));
            
            w3(i) = w3(i)-sigma*(h1-0)*h1*(1-h1)*h0;              
            w4(i) = w4(i)-sigma*(h2-1)*h2*(1-h2)*h0;
            w5(i) = w5(i)-sigma*(h3-0)*h3*(1-h3)*h0;
            B2(i) =B2(i)- sigma*((h1-0)*h1*(1-h1)+(h2-1)*h2*(1-h2)+(h3-0)*h3*(1-h3));   
                     
        else
            w1(i) = w1(i)-sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)*X(i) + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)*X(i) + (h3-1)*h3*(1-h3)*w5(i)*h0*(1-h0)*X(i));      
            w2(i) = w2(i)-sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)*Y(i) + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)*Y(i) + (h3-1)*h3*(1-h3)*w5(i)*h0*(1-h0)*Y(i));           
            B1(i) =B1(i)- sigma*((h1-0)*h1*(1-h1)*w3(i)*h0*(1-h0)      + (h2-0)*h2*(1-h2)*w4(i)*h0*(1-h0)      + (h3-1)*h3*(1-h3)*w5(i)*h0*(1-h0));
          
            w3(i) = w3(i)-sigma*(h1-0)*h1*(1-h1)*h0;              
            w4(i) = w4(i)-sigma*(h2-0)*h2*(1-h2)*h0;
            w5(i) = w5(i)-sigma*(h3-1)*h3*(1-h3)*h0;
            B2(i) =B2(i)- sigma*((h1-0)*h1*(1-h1)+(h2-0)*h2*(1-h2)+(h3-1)*h3*(1-h3));   
                             
        end
         

    end
end


plot(P(:,1),P(:,2),'o');
hold on;

flag = 0;
M=[];
for x=-8:0.3:8
    for y=-8:0.3:8
  
       H=[]; 
        for i=1:3*n
            y0 = x*w1(i)+y*w2(i) +B1(i);
            h0=1/(1+exp(-y0));     
            
            y1 = h0*w3(i) + B2(i);
            y2 = h0*w4(i) + B2(i);
            y3 = h0*w5(i) + B2(i);

            h1 =1/(1+exp(-y1));
            h2 =1/(1+exp(-y2));
            h3 =1/(1+exp(-y3));
            
            H=[H;h1 h2 h3];
        end

        meanH = mean(H);
       H1 = meanH(1);
        H2 = meanH(2);
       H3= meanH(3);
        if H1>H2 && H1>H3
            plot(x,y,'g.')
        elseif H2 > H1 && H2 > H3
            plot(x,y,'r.')
        elseif H3 > H1 && H3 > H2
            plot(x,y,'b.')
        end
        
    end
end
%% 有2个隐含层，2个偏置量
clear all;
close all;
clc;

n=5;
randn('seed',1);
mu1=[0 0];
S1=[0.5 0;
    0 0.5];
P1=mvnrnd(mu1,S1,n);

mu2=[0 6];
S2=[0.5 0;
    0 0.5];
P2=mvnrnd(mu2,S2,n);

mu3=[6 3];
S3=[0.5 0;
    0 0.5];
P3=mvnrnd(mu3,S3,n);


P=[P1;P2;P3];
meanP=mean(P);

P=[P(:,1)-meanP(1) P(:,2)-meanP(2)];

sigma = 20;

X=P(:,1);
Y=P(:,2);

B1=rand(3*n,1);
B2=rand(3*n,1);

w1 = rand(3*n,1);
w2 = rand(3*n,1);

w3 = rand(3*n,1);
w4 = rand(3*n,1);

w5 = rand(3*n,1);
w6 = rand(3*n,1);
w7 = rand(3*n,1);

w8 = rand(3*n,1);
w9 = rand(3*n,1);
w10 = rand(3*n,1);

for i=1:3*n
    i
    while 1
        
        y1 = X(i)*w1(i) + Y(i)*w3(i) + B1(i);
        y2 = X(i)*w2(i) + Y(i)*w4(i) + B1(i);
        
        h1 = 1/(1+exp(-y1));  
        h2 = 1/(1+exp(-y2));        
        
        dh1 = h1*(1-h1);
        dh2 = h2*(1-h2);
        
        y3 = h1*w5(i) + h2*w8(i)+ B2(i);        
        y4 = h1*w6(i) + h2*w9(i)+ B2(i);      
        y5 = h1*w7(i) + h2*w10(i)+ B2(i);    
        
        h3 = 1/(1+exp(-y3));       
        h4 = 1/(1+exp(-y4));      
        h5 = 1/(1+exp(-y5));
        
        dh3 = h3*(1-h3);
        dh4 = h4*(1-h4);
        dh5 = h5*(1-h5);
        
        e1  = 1/2*(1 - h3)^2;
        e2  = 1/2*(1 - h4)^2;       
        e3  = 1/2*(1 - h5)^2;
 
        if i<=n && e1<=0.0000001
            break;
        elseif i>n && i<=2*n && e2<0.0000001
            break;
        elseif i>2*n && e3<0.0000001
            break;
        end
               
        %e1
        if i<=n
            
            w1(i) = w1(i) -sigma * ((h3-1)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-0)*dh5*w7(i))  * dh1*X(i);
            w2(i) = w2(i) -sigma * ((h3-1)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-0)*dh5*w10(i)) * dh2*X(i);          
            
            w3(i) = w3(i) -sigma * ((h3-1)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-0)*dh5*w7(i))  * dh1*Y(i);
            w4(i) = w4(i) -sigma * ((h3-1)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-0)*dh5*w10(i)) * dh2*Y(i);       
                     
            B1(i) = B1(i)- sigma*(((h3-1)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-0)*dh5*w7(i))*dh1+((h3-1)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-0)*dh5*w10(i))*dh2);
            
            w5(i) = w5(i)-sigma*(h3-1)*dh3*h1;              
            w6(i) = w6(i)-sigma*(h4-0)*dh4*h1;
            w7(i) = w7(i)-sigma*(h5-0)*dh5*h1;
            
            w8(i) = w8(i)-sigma*(h3-1)*dh3*h2;              
            w9(i) = w9(i)-sigma*(h4-0)*dh4*h2;
            w10(i) = w10(i)-sigma*(h5-0)*dh5*h2;         
            
            B2(i) =B2(i)- sigma*((h3-1)*dh3+(h4-0)*dh4+(h5-0)*dh5);   
                          
        elseif i>n && i<=2*n
            w1(i) = w1(i) -sigma * ((h3-0)*dh3*w5(i)+(h4-1)*dh4*w6(i)+(h5-0)*dh5*w7(i))  * dh1*X(i);
            w2(i) = w2(i) -sigma * ((h3-0)*dh3*w8(i)+(h4-1)*dh4*w9(i)+(h5-0)*dh5*w10(i)) * dh2*X(i);          
            
            w3(i) = w3(i) -sigma * ((h3-0)*dh3*w5(i)+(h4-1)*dh4*w6(i)+(h5-0)*dh5*w7(i))  * dh1*Y(i);
            w4(i) = w4(i) -sigma * ((h3-0)*dh3*w8(i)+(h4-1)*dh4*w9(i)+(h5-0)*dh5*w10(i)) * dh2*Y(i);       
                     
            B1(i) = B1(i)- sigma*(((h3-0)*dh3*w5(i)+(h4-1)*dh4*w6(i)+(h5-0)*dh5*w7(i))*dh1+((h3-0)*dh3*w8(i)+(h4-1)*dh4*w9(i)+(h5-0)*dh5*w10(i))*dh2);
            
            w5(i) = w5(i)-sigma*(h3-0)*dh3*h1;              
            w6(i) = w6(i)-sigma*(h4-1)*dh4*h1;
            w7(i) = w7(i)-sigma*(h5-0)*dh5*h1;
            
            w8(i) = w8(i)-sigma*(h3-0)*dh3*h2;              
            w9(i) = w9(i)-sigma*(h4-1)*dh4*h2;
            w10(i) = w10(i)-sigma*(h5-0)*dh5*h2;         
            
            B2(i) =B2(i)- sigma*((h3-0)*dh3+(h4-1)*dh4+(h5-0)*dh5);   
                     
        else
            w1(i) = w1(i) -sigma * ((h3-0)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-1)*dh5*w7(i))  * dh1*X(i);
            w2(i) = w2(i) -sigma * ((h3-0)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-1)*dh5*w10(i)) * dh2*X(i);          
            
            w3(i) = w3(i) -sigma * ((h3-0)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-1)*dh5*w7(i))  * dh1*Y(i);
            w4(i) = w4(i) -sigma * ((h3-0)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-1)*dh5*w10(i)) * dh2*Y(i);       
                     
            B1(i) = B1(i)- sigma*(((h3-0)*dh3*w5(i)+(h4-0)*dh4*w6(i)+(h5-1)*dh5*w7(i))*dh1+((h3-0)*dh3*w8(i)+(h4-0)*dh4*w9(i)+(h5-1)*dh5*w10(i))*dh2);
            
            w5(i) = w5(i)-sigma*(h3-0)*dh3*h1;              
            w6(i) = w6(i)-sigma*(h4-0)*dh4*h1;
            w7(i) = w7(i)-sigma*(h5-1)*dh5*h1;
            
            w8(i) = w8(i)-sigma*(h3-0)*dh3*h2;              
            w9(i) = w9(i)-sigma*(h4-0)*dh4*h2;
            w10(i) = w10(i)-sigma*(h5-1)*dh5*h2;         
            
            B2(i) =B2(i)- sigma*((h3-0)*dh3+(h4-0)*dh4+(h5-1)*dh5);  
                             
        end
         

    end
end


plot(P(:,1),P(:,2),'o');
hold on;

flag = 0;
M=[];
for x=-8:0.3:8
    for y=-8:0.3:8
   %     x=-1;
   %     y=2;
        H=[]; 
        for i=1:3*n
            y1 = x*w1(i) + y*w3(i) + B1(i);
            y2 = x*w2(i) + y*w4(i) + B1(i);

            h1 = 1/(1+exp(-y1));  
            h2 = 1/(1+exp(-y2));        

            dh1 = h1*(1-h1);
            dh2 = h2*(1-h2);

            y3 = h1*w5(i) + h2*w8(i)+ B2(i);        
            y4 = h1*w6(i) + h2*w9(i)+ B2(i);      
            y5 = h1*w7(i) + h2*w10(i)+ B2(i);    

            h3 = 1/(1+exp(-y3));       
            h4 = 1/(1+exp(-y4));      
            h5 = 1/(1+exp(-y5));
            
            H=[H;h3 h4 h5];
        end
    %    H1 = mean(H(1:n,1));
    %    H2 = mean(H(n+1:2*n,2));
    %    H3 = mean(H(2*n+1:3*n,3));
   
        meanH = mean(H);
        H1 = meanH(1);
        H2 = meanH(2);
        H3= meanH(3);
        
        M=[M;H1 H2 H3 x y];     
        if H1>H2 && H1>H3
            plot(x,y,'g.')
        elseif H2 > H1 && H2 > H3
            plot(x,y,'r.')
        elseif H3 > H1 && H3 > H2
            plot(x,y,'b.')
        end
        
    end
end