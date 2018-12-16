function [obciazenie] = GenObciazenie(katy,lyzka_odleglosc,lyzka_srodek,czyPiasek,czySkrawanieLyzka,czySkrawanieRamieniem)
% Funkcja generuje obciazenie w zaleznosci od wlaczonych modulow obciazenia
% zalecane jest branie oddzielnie skrawania - w sumie operator bierze jedno
% opcje
obciazenie = zeros(3,1);
if czyPiasek == 1
    % Waga Max piasku
    piasek = 500;
    piasek = 3500;
    obciazenie(2,1) = obciazenie(1,1) - piasek;
    obciazenie(3,1) = obciazenie(3,1) + Moment(katy(8),lyzka_srodek,[0,-piasek]);
end
if czySkrawanieLyzka == 1
    sila_Lyzka = 13000;
%     test = abs(pi/2 - katy(8) + katy(4));
%     test2 = pi + katy(4) - katy(1);
%     test3 = katy(1);
%     if test <= pi/6 & test2 >= pi/3 & test3 <= pi/4
%         sila_Lyzka = 13000;
%     end
    sila_v = sila_Lyzka*[cos(katy(8));sin(katy(8))];
    obciazenie(1:2,1) = obciazenie(1:2,1) + sila_v;
    obciazenie(3,1) = obciazenie(3,1) + Moment(katy(8),[0;-lyzka_odleglosc],sila_v);
end
if czySkrawanieRamieniem == 1
    sila_Ramieniem = 8000;
    % to potraktowalem jak ciagniecie za pomoca ramienia
    sila_r = sila_Ramieniem*[cos(pi/2+katy(4));sin(pi/2+katy(4))];
    obciazenie(1:2,1) = sila_r;
end
end

