function [sily] = GenSilySkrawanieLyzka(wymiary,lyzka_odleglosc,lyzka_srodek,pokrycie)
%Funcja wygeneruje sily pod wplywem noszenia piasku
sily = zeros(length(pokrycie),11);
for i=1:length(pokrycie)
   % przypisanie danych do normalnych zmiennych
   katy = pokrycie(i,6:13);
   if katy ~= zeros(1,8)
       obciazenie = GenObciazenie(katy,lyzka_odleglosc,lyzka_srodek,0,1,0);
       sily(i,:) = WyznaczSily(wymiary,katy,obciazenie(1,1),obciazenie(2,1),obciazenie(3,1));
   end         
end
end

