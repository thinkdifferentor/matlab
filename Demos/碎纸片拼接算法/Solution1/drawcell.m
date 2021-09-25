% ¸ù¾Ý¾ØÕó»­Í¼³ÌÐò£º
function [ pq ] = drawcell( c,cellx )

    %DRAWCELL Summary of this function goes here
    % Detailed explanation goes here
    n=length(c);
    img=[];

    for i=1:n
        img=[img cellx{c(i)}.pic];
    end

    imshow(img);
    pq=img;
end