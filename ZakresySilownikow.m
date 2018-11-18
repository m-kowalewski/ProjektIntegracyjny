function [zakres] = ZakresySilownikow(wymiary)
% Generuje zakres jakie musza spelniac silowniki by zadanie 
% na polozenia mialo rozwiazanie
% Przypisanie danych do zmiennych
ramie_glowne_dlugosc = wymiary(1);
ramie_glowne_przedramie = wymiary(2);
ramie_glowene_zagiecie = wymiary(3);
ramie_lyzki_dlugosc = wymiary(4);
ramie_glowne_mocowanie_s2_x = wymiary(5);
ramie_glowne_mocowanie_s1_x = wymiary(6);
ramie_glowne_mocowanie_s1_y = wymiary(7);
ramie_glowne_mocowanie_s2_y = wymiary(8);
ramie_lyzki_mocowanie_s3_y = wymiary(9);
ramie_lyzki_mocowanie_s3_x = wymiary(10);
ramie_lyzki_mocowanie_s2_x = wymiary(11);
ramie_lyzki_mocowanie_s2_y = wymiary(12);
ramie_lyzki_mocowanie_czworobok_x= wymiary(13);
ramie_lyzki_mocowanie_czworobok_y= wymiary(14);
czworobok1_dlugosc = wymiary(15);
czworobok2_dlugosc = wymiary(16);
platforma_obrotowa_mocowanie_s1_x = wymiary(17);
platforma_obrotowa_mocowanie_s1_y = wymiary(18);
ramie_glowne_nadziemia = wymiary(19);
lyzka_rozstaw_mocowania = wymiary(20);

m1 = [ramie_glowne_mocowanie_s1_x; -ramie_glowne_mocowanie_s1_y];
m2 = [ramie_glowne_mocowanie_s2_x; ramie_glowne_mocowanie_s2_y];
b = acos(-(ramie_glowene_zagiecie^2 - ramie_glowne_przedramie^2 - ramie_glowne_dlugosc^2)/(2*ramie_glowne_przedramie *ramie_glowne_dlugosc));
m3 = ramie_glowne_dlugosc * [cos(b);-sin(b)];
m4 = [-ramie_lyzki_mocowanie_s2_x;ramie_lyzki_mocowanie_s2_y];
m5 = [ramie_lyzki_mocowanie_s3_x;ramie_lyzki_mocowanie_s3_y];
m6 = [ramie_lyzki_mocowanie_czworobok_x;ramie_lyzki_mocowanie_czworobok_y];
m7 = [ramie_lyzki_dlugosc;0];
m8 = [lyzka_rozstaw_mocowania;0];

m9 = [platforma_obrotowa_mocowanie_s1_x;platforma_obrotowa_mocowanie_s1_y];
zakres = zeros(3,2);
zakres(1,:) = [abs(norm(m1) - norm(m9)),norm(m1) + norm(m9),];
zakres(2,:) = [abs(norm(m2-m3) - norm(m4)),norm(m2-m3) + norm(m4)];
zakres(3,:) = [abs(norm(m5-m6) - czworobok1_dlugosc),norm(m5-m6) + czworobok1_dlugosc];
end

