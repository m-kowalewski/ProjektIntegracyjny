% Generacja danych
clear;
close all;
load('wymiary_baza.mat');
% Tutaj zmiana nr danych
nr_zestawu = 20;
wymiary = data(:,nr_zestawu);
lyzka_zasieg = 396.9;
lyzka_srodek = [150;-200];
maxZakres = ZakresySilownikow(wymiary);
% Format danych dla lopaty zgodnie ze schema


% Podaj zakresy jakie maja dobrane silowniki
s1 = [740,1240];
s2 = [940,1640];
s3 = [1020,1280];

% Walidacja, czy pasuje
% TODO
% Generacja pokrytego obszaru koncowka lyzki

pokrycie = genPokrycie(wymiary,s1,s2,s3,lyzka_zasieg,20);
save('pokrycie.mat','pokrycie');
plot(pokrycie(:,1),pokrycie(:,2),'*');
% Dla wygenerowanego pokrycia wygenerowac sily w zlaczeniach
% Warto wczytac jesli nie zmienilismy wymiarow

zerowane = 0;
w = 1;
for i=1:length(pokrycie)
    if pokrycie(i,1:2) == zeros(1,2)
        zerowane(w) = i;
        w = w + 1;
    end
end

load('pokrycie.mat');
figure
plot(pokrycie(:,1),pokrycie(:,2),'*');
sily = GenSilyNoszenie(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);
SilyOdDlugosci(sily,pokrycie);
sily = GenSilySkrawanieLyzka(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);
SilyOdDlugosci(sily,pokrycie);



s1 = 740;
s2 = 940;
s3 = 975;
% [-45/180*pi,0,0,0,60/180*pi,0,0,0]
% starter = [-0.3184   -0.1557   -0.9960   -1.3039    1.6699    1.1280    1.3675   -4.9207];
starter = [90/180*pi,90/180*pi,30/180*pi,0,0,0,0,0];
starter = [1.2886    1.6755    0.9674    0.9260    4.0702    2.7618    4   2.7899];
katy = WezKaty(wymiary,s1,s2,s3,starter);
RysujMechanizm(wymiary,katy,lyzka_zasieg);


