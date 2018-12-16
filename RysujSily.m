function [] = RysujSily(wymiary,katy,lopata,sily, Fx, Fy, M)
%Funkcja rysuje sily dzialajace na kazdy z elementow konstrukcji w
%przy zaznacznia sil w wezlach
mnoznik = 500/max(sily);
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

punkty = zeros(12,2);
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
punkty(12,:) = punkty(7,:) + (R(katy(8))*[0;-lopata])';

FAx = [sily(1);0];
FAy = [0;sily(2)];
S1 = sily(3)*[cos(katy(2));sin(katy(2))];
S2 = sily(4)*[cos(katy(3));sin(katy(3))];
FBx = [sily(5);0];
FBy = [0;sily(6)];
S3 = sily(7)*[cos(katy(5));sin(katy(5))];
L1 = sily(8)*[cos(katy(6));sin(katy(6))];
L2 = sily(9)*[cos(katy(7));sin(katy(7))];
FCx = [sily(10);0];
FCy = [0;sily(11)];

AXIS = [0 4000 -2000 2000];

figure
hold on;
glowne = [punkty(1,:);punkty(3,:);punkty(4,:);punkty(2,:)];
fill(glowne(:,1),glowne(:,2),'r');
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(FAx,mnoznik, punkty(1,:), 'black');
RysujSkladowe(FAy,mnoznik, punkty(1,:), 'black');
RysujSkladowe(S1,mnoznik, punkty(2,:), 'black');
RysujSkladowe(-S2,mnoznik, punkty(3,:), 'black');
RysujSkladowe(-FBx,mnoznik, punkty(4,:), 'black');
RysujSkladowe(-FBy,mnoznik, punkty(4,:), 'black');

check(1:2,1) = (FAx+FAy+S1-S2-FBx-FBy);
check(3,1) = CrossProduct(punkty(1,:),FAx)+CrossProduct(punkty(1,:),FAy)+...
    CrossProduct(punkty(2,:),S1)+CrossProduct(punkty(3,:),-S2)+...
    CrossProduct(punkty(4,:),-FBx)+CrossProduct(punkty(4,:),-FBy);

figure
hold on;
ramie = [punkty(4,:);punkty(5,:);punkty(6,:);punkty(8,:);punkty(7,:)];
fill(ramie(:,1),ramie(:,2),'r');
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(FBx,mnoznik, punkty(4,:), 'black');
RysujSkladowe(FBy,mnoznik, punkty(4,:), 'black');
RysujSkladowe(S2,mnoznik, punkty(5,:), 'black');
RysujSkladowe(S3,mnoznik, punkty(6,:), 'black');
RysujSkladowe(-L1,mnoznik,punkty(8,:), 'black');
RysujSkladowe(-FCx,mnoznik, punkty(7,:), 'black');
RysujSkladowe(-FCy,mnoznik, punkty(7,:), 'black');

check(4:5,1) = (FBx+FBy+S2+S3-L1-FCx-FCy);
check(6,1) = CrossProduct(punkty(4,:),FBx)+CrossProduct(punkty(4,:),FBy)+...
    CrossProduct(punkty(5,:),S2)+CrossProduct(punkty(6,:),S3)+...
    CrossProduct(punkty(8,:),-L1)+CrossProduct(punkty(7,:),-FCx)+CrossProduct(punkty(7,:),-FCy);

figure
hold on;
line([punkty(3,1);punkty(5,1)],[punkty(3,2);punkty(5,2)]);
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(S2,mnoznik, punkty(3,:), 'black');
RysujSkladowe(-S2,mnoznik, punkty(5,:), 'black');

figure
hold on;
line([punkty(11,1);punkty(2,1)],[punkty(11,2);punkty(2,2)]);
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(S1,mnoznik, punkty(11,:), 'black');
RysujSkladowe(-S1,mnoznik, punkty(2,:), 'black');

figure
hold on;
line(punkty(8:9,1),punkty(8:9,2),'Color','green');
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(L1,mnoznik, punkty(8,:), 'black');
RysujSkladowe(-L1,mnoznik, punkty(9,:), 'black');

figure
hold on;
line([punkty(6,1);punkty(9,1)],[punkty(6,2);punkty(9,2)]);
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(S3,mnoznik, punkty(9,:), 'black');
RysujSkladowe(-S3,mnoznik, punkty(6,:), 'black');

figure
hold on;
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(-S3,mnoznik, punkty(9,:), 'black');
RysujSkladowe(L1,mnoznik, punkty(9,:), 'black');
RysujSkladowe(L2,mnoznik, punkty(9,:), 'black');

check(7:8,1) = (-S3+L1+L2);

figure
hold on;
line(punkty(9:10,1),punkty(9:10,2),'Color','green');
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(-L2,mnoznik, punkty(9,:), 'black');
RysujSkladowe(L2,mnoznik, punkty(10,:), 'black');

figure
hold on;
lopat = [punkty(7,:);punkty(10,:);punkty(12,:)];
fill(lopat(:,1),lopat(:,2),'y');
pbaspect([1 1 1]);
axis(AXIS);
RysujSkladowe(FCx,mnoznik, punkty(7,:), 'black');
RysujSkladowe(FCy,mnoznik, punkty(7,:), 'black');
RysujSkladowe(-L2,mnoznik, punkty(10,:), 'black');
RysujSkladowe([Fx;Fy],mnoznik, punkty(7,:), 'black');

check(9:10,1) = (FCx+FCy-L2+[Fx;Fy]);
check(11,1) = CrossProduct(punkty(7,:),FCx)+CrossProduct(punkty(7,:),FCy)+...
    CrossProduct(punkty(10,:),-L2)+CrossProduct(punkty(7,:),[Fx;Fy])+M;

check
hold off
end

