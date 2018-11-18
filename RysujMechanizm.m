function [] = RysujMechanizm(wymiary,katy);
% S³u¿y do wizualizacji rozwiazania problemu polozen

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

punkty = zeros(11,2);
punkty(1,1) = 0;
punkty(1,2) = ramie_glowne_nadziemia;
punkty(2,:) = punkty(1,:) + (R(katy(1))*m1)';
punkty(3,:) = punkty(1,:) + (R(katy(1))*m2)';
punkty(4,:) = punkty(1,:) + (R(katy(1))*m3)';
punkty(5,:) = punkty(4,:) + (R(katy(4))*m4)';
punkty(6,:) = punkty(4,:) + (R(katy(4))*m5)';
punkty(7,:) = punkty(4,:) + (R(katy(4))*m7)';
punkty(8,:) = punkty(4,:) + (R(katy(4))*m6)';
punkty(9,:) = punkty(8,:) + (R(katy(6))*[czworobok1_dlugosc;0])';
punkty(10,:) = punkty(9,:) - (R(katy(7))*[czworobok2_dlugosc;0])';
punkty(11,:) = punkty(1,:) + [platforma_obrotowa_mocowanie_s1_x,-platforma_obrotowa_mocowanie_s1_y];
figure
hold on
glowne = [punkty(1,:);punkty(3,:);punkty(4,:);punkty(2,:)];
fill(glowne(:,1),glowne(:,2),'r');
ramie = [punkty(4,:);punkty(5,:);punkty(6,:);punkty(8,:);punkty(7,:)];
fill(ramie(:,1),ramie(:,2),'r');
fill(punkty(8:9,1),punkty(8:9,2),'r');
fill(punkty(9:10,1),punkty(9:10,2),'y');
fill([punkty(11,1);punkty(2,1)],[punkty(11,2);punkty(2,2)],'y');
hold off
end

