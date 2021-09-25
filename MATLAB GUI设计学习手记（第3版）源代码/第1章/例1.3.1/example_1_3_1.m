tic;
j = 0;
data = zeros(1, 100);
for i = 5 : 100000
    n = 1 + floor(log10(i));
    if i == mod(i^2, 10^n)
        j = j + 1;
        data(j) = i;
    end
end
answer = data(1 : j)
toc

