function [x] = ZadaniePolozenie(katy,wymiary,s1,s2,s3)
% Funkcja zwracajaca jak blisko wspolrzedne sa rozwiazania
% zadania na polozenie -> uzyte w WezKaty

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

x(1:2,1) = [platforma_obrotowa_mocowanie_s1_x;-platforma_obrotowa_mocowanie_s1_y] + R(katy(2))*[s1;0] - R(katy(1))*m1;
x(3:4,1) = R(katy(1))*m2 + R(katy(3))*[s2;0] - R(katy(4))*m4 - R(katy(1))*m3;
x(5:6,1) = R(katy(4))*m5 - R(katy(5))*[s3;0] - R(katy(6))*[czworobok1_dlugosc;0] - R(katy(4))*m6;
x(7:8,1) = R(katy(4))*m6 + R(katy(6))*[czworobok1_dlugosc;0] - R(katy(7))*[czworobok2_dlugosc;0] - R(katy(8))*m8- R(katy(4))*m7;
end

