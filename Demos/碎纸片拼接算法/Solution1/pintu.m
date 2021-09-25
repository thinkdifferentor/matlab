% ∆Ù∑¢ ΩÀ„∑® 1
function [ output ] = pintu( A,cellx )
    %PINTU Summary of this function goes here
    % Detailed explanation goes here
    n=length(A);
    start=A(floor(n*rand())+1);
    %n=min(n,15);
    xuhao=[start];
    biaoji=[start duimian(start)];
    changdu=1;
    mypic=cellx{start}.pic;
    
    for j=1:min(n,20)-1
        temp=1000000;
        for i=1:n
            nn=length(cellx{A(i)}.id)+changdu;
            if(length(find(biaoji==A(i)))==0&&length(find(cellx{start}.no==A(i)))==0&&nn<20)
                if(length(find(xuhao==A(i)))==0&&length(find(cellx{A(i)}.no==start))==0&&nn<20)
                    % q=cellx{start}.right-cellx{A(i)}.left;29
                    q=cellx{A(i)}.right-cellx{start}.left;
                    % gg=sum(abs(q));
                    gg=sum(q.*q);
                    
                    if(gg<temp)
                        temp=gg;
                        ww=A(i);
                    end
                end
            end
            if(temp<10000)
                start=ww;
                biaoji=[biaoji start duimian(start)];
                % xuhao=[xuhao start];
                xuhao=[start xuhao ];
                % mypic=[mypic zeros(180,3) cellx{start}.pic];
                mypic=[cellx{start}.pic zeros(180,3) mypic];
                changdu=changdu+length(cellx{start}.id);
            end
        end
        imshow(mypic)
        output=xuhao;
    end

end
