function []=showFilts(ws,siz)
 
nFilts=size(ws,2);
N=ceil(sqrt(nFilts));
for i=1:nFilts
    subplot(N,N,i);
    show(reshape(ws(:,i),siz));
    axis off;
end
