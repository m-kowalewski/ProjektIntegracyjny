function [obciazenia] = WyznaczSily(wymiary,katy,Fx,Fy,M)
% Funkcja zwracajaca obciazenia w wezlach
% (patrz na scheme) 
% Fx Fy M to obciazenie zastepcze dzialajace na lyzke
% (schemat obliczenia tez w schemie)

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

Macierz = zeros(11);
% Rownanie 1 RAMIE_GLOWNE_X
Macierz(1,1) = 1;
Macierz(1,3) = cos(katy(2));
Macierz(1,4) = -cos(katy(3));
Macierz(1,5) = -1;
% Rownanie 2 RAMIE_GLOWNE_Y
Macierz(2,2) = 1;
Macierz(2,3) = sin(katy(2));
Macierz(2,4) = -sin(katy(3));
Macierz(2,6) = -1;
% Rownanie 3 RAMIE_GLOWNE_M
Macierz(3,3) = Moment(katy(1),m1,[cos(katy(2)),sin(katy(2))]);
Macierz(3,4) = -Moment(katy(1),m2,[cos(katy(3)),sin(katy(3))]);
Macierz(3,5) = -Moment(katy(1),m3,[1,0]);
Macierz(3,6) = -Moment(katy(1),m3,[0,1]);
% Rownanie 4 RAMIE_LYZKI_X
Macierz(4,4) = cos(katy(3));
Macierz(4,5) = 1;
Macierz(4,7) = cos(katy(5));
Macierz(4,8) = -cos(katy(6));
Macierz(4,10) = -1;
% Rownanie 5 RAMIE_LYZKI_Y
Macierz(5,4) = sin(katy(3));
Macierz(5,6) = 1;
Macierz(5,7) = sin(katy(5));
Macierz(5,8) = -sin(katy(6));
Macierz(5,11) = -1;
% Rownanie 6 RAMIE_LYZKI_M
Macierz(6,4) = Moment(katy(4),m4,[cos(katy(3)),sin(katy(3))]);
Macierz(6,7) = Moment(katy(4),m5,[cos(katy(5)),sin(katy(5))]);
Macierz(6,8) = -Moment(katy(4),m6,[cos(katy(6)),sin(katy(6))]);
Macierz(6,10) = -Moment(katy(4),m7,[1,0]);
Macierz(6,11) = -Moment(katy(4),m7,[0,1]);
% Rownanie 7 ROWNOWAGA PUNKTU LACZENIA CZWOROBOKU Z SILOWNIKIEM X
Macierz(7,7) = -cos(katy(5));
Macierz(7,8) = cos(katy(6));
Macierz(7,9) = cos(katy(7));
% Rownanie 8 ROWNOWAGA PUNKTU LACZENIA CZWOROBOKU Z SILOWNIKIEM Y
Macierz(8,7) = -sin(katy(5));
Macierz(8,8) = sin(katy(6));
Macierz(8,9) = sin(katy(7));
% Rownanie 9 ROWNOWAGA LOPATY X
Macierz(9,9) = -cos(katy(7));
Macierz(9,10)= 1;
% Rownanie 10 ROWNOWAGA LOPATY Y
Macierz(10,9) = -sin(katy(7));
Macierz(10,11)= 1;
% Rownanie 11 ROWNOWAGA LOPATY M
Macierz(11,10)=-Moment(katy(8),m8,[cos(katy(7)),sin(katy(7))]);

% Przypisanie obciezen do wektora obciazen - tutaj tylko lopata jest
% obciazona wiec luzik
Obciazenia = zeros(11,1);
Obciazenia(9,1) = -Fx;
Obciazenia(10,1) = -Fy;
Obciazenia(11,1) = -M;

obciazenia = Macierz\Obciazenia;
end

