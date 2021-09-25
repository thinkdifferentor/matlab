clear;clc;

zakres_d = -10;
zakres_g = 10;
iksy = zakres_d:0.5:zakres_g;
igreki = zakres_d:0.5:zakres_g;
[X,Y] = meshgrid(iksy,igreki);

Z = fun3(X,Y);
fun = @(x)fun3(x(1),x(2));
x0 = [-0.5,1];
trueMin = fminsearch(fun,x0);
trueZmin = fun3(trueMin(1),trueMin(2));

%Liczba wymiarow
dim = 2;
%Populacja pocz kowa
N = 100;
%Liczba przyciagajacych agentow
K0 = N;
%Poczkowa sta grawitacji
G = 20;
iter = 3000;
%Ma sta do zapobiegania osobliwoi
Epsilon = 1e-15;
%Wektory prêdkoœci i przyspiesze?zainicjowane na 0
V = zeros(N,2);
A = zeros(N,2);
%poczatkowe losowe pozycje
P = (rand(N,2)-0.5)*(zakres_g-zakres_d);
%Poczatkowe wartosci funkcji celu
Zc = fun3(P(:,1),P(:,2));
%Masa aktywna, bierna i bezw³adnoœci
M = (Zc - min(Zc)) / (max(Zc) - min(Zc));
pop = [P V A M];
i = 1;

odleglosc_najlepszego = zeros(1,iter);
odleglosc_srednia = zeros(1,iter);
z_najlepszego = zeros(1,iter);
z_srednie = zeros(1,iter);

while i <= iter
    % Wyznacz G i K
    G = G * 0.999;
    K = K0;
    % Wyznaczenie funkcji celu
    Zc = fun3(P(:,1),P(:,2));
    z_srednie(i) = mean(Zc) - trueZmin;
    z_najlepszego(i) = min(Zc) - trueZmin;
    % Zamien na problem minimalizacji
    Zc = trueZmin - Zc;
    % Zmodyfikuj M przez dobre i z³e rozwi¹zania, posortuj
    M = (Zc - min(Zc)) / ((max(Zc) - min(Zc)) + Epsilon);
    M = M + Epsilon;
    pop(:,7) = M;
    % Wyznacz F i a
    pop = sortrows(pop,7);
    % Posortuj pozostale tablice
    P = pop(:,1:2);
    % Przy okazji wylicz odleglosci od minimum
    distances = ((P(:,1) - (ones(N,1) * trueMin(1))).^2 + ...
                 (P(:,2) - (ones(N,1) * trueMin(2))).^2).^(0.5);
    odleglosc_najlepszego(i) = distances(end);
    odleglosc_srednia(i) = mean(distances);
    V = pop(:,3:4);
    A = pop(:,5:6);
    M = pop(:,7);
    % Odleglosci punktow od siebie
    R = zeros(N);
    diffs = zeros(N,N,dim);
    F = zeros(N,N,dim);
    iloczyn_mas = zeros(N);
    % Wyznacz wzajemne odleglosci dla kazdego wymiaru
    for j = 1:1:dim
        for k = 1:N
            diffs(k,:,j) = P(:,j)-ones(N,1)*P(k,j);
        end
    end
    % Wyznacz odleglosi kartezjanskie kazdego z kazdym i iloczy mas
    for j = 1:1:N
        R(j,:) = (diffs(:,j,1).^2 + diffs(:,j,2).^2).^(0.5);
        iloczyn_mas(j,:) = ones(N,1)*M(j).*M;
    end
    % Wyznacz sily w kazdym wymiarze
    for j = 1:1:dim
        for k = 1:N
            F(:,k,j) = (G * iloczyn_mas(:,k) ./ ...
                       (R(:,k) + ones(N,1) * Epsilon)) .* diffs(:,k,j);
        end
    end
    %Wyznacz calkowite sily dzialajace na kazdego agenta w kazdym wymiarze
    F_wynikowe = zeros(N,dim);
    Kbest = ceil(((iter - i) / iter) * K0);
    for j = 1:1:dim
        for k = 1:1:N
            % Tylko K0 najlepszych. Najlepsze sa na koncu.
            F_wynikowe(k,j) = F(k,K0-Kbest+1:N,j) * rand(Kbest,1);
        end
    end
    % Epsylon dla zapobie¿enia dzieleniu przez zero
    A = F_wynikowe ./ (Epsilon + [M M]);
    % Wyznaczenie prêdkoœci
    V = V * rand() + A;
    % Wyznaczenie nowej pozcji
    P = P + V;
    % Przypisz nowych osobników
    pop = [P V A M];
    i = i + 1;
end

found_min = P(end,:);
true_min_distance = odleglosc_najlepszego(end)
figure('NumberTitle', 'off', 'Name', 'Final placement of individuals');
hold on
surface(X,Y,Z)
view(2)
plot3(pop(:,1),pop(:,2), ...
      fun3(pop(:,1),pop(:,2))+0.1, ...
      'ro','markers',10,'LineWidth',4)
figure('NumberTitle', 'off', 'Name', 'Distance from true minimum - best');
plot(odleglosc_najlepszego)
figure('NumberTitle', 'off', 'Name', 'Distance from true minimum - average');
plot(odleglosc_srednia)
figure('NumberTitle', 'off', 'Name', 'Difference between found and true minimum value - best');
plot(z_najlepszego)
figure('NumberTitle', 'off', 'Name', 'Difference between found and true minimum value - average');
plot(z_srednie)

